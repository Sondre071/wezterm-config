local wezterm = require 'wezterm'

-- Windows only
local SCRIPTS_PATH = string.format("C:/Users/%s/AppData/Local/wezterm/scripts", os.getenv("USERNAME"))

local function get_script_choices()
    local choices = {}

    for _, path in ipairs(wezterm.glob(SCRIPTS_PATH .. '/*.ps1')) do
        -- Captures last non-slash sequence.
        local filename = path:match('[^/]+$')

        choices[#choices + 1] = { label = filename, id = path }
    end

    for _, path in ipairs(wezterm.glob(SCRIPTS_PATH .. '/*/*.ps1')) do
        -- Captures last two non-slash sequences.
        local dirname, filename = path:match('([^/]+)/([^/]+)$')

        choices[#choices + 1] = { label = dirname .. ' / ' .. filename, id = path }
    end

    return choices
end

local function show_picker(window, pane)
    local choices = get_script_choices()

    if #choices == 0 then
        wezterm.log_error('No .ps1 scripts found in ' .. SCRIPTS_PATH)
        return
    end

    window:perform_action(
        wezterm.action.InputSelector {
            title = 'Run Script',
            choices = choices,
            --fuzzy = true,
            action = wezterm.action_callback(function(win, pn, id, _label)
                if not id then return end
                pn:send_text('& "' .. id .. '"\r')
            end),
        },
        pane
    )
end

return show_picker
