local awful = require("awful")
local beautiful = require("beautiful")
local clientkeys = require("bindings.keyboard").client._local

local function get_tag(title)
      local tag = ''
      local tags = awful.screen.focused().tags
      for i = 1, #tags do
            properties = awful.tag.getdata(tags[i]);
            if properties._name == title then
                  tag = tags[i]
            end
      end
      if tag == '' then
            return tags[#tags]
      end
      return tag
end

local rules = {}

rules.all = {}
rules.all.rule = {}
rules.all.properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      keys = clientkeys,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      switchtotag = true,
      tag = awful.screen.focused().tags[#awful.screen.focused().tags],
      titlebars_enabled = false,
}

rules.floating                = {}
rules.floating.rule_any       = {
      instance    = {
            'DTA',  -- Firefox addon DownThemAll.
            'copyq',  -- Includes session name in class.
      },
      class       = {
            'Arandr',
            'Gpick',
            'Kruler',
            'MessageWin',  -- kalarm.
            'Sxiv',
            'Wpa_gui',
            'pinentry',
            'veromix',
            'xtightvncviewer'
      },
      name        = { 'Event Tester' },
      role        = {
            'AlarmWindow',
            'pop-up'
      },
      type        = { 'dialog' }
}
rules.floating.properties     = { floating = true }

rules.terminals = {}
rules.terminals.rule_any = {
      class = { "Termite", },
      instance = { "termite", },
}
rules.terminals.properties = {
      border_width = 1,
      border_color = "#000000",
      tag = get_tag("terminals")
}

rules.browsers = {}
rules.browsers.rule_any = {
      class = { "qutebrowser", "Firefox",
      "Chromium-browser-chromium", "Uzbl-core" },
      role = { "browser" }
}
rules.browsers.properties = {
      border_color = beautiful.border_normal,
      border_width = 2.5,
      maximized = false,
      tag = get_tag("browsers")
}

rules.media = {}
rules.media.rule_any = {
      class = { "mpv", "Kodi", "feh" }
}
rules.media.properties = {
      border_width = 0,
      tag = get_tag("media")
}

rules.documents = {}
rules.documents.rule_any = {
      class = {"zathura"}
}
rules.documents.properties = {
      border_width = 0,
      tag = get_tag("docs")
}

rules.hubstaff = {}
rules.hubstaff.rule = { class = "Hubstaff" }
rules.hubstaff.properties = { floating = true }

rules.dev = {}
rules.dev.rule_any = {
    class = {"dev"},
    instance = {"dev", "RobloxStudioBeta.exe"}
}
rules.dev.properties = {
      border_width = 0,
      tag = get_tag("dev")
}

rules.roblox = {}
rules.roblox.rule = {
    class = "Wine",
    instance = "RobloxStudioBeta.exe"
}
rules.roblox.properties = {
    maximized = true
}

return rules
