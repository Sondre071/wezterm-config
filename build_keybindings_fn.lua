local wezterm = require 'wezterm'

return function(show_script_picker_fn, show_favorite_paths_fn)
    return {
        {
            key = 'F1',
            action = wezterm.action.ActivateCommandPalette,
        },
        {
            key = 'F2',
            action = wezterm.action_callback(show_script_picker_fn),
        },
        {
            key = 'F3',
            action = wezterm.action_callback(show_favorite_paths_fn),
        },
        {
            key = 'J',
            mods = 'SHIFT|ALT',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'L',
            mods = 'SHIFT|ALT',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        {
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },

        {
            key = 'h',
            mods = 'ALT',
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.SpawnTab 'DefaultDomain',
        },
        {
            key = 'h',
            mods = 'CTRL|ALT',
            action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key = 'j',
            mods = 'CTRL|ALT',
            action = wezterm.action.ActivatePaneDirection 'Down',
        },
        {
            key = 'k',
            mods = 'CTRL|ALT',
            action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
            key = 'l',
            mods = 'CTRL|ALT',
            action = wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key = 'y',
            mods = 'CTRL',
            action = wezterm.action.ScrollByLine(-1)
        },
        {
            key = 'e',
            mods = 'CTRL',
            action = wezterm.action.ScrollByLine(1)
        },
        {
            key = 'u',
            mods = 'CTRL',
            action = wezterm.action.ScrollByPage(-1)
        },
        {
            key = 'd',
            mods = 'CTRL',
            action = wezterm.action.ScrollByPage(1)
        },
    }
end
