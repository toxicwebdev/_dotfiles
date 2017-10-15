local setup = {}

local function check(args, binding)
    local _function = args._function or function()end
    local modifiers = args.modifiers or {}
    local _type = args._type or ""

    assert(binding == nil, "Binding " .. args.name .. " exists")
    assert(type(_function) == "function", "invalid function")
    assert(type(modifiers) == "table", "invalid modifiers")
    assert(_type == "button" or _type == "key", "invalid type")
end

function setup.add(self, args)
    local awful = require "awful"
    local args = args or {}
    local name = args.name or ""
    local _type = args._type or ""
    local modifiers = args.modifiers or {}
    local pressed = args.pressed or nil
    local _function = args._function or function() end

    check(args, self["bindings"][name])
    self["bindings"][name] = awful[_type](modifiers, pressed, _function)
end

function setup.join(self)
    local naughty = require "naughty"
    local gears = require "gears"
    local joined_table = {}
    local count = 1

    for k, v in pairs(self.bindings) do
        naughty.notify {text = "joining " .. k .. ", " .. type(v) .. "..."}

        joined_table[count] = v;

        count = count + 1
    end

    naughty.notify {text = tostring(#joined_table)}

    return joined_table
end

return setup
