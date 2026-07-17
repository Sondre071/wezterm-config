local wezterm = require 'wezterm'

local M = {}

function M.load_path()
    local path = string.format("%s/wezterm/background", os.getenv("LOCALAPPDATA"))
    local file, _ = io.open(path, 'r')

    if not file then
        wezterm.log_error('No background file found in ' .. path)
        return nil
    end

    local content = file:read()
    file:close()

    if content == '' then
        wezterm.log_info('No path for background image found in: ' .. path)
        return nil
    end

    return content
end

return M
