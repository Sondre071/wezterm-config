local wezterm = require 'wezterm'

local M = {}

function M.build(show_script_picker_fn, show_favorite_paths_picker_fn)
    return {
        
        -- Menus
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
            action = wezterm.action_callback(show_favorite_paths_picker_fn),
        },
        
        -- Paste
        {
            key = 'V',
            mods = 'CTRL',
            action = wezterm.action.PasteFrom 'Clipboard',
        },
        
        -- Tabs
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
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },

        -- Panes
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

        -- Scroll
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

return M
