local beautiful = require("beautiful")
local awful = require("awful")
local gears = require("gears")

local tag_count = 0

local function count_tags() tag_count = tag_count + 1; return tag_count end
local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
screen.connect_signal("property::geometry", set_wallpaper)

local tag = {}

tag[count_tags()] = {
      icon = tag_count..": term",
      properties = {
            _name = "terminals",
            layout = awful.layout.suit.max,
            screen = s
      }
}

tag[count_tags()] = {
      icon = tag_count..": browser",
      properties = {
            _name = "browsers",
            layout = awful.layout.suit.fair,
            screen = s
      }
}

tag[count_tags()] = {
      icon = tag_count..": files",
      properties = {
            _name = "files",
            layout = awful.layout.suit.fair,
            screen = s
      }
}

tag[count_tags()] = {
      icon = tag_count..": dev",
      properties = {
            _name = "dev",
            layout = awful.layout.suit.max,
            screen = s
      }
}

tag[count_tags()] = {
      icon = tag_count..": docs",
      properties = {
            _name = "docs",
            screen = s
      }
}

tag[count_tags()] = {
      icon = tag_count..": media",
      properties = {
            _name = "media",
            layout = awful.layout.suit.max,
            screen = s
      }
}

-- Last Tag
tag[#tag + 1] = {
      icon = (#tag + 1)..": misc",
      properties = {
            _name = "misc",
            layout = awful.layout.suit.max,
            screen = s
      }
}

-- set up tags
awful.screen.connect_for_each_screen( function(s)
      set_wallpaper(s)
      for i = 1, #tag do
            awful.tag.add(tag[i].icon, tag[i].properties)
      end
end)

