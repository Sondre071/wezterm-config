$ErrorActionPreference = 'Stop'
$path = "C:\Users\$env:USERNAME\AppData\Local\wezterm\favorite_paths"

if (-not (Test-Path $path))
{
    throw "File not found: $path."
}

$currentDirectory = (Get-Location).Path
$fileContent = Get-Content $path

if ($currentDirectory -notin $fileContent)
{
    Write-Host 'Current path already unfavorited.' -ForegroundColor Yellow
    return
}

$fileContent = $fileContent | Where-Object { $_ -ne $currentDirectory }

Set-Content -Path $path -Value $fileContent

$s = "{0}Unfavorited path: {1}$currentDirectory{2}." -f `
    $PSStyle.Foreground.BrightYellow, `
    $PSStyle.Foreground.BrightWhite, `
    $PSStyle.Reset `

Write-Host $s
