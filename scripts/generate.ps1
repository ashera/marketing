<#
.SYNOPSIS
  Render a frockd Marketing Studio video via the higgsfield CLI, with a cost
  estimate first (per project rule). Defaults to the known-good launch setup.

.EXAMPLE
  # Cost estimate only (safe default):
  ./scripts/generate.ps1 -PromptFile .\my-prompt.txt

  # Estimate, then actually render (spends credits) and download the result:
  ./scripts/generate.ps1 -Prompt "..." -Go -OutFile output/my-video-raw.mp4

.NOTES
  Reminders baked in from docs/PRODUCTION.md:
   - Spell the brand "frocked" in spoken lines (TTS says "frog" otherwise).
   - Keep spoken dialogue ~30-35 words for a 15s clip.
   - Always review the cost before using -Go.
#>
param(
  [string]$Prompt,
  [string]$PromptFile,
  [string]$Avatar      = "bba3087a-ad14-42c2-b51b-7c22b632abf4", # Sofia
  [string]$Setting     = "b8368076-35eb-4045-b33b-74b2646d9863", # Bedroom
  [string]$WebProduct  = "6f13aabd-2115-40f8-a081-3f4a2a7bb352", # frockd.com.au
  [string]$Image       = "07d06fd7-74df-4930-856b-595bfa0ac944", # listing-detail phone screen
  [string]$Aspect      = "9:16",
  [string]$Resolution  = "1080p",
  [int]   $Duration    = 15,
  [string]$Mode        = "ugc",
  [switch]$Go,                                                   # actually render (spends credits)
  [string]$OutFile     = "output/frockd-render-raw.mp4"
)

if ($PromptFile) { $Prompt = Get-Content $PromptFile -Raw }
if (-not $Prompt) { Write-Error "Provide -Prompt or -PromptFile."; exit 1 }

$common = @(
  "marketing_studio_video",
  "--prompt", $Prompt,
  "--avatars", ('[{"id":"' + $Avatar + '","type":"preset"}]'),
  "--setting_id", $Setting,
  "--web_product_ids", ('["' + $WebProduct + '"]'),
  "--image", $Image,
  "--aspect_ratio", $Aspect,
  "--resolution", $Resolution,
  "--duration", $Duration,
  "--generate_audio", "true",
  "--mode", $Mode
)

Write-Host "==> Cost estimate" -ForegroundColor Cyan
higgsfield generate cost @common --json
if ($LASTEXITCODE -ne 0) { Write-Error "Cost estimate failed."; exit 1 }

if (-not $Go) {
  Write-Host "`nEstimate only. Re-run with -Go to render (spends credits)." -ForegroundColor Yellow
  exit 0
}

Write-Host "`n==> Rendering (this spends credits)" -ForegroundColor Cyan
$json = higgsfield generate create @common --wait --wait-timeout 25m --wait-interval 15s --json
$json
if ($LASTEXITCODE -ne 0) { Write-Error "Render failed."; exit 1 }

# Download the result and remind about logging
try {
  $url = ([regex]::Match($json, '"result_url":\s*"([^"]+)"')).Groups[1].Value
  if ($url) {
    Invoke-WebRequest -Uri $url -OutFile $OutFile -UserAgent "Mozilla/5.0" -TimeoutSec 180
    Write-Host "Saved raw render -> $OutFile" -ForegroundColor Green
  }
} catch { Write-Warning "Could not auto-download: $($_.Exception.Message)" }

Write-Host "`nNext: log prompt (submitted + enhanced) in prompt-log.md, then run scripts/postproduce.sh" -ForegroundColor Yellow
