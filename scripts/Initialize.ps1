$ErrorActionPreference = 'Continue'

$weztermConfigPath = "$env:USERPROFILE/.config/wezterm"
$weztermUserDataPath =  "$env:USERPROFILE/AppData/Local/wezterm"
$scriptNames = @('FavoriteCurrentDirectory.ps1', 'UnfavoriteCurrentDirectory.ps1')

foreach ($name in $scriptNames)
{
    $sourcePath = Join-Path $weztermConfigPath 'scripts' $name
    $symlinkPath = Join-Path $weztermUserDataPath 'scripts' 'Wezterm' $name
    New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $sourcePath -Force
}

$favoritePathsPath = Join-Path $weztermUserDataPath 'favorite_paths'

if (-not (Test-Path $favoritePathsPath))
{
    New-Item -ItemType File -Path $favoritePathsPath
}

$backgroundPath = Join-Path $weztermUserDataPath 'background'

if (-not (Test-Path $backgroundPath))
{
    New-Item -ItemType File -Path $backgroundPath
}
