local awful = require "awful"
local setup = require "bindings.setup"
local variables = require "variables"
local keyboard = {}

-- Global Keys --
keyboard.global = { add = setup.add, join = setup.join, bindings = {}}
keyboard.global.bindings = {}

keyboard.global:add {
    name = "vtagnext",
    _type = "key",
    modifiers = {variables.modKey},
    pressed = "d",
    _function = awful.tag.viewnext,
}

return keyboard
