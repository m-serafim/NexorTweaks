# Count Tweaks Script (PowerShell)
# Displays statistics about the tweaks configuration

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectDir = Split-Path -Parent $ScriptDir
$JsonFile = Join-Path $ProjectDir "config\tweaks.json"

Write-Host "===================================" -ForegroundColor Cyan
Write-Host "Tweaks Configuration Statistics" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $JsonFile)) {
    Write-Host "❌ ERROR: Configuration file not found: $JsonFile" -ForegroundColor Red
    exit 1
}

try {
    $jsonContent = Get-Content -Path $JsonFile -Raw
    $tweaks = $jsonContent | ConvertFrom-Json
    
    $tweakCount = ($tweaks | Get-Member -MemberType NoteProperty).Count
    Write-Host "📊 Total Tweaks: $tweakCount" -ForegroundColor White
    
    Write-Host ""
    Write-Host "Tweaks by Category:" -ForegroundColor White
    
    $categories = @{}
    foreach ($prop in ($tweaks | Get-Member -MemberType NoteProperty)) {
        $tweak = $tweaks.($prop.Name)
        $category = $tweak.category
        if (-not $categories.ContainsKey($category)) {
            $categories[$category] = 0
        }
        $categories[$category]++
    }
    
    foreach ($cat in ($categories.Keys | Sort-Object)) {
        Write-Host "  • $cat`: $($categories[$cat])" -ForegroundColor Gray
    }
}
catch {
    Write-Host "❌ Error reading configuration: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
