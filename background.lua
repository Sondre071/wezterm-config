local wezterm = require 'wezterm'

local M = {}

function M.load()
    local path = string.format("%s/wezterm/background", os.getenv("LOCALAPPDATA"))

    local success, file_iterator = pcall(io.lines, path)

    if not success then
        wezterm.log_info('No background file found in: ' .. path)
        return nil
    end

    local lines = {}
    for line in file_iterator do
        table.insert(lines, line)
    end

    local image_path = lines[1]
    local brightness = tonumber(lines[2])
    local saturation = tonumber(lines[3])

    if image_path == nil or image_path == '' then
        wezterm.log_warn('No background image path found in: ' .. path)
        return nil
    end

    if brightness == nil then
        wezterm.log_warn('No brightness found in: ' .. path)
        return nil
    end

    if saturation == nil then
        wezterm.log_warn('No saturation found in: ' .. path)
        return nil
    end

    return {
        {
            source = {
                File = image_path
            },
            width = 'Cover',
            hsb = {
                brightness = brightness,
                saturation = saturation
            }
        }
    }
end

return M
