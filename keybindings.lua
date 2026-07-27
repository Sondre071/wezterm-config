local wezterm = require("wezterm")

local act = wezterm.action

local function is_vim(pane)
	local success, vim_env = pcall(function()
		return pane:get_user_vars().IS_NVIM
	end)

	return success and vim_env == "true"
end

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
		{
			key = "d",
			mods = "CTRL|SHIFT",
			action = act.ShowDebugOverlay,
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
			key = "v",
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},

		-- Tabs
		{
			key = "h",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "k",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab("DefaultDomain"),
		},
		{
			key = "j",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentPane({ confirm = false }),
		},

		-- Panes
		{
			key = "j",
			mods = "SHIFT|ALT",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "l",
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
			action = wezterm.action_callback(function(window, pane)
				if is_vim(pane) then
					window:perform_action(
						act.SendKey({
							key = "y",
							mods = "CTRL",
						}),
						pane
					)
				else
					window:perform_action(act.ScrollByLine(-1), pane)
				end
			end),
		},
		{
			key = "e",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				if is_vim(pane) then
					window:perform_action(
						act.SendKey({
							key = "e",
							mods = "CTRL",
						}),
						pane
					)
				else
					window:perform_action(act.ScrollByLine(1), pane)
				end
			end),
		},
		{
			key = "u",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				if is_vim(pane) then
					window:perform_action(
						act.SendKey({
							key = "u",
							mods = "CTRL",
						}),
						pane
					)
				else
					window:perform_action(act.ScrollByPage(-1), pane)
				end
			end),
		},
		{
			key = "d",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				if is_vim(pane) then
					window:perform_action(
						act.SendKey({
							key = "d",
							mods = "CTRL",
						}),
						pane
					)
				else
					window:perform_action(act.ScrollByPage(1), pane)
				end
			end),
		},
	}
end

return M
