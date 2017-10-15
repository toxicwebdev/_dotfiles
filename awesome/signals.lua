local signals = {}

function signals.manage_new_client(c) --{{{1
    local startup = awesome.startup;
    local user_position = c.size_hints.user_position;
    local program_position = c.size_hints.program_position;

    if not startup or user_position or program_position then return end

    awful.placement.no_offscreen(c);
end

function signals.add_titlebars() --{{{1
    local awful = require "awful"
    local wibox = require "wibox"
    local titlebars = awful.titlebar
    local layout = wibox.layout
    -- add buttons to the title bars --
    -- setup the title bars --
    titlebar(c):setup {
        {
            titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = layout.fixed.horizontal,
        },
        {
            {
                align = "center",
                widget = titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = layout.flex.horizontal,
        },
        {
            titlebar.widget.floatingbutton (c),
            titlebar.widget.maximizedbutton(c),
            titlebar.widget.stickybutton   (c),
            titlebar.widget.ontopbutton    (c),
            titlebar.widget.closebutton    (c),
            layout = layout.fixed.horizontal()
        },
        layout = layout.align.horizontal,
    }
end

function signals.sloppy_focus(c) --{{{1
    local awful = require "awful"
    local screen = awful.layout.get(c.screen)
    local focus = awful.client.focus.filter(c)

    if screen == awful.layout.suit.modifier or not focus then return end
    cilent.focus = c
    client:raise()
end

--}}}1

return signals
