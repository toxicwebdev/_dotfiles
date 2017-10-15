local awful = require "awful"
local setup = require "bindings.setup"
local mouse = {}
mouse.root = { add = setup.add, join = setup.join }
mouse.root.bindings = {}

mouse.root:add {
    name = "vtagnext",
    _type = "button",
    modifiers = {},
    pressed = 4,
    _function = awful.tag.viewnext,
}
mouse.root:add {
    name = "vtagprev",
    _type = "button",
    modifiers = {},
    pressed = 5,
    _function = awful.tag.viewprev,
}

return mouse
