local wezterm = require 'wezterm'

local keybindings = require 'keybindings'
local scripts = require 'scripts'
local favorite_paths = require 'favorite_paths'
local background = require 'background'

local background_image = background.load_path()

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
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- Background
config.text_background_opacity = 0.2

if background_image then
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
end

-- Tabs
config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.4,
}

-- Panes
config.colors = {
    split = '#555555',
}

config.keys = keybindings.build(scripts.show_picker, favorite_paths.show_picker)

return config
