$ErrorActionPreference = 'Continue'

$configPath = "$env:USERPROFILE/.config/wezterm"
$userDataPath = "$env:USERPROFILE/.config/powershell"

$scriptNames = @('FavoriteCurrentDirectory.ps1', 'UnfavoriteCurrentDirectory.ps1')

if (-not (Test-Path $userDataPath))
{
    New-Item -ItemType Directory -Path $userDataPath
}

foreach ($name in $scriptNames)
{
    $sourcePath = Join-Path $configPath 'scripts', $name
    $symlinkPath = Join-Path $userDataPath 'scripts', 'WezTerm', $name

    New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $sourcePath -Force
}

$favoritePathsPath = Join-Path $userDataPath 'favorite_paths'

if (-not (Test-Path $favoritePathsPath))
{
    New-Item -ItemType File -Path $favoritePathsPath
}

$backgroundConfigPath = Join-Path $userDataPath 'background'

if (-not (Test-Path $backgroundConfigPath))
{
    New-Item -ItemType File -Path $backgroundConfigPath
}

$backgroundsPath = Join-Path $userDataPath 'backgrounds'

if (-not (Test-Path $backgroundsPath))
{
    New-Item -ItemType Directory -Path $backgroundsPath
}
