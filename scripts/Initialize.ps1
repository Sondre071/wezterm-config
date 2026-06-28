$ErrorActionPreference = 'Continue'

$configPath = "$env:USERPROFILE/.config/wezterm"
$userDataPath =  "$env:USERPROFILE/AppData/Local/wezterm"

$scriptNames = @('FavoriteCurrentDirectory.ps1', 'UnfavoriteCurrentDirectory.ps1')

foreach ($name in $scriptNames)
{
    $sourcePath = Join-Path $configPath 'scripts' $name
    $symlinkPath = Join-Path $userDataPath 'scripts' 'Wezterm' $name
    New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $sourcePath -Force
}

$favoritePathsPath = Join-Path $userDataPath 'favorite_paths'

if (-not (Test-Path $favoritePathsPath))
{
    New-Item -ItemType File -Path $favoritePathsPath
}

$backgroundPath = Join-Path $userDataPath 'background'

if (-not (Test-Path $backgroundPath))
{
    New-Item -ItemType File -Path $backgroundPath
}
