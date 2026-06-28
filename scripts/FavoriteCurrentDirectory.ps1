$ErrorActionPreference = 'Stop'
$path = "C:\Users\$env:USERNAME\AppData\Local\wezterm\favorite_paths"

if (-not (Test-Path $path))
{
    throw "File not found: $path."
}

$currentDirectory = (Get-Location).Path
$existingContent = Get-Content $path

if ($currentDirectory -in $existingContent)
{
    Write-Host 'Current path already favorited.' -ForegroundColor Yellow
    return
}

Add-Content -Path $path -Value $currentDirectory

$s = "{0}Favorited path: {1}$currentDirectory{2}." -f `
    $PSStyle.Foreground.BrightYellow, `
    $PSStyle.Foreground.BrightWhite, `
    $PSStyle.Reset `

Write-Host $s
