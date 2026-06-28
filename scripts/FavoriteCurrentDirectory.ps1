$ErrorActionPreference = 'Stop'

$path = "$env:USERPROFILE\AppData\Local\wezterm\favorite_paths"

if (-not (Test-Path $path))
{
    New-Item -ItemType File -Path $path
}

$existingContent = @(Get-Content $path)

$currentDirectory = (Get-Location).Path

if ($currentDirectory -in $existingContent)
{
    Write-Host 'Current path already favorited.' -ForegroundColor Yellow
    return
}

$updatedContent = @($existingContent + $currentDirectory) | Sort-Object

Set-Content -Path $path -Value $updatedContent

$s = "{0}Favorited path: {1}$currentDirectory{2}." -f `
    $PSStyle.Foreground.BrightYellow, `
    $PSStyle.Foreground.BrightWhite, `
    $PSStyle.Reset

Write-Host $s
