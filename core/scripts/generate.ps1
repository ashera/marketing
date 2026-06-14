<#
.SYNOPSIS
  Render a Marketing Studio video via the higgsfield CLI, with a cost estimate
  first (per project rule). Product-specific IDs/params come from a product
  config JSON (see products/<name>/product.json); CLI params override the config.

.EXAMPLE
  # Cost estimate only (safe default):
  ./core/scripts/generate.ps1 -Config products/frockd/product.json -PromptFile prompt.txt

  # Estimate, then render (spends credits) and download the raw result:
  ./core/scripts/generate.ps1 -Config products/frockd/product.json -Prompt "..." -Go `
      -OutFile products/frockd/output/my-video-raw.mp4

.NOTES
  Reminders (see core/docs/PRODUCTION.md):
   - Spell the brand phonetically in spoken lines (TTS mangles unfamiliar spellings).
   - Keep spoken dialogue ~30-35 words for a 15s clip.
   - Always review the cost before using -Go.
#>
param(
  [string]$Config,
  [string]$Prompt,
  [string]$PromptFile,
  [string]$Avatar,
  [string]$Setting,
  [string]$WebProduct,
  [string]$Image,
  [string]$Aspect,
  [string]$Resolution,
  [int]   $Duration = 0,
  [string]$Mode,
  [switch]$Go,
  [string]$OutFile = "output/render-raw.mp4"
)

function Coalesce($a, $b) { if ($a) { $a } else { $b } }

$cfg = $null
if ($Config) {
  if (-not (Test-Path $Config)) { Write-Error "Config not found: $Config"; exit 1 }
  $cfg = Get-Content $Config -Raw | ConvertFrom-Json
}

# Precedence: CLI param > config value > built-in fallback.
$Avatar     = Coalesce $Avatar     (Coalesce $cfg.avatar      "")
$Setting    = Coalesce $Setting    (Coalesce $cfg.setting     "")
$WebProduct = Coalesce $WebProduct (Coalesce $cfg.web_product "")
$Image      = Coalesce $Image      (Coalesce $cfg.image       "")
$Aspect     = Coalesce $Aspect     (Coalesce $cfg.aspect      "9:16")
$Resolution = Coalesce $Resolution (Coalesce $cfg.resolution  "1080p")
if ($Duration -le 0) { $Duration = [int](Coalesce $cfg.duration 15) }
$Mode       = Coalesce $Mode       (Coalesce $cfg.mode        "ugc")

if ($PromptFile) { $Prompt = Get-Content $PromptFile -Raw }
if (-not $Prompt) { Write-Error "Provide -Prompt or -PromptFile."; exit 1 }
if (-not $Avatar) { Write-Error "No avatar id (set 'avatar' in -Config or pass -Avatar)."; exit 1 }

$cli = @(
  "marketing_studio_video",
  "--prompt", $Prompt,
  "--avatars", ('[{"id":"' + $Avatar + '","type":"preset"}]'),
  "--aspect_ratio", $Aspect,
  "--resolution", $Resolution,
  "--duration", $Duration,
  "--generate_audio", "true",
  "--mode", $Mode
)
if ($Setting)    { $cli += @("--setting_id", $Setting) }
if ($WebProduct) { $cli += @("--web_product_ids", ('["' + $WebProduct + '"]')) }
if ($Image)      { $cli += @("--image", $Image) }

Write-Host "==> Cost estimate" -ForegroundColor Cyan
higgsfield generate cost @cli --json
if ($LASTEXITCODE -ne 0) { Write-Error "Cost estimate failed."; exit 1 }

if (-not $Go) {
  Write-Host "`nEstimate only. Re-run with -Go to render (spends credits)." -ForegroundColor Yellow
  exit 0
}

Write-Host "`n==> Rendering (this spends credits)" -ForegroundColor Cyan
$json = higgsfield generate create @cli --wait --wait-timeout 25m --wait-interval 15s --json
$json
if ($LASTEXITCODE -ne 0) { Write-Error "Render failed."; exit 1 }

try {
  $url = ([regex]::Match($json, '"result_url":\s*"([^"]+)"')).Groups[1].Value
  if ($url) {
    Invoke-WebRequest -Uri $url -OutFile $OutFile -UserAgent "Mozilla/5.0" -TimeoutSec 180
    Write-Host "Saved raw render -> $OutFile" -ForegroundColor Green
  }
} catch { Write-Warning "Could not auto-download: $($_.Exception.Message)" }

Write-Host "`nNext: log prompt (submitted + enhanced) in the product's prompt-log.md, then run core/scripts/postproduce.sh" -ForegroundColor Yellow
