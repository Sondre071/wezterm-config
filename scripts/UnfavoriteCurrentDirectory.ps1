$ErrorActionPreference = 'Stop'

$path = "$env:USERPROFILE\AppData\Local\wezterm\favorite_paths"

if (-not (Test-Path $path))
{
    New-Item -ItemType File -Path $path
}

$existingContent = Get-Content $path

$currentDirectory = (Get-Location).Path

if ($currentDirectory -notin $fileContent)
{
    Write-Host 'Current path already not favorited.' -ForegroundColor Yellow
    return
}

$updatedContent = $existingContent | Where-Object { $_ -ne $currentDirectory }

Set-Content -Path $path -Value $updatedContent

$s = "{0}Unfavorited path: {1}$currentDirectory{2}." -f `
    $PSStyle.Foreground.BrightYellow, `
    $PSStyle.Foreground.BrightWhite, `
    $PSStyle.Reset

Write-Host $s
