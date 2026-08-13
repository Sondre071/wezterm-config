$ErrorActionPreference = 'Continue'

$userDataDir = "$env:USERPROFILE/.config/terminal"

$scriptNames = @('FavoriteCurrentDirectory.nu', 'UnfavoriteCurrentDirectory.nu')

if (-not (Test-Path $userDataDir))
{
    New-Item -ItemType Directory -Path $userDataDir
}

foreach ($name in $scriptNames)
{
    $sourcePath = Join-Path $PSScriptRoot $name
    $symlinkPath = Join-Path $userDataDir 'scripts', 'Terminal', $name

    New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $sourcePath -Force
}

$favoritePathsPath = Join-Path $userDataDir 'favorite_paths'

if (-not (Test-Path $favoritePathsPath))
{
    New-Item -ItemType File -Path $favoritePathsPath
}

$backgroundConfigPath = Join-Path $userDataDir 'background.json'

if (-not (Test-Path $backgroundConfigPath))
{
    New-Item -ItemType File -Path $backgroundConfigPath
}

