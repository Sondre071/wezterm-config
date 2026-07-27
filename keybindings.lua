local wezterm = require("wezterm")

local act = wezterm.action

local M = {}

function M.build(show_script_picker_fn, show_favorite_paths_picker_fn)
	return {

		-- Menus
		{
			key = "F1",
			action = act.ActivateCommandPalette,
		},
		{
			key = "F2",
			action = wezterm.action_callback(show_script_picker_fn),
		},
		{
			key = "F3",
			action = wezterm.action_callback(show_favorite_paths_picker_fn),
		},

		-- Navigation
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = act.SendKey({
				key = "LeftArrow",
				mods = "CTRL|SHIFT",
			}),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = act.SendKey({
				key = "RightArrow",
				mods = "CTRL|SHIFT",
			}),
		},

		-- Paste
		{
			key = "V",
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},

		-- Tabs
		{
			key = "h",
			mods = "ALT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "l",
			mods = "ALT",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "k",
			mods = "ALT",
			action = act.SpawnTab("DefaultDomain"),
		},
		{
			key = "j",
			mods = "ALT",
			action = act.CloseCurrentPane({ confirm = false }),
		},

		-- Panes
		{
			key = "J",
			mods = "SHIFT|ALT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "L",
			mods = "SHIFT|ALT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},

		{
			key = "h",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Right"),
		},

		-- Scroll
		{
			key = "y",
			mods = "CTRL",
			action = act.ScrollByLine(-1),
		},
		{
			key = "e",
			mods = "CTRL",
			action = act.ScrollByLine(1),
		},
		{
			key = "u",
			mods = "CTRL",
			action = act.ScrollByPage(-1),
		},
		{
			key = "d",
			mods = "CTRL",
			action = act.ScrollByPage(1),
		},
	}
end

return M
