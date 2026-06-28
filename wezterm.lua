local wezterm = require 'wezterm'

local build_keybindings_fn = require 'build_keybindings_fn'
local show_scripts_fn = require 'show_scripts_fn'
local show_favorite_paths_fn = require 'show_favorite_paths_fn'
local background_image = require 'get_background'

local config = wezterm.config_builder()

-- Window
config.initial_cols = 120
config.initial_rows = 28
config.window_decorations = 'RESIZE'
config.default_prog = { 'pwsh' }
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- Text
config.font_size = 10
config.font = wezterm.font { family = 'JetBrains Mono', weight = 'DemiBold' }
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- Disables liagures.
config.color_scheme = 'Campbell (Gogh)'
config.line_height = 1.05

-- Cursor
config.default_cursor_style = 'SteadyUnderline'

-- Background
config.text_background_opacity = 0.2
config.background = {
    {
        source = {
            File = background_image
        },
        width = 'Cover',
        hsb = {
            brightness = 0.12,
            saturation = 0.75
        }
    }
}

-- Tabs
config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.4,
}

-- Panes
config.colors = {
    split = '#555555',
}

config.keys = build_keybindings_fn(show_scripts_fn, show_favorite_paths_fn)

return config
