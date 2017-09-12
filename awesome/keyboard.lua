local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local naughty = require("naughty")
local modkey = "Mod4"
local terminal = "termite"

--define keyboard table and all member tables/variables
local keyboard = {}
keyboard.is_edit_mode = false
keyboard.awesome = ''
keyboard.toggle_key = ''
keyboard.tags = ''
keyboard.layout = ''
keyboard.client = {}
keyboard.client.global = ''
keyboard.client._local = ''
keyboard.shortcuts = ''

keyboard.awesome = gears.table.join(
awful.key({modkey}, "/", hotkeys_popup.show_help,
{description = "show help", group = "awesome"}),
awful.key({modkey, "Control"}, "r", awesome.restart,
{description = "reload awesome", group = "awesome"}),
awful.key({modkey, "Control"}, "q", awesome.quit,
{description = "quit awesome", group = "awesome"}))

keyboard.layout = gears.table.join(
awful.key({modkey}, "space", function()
      awful.layout.inc(1)
end,
{description = "next layout", group = "layout"}),
awful.key({modkey, "Shift"}, "space", function()
      awful.layout.inc(-1)
end,
{description = "previous layout", group = "layout"})
)

keyboard.shortcuts = gears.table.join(
awful.key({modkey}, "Return", function() awful.spawn(terminal) end,
{description = "open terminal", group = "shortcuts"}),
awful.key({modkey}, "r", function()
      awful.screen.focused().mypromptbox:run()
end,
{description = "run prompt", group = "shortcuts"}))

--switch edit mode on/off when toggle_key is pressed
keyboard.switch_mode = function()
      naughty.notify{text = "switch_mode called: "..tostring(keyboard.is_edit_mode)}
      --normal bindings
      keyboard.toggle_key = awful.key({modkey}, "i", function()
            keyboard.is_edit_mode = not keyboard.is_edit_mode
            keyboard.switch_mode()
            naughty.notify{text = "edit mode: on"}
      end,
      {description = "edit mode on/off", group = "mode"})

      keyboard.tags = gears.table.join(
      awful.key({modkey}, "h", awful.tag.viewnext,
      {description = "view next tag", group = "tag: normal/edit"}),
      awful.key({modkey}, "u", awful.tag.viewprev,
      {description = "view previous tag", group = "tag: normal/edit"}))

      keyboard.client.global = gears.table.join(
      awful.key({modkey}, "e", function()
            awful.client.focus.bydirection("up")
      end,
      {description = "focus/swap client up", group = "client: normal/edit"}),
      awful.key({modkey}, "o", function()
            awful.client.focus.bydirection("down")
      end,
      {description = "focus/swap client down", group = "client: normal/edit"}),
      awful.key({modkey}, "t", function()
            awful.client.focus.bydirection("left")
      end,
      {description = "focus/swap client left", group = "client: normal/edit"}),
      awful.key({modkey}, "n", function()
            awful.client.focus.bydirection("right")
      end,
      {description = "focus/swap client right", group = "client: normal/edit"}),
      awful.key({modkey}, "Tab", function()
            awful.client.focus.byidx(1)
      end,
      {description = "focus/swap client cycle next", group = "client: normal/edit"}),
      awful.key({modkey, "Shift"}, "Tab", function()
            awful.client.focus.byidx(-1)
      end,
      {description = "focus/swap client cycle next", group = "client: normal/edit"}))

      -- different key-bindings based on mode
      if keyboard.is_edit_mode then
            keyboard.toggle_key = awful.key({}, "Escape", function()
                  keyboard.is_edit_mode = not keyboard.is_edit_mode
                  keyboard.switch_mode()
                  naughty.notify{text = "edit mode: off"}
            end,
            {description = "edit mode on/off", group = "mode"})
            keyboard.tags = gears.table.join(
            awful.key({modkey}, "h", function()
                  awful.tag.incmwfact(0.05)
            end),
            awful.key({modkey}, "u", function()
                  awful.tag.incmwfact(-0.05)
            end),
            awful.key({modkey}, "+", function()
                  awful.tag.incnmaster(1, nil, true)
            end,
            {description = "increase master count", group = "tag"}),
            awful.key({modkey}, "-", function()
                  awful.tag.incnmaster(-1, nil, true)
            end,
            {description = "decrease master count", group = "tag"}),
            awful.key({modkey, "Shift"}, "+", function()
                  awful.tag.incncol(1, nil, true)
            end,
            {description = "increase column count", group = "tag"}),
            awful.key({modkey, "Shift"}, "-", function()
                  awful.tag.incncol(-1, nil, true)
            end,
            {description = "decrease column count", group = "tag"}))

            keyboard.client.global = gears.table.join(
            awful.key({modkey}, "e", function()
                  awful.client.swap.bydirection("up")
            end),
            awful.key({modkey}, "o", function()
                  awful.client.swap.bydirection("down")
            end),
            awful.key({modkey}, "t", function()
                  awful.client.swap.bydirection("left")
            end),
            awful.key({modkey}, "n", function()
                  awful.client.swap.bydirection("right")
            end),
            awful.key({modkey}, "Tab", function()
                  awful.client.swap.byidx(1)
            end),
            awful.key({modkey, "Control"}, "Tab", function()
                  awful.client.swap.byidx(-1)
            end))

      end

      keyboard.client._local = gears.table.join(
      awful.key({modkey,}, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}))

      root.keys(gears.table.join(
      keyboard.awesome,
      keyboard.toggle_key,
      keyboard.tags,
      keyboard.layout,
      keyboard.client.global,
      keyboard.shortcuts
      ))
end

keyboard.switch_mode()

return keyboard
