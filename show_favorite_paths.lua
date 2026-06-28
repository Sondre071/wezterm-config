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