local naughty = require "naughty"
local handlers = {}
local in_error = false;

local function notify(preset, title, text)
    naughty.notify {
        preset = preset,
        title = title,
        text = text,
    }
end

function handlers.startup()
    if not awesome.startup_errors then return end;
    local preset = naughty.config.presets.critical;
    local title = "There are startup errors";
    local text = awesome.startup_errors;
end

function handlers.runtime(err)
    if in_error then return end;
    local preset = naughty.config.presets.critical;
    local title = "There are runtime errors";
    local text = tostring(err);
end

return handlers
