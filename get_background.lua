local wezterm = require 'wezterm'

local BACKGROUND_DATA_PATH = string.format("C:/Users/%s/AppData/Local/wezterm/background", os.getenv("USERNAME"))

local file, _ = io.open(BACKGROUND_DATA_PATH, 'r')

if not file then
    wezterm.log_error('No background file found in ' .. BACKGROUND_DATA_PATH)
    return nil
end

local content = file:read('a')

file:close()

return content