-- require $HOME/.config/awesome/private.lua for including variables that are different on 
-- my systems like private.thermal_zone or private.net_device; this makes sure that widgets
-- are displaying the right value... ;)
-- This file needs to exist. You need to explore this if you want to use my widget stuff!
require("private")
require("functions")

-- Require some basic stuff
local gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
vicious = require("vicious")

if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end

beautiful.init(os.getenv("HOME").."/.config/awesome/themes/hanez/theme.lua")

-- To override the wallpaper provided by the theme you can just add a file named
-- ~/images/background.png and then this file will be used as wallpaper. No need
-- to change the theme or this file for that... ;)
name = os.getenv("HOME").."/images/background.png"
if file_exists(name) then 
    beautiful.wallpaper = name  
end

terminal = '/usr/bin/uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange  -fa "'..private.font_xterm..'" -fs '..private.font_xterm_size 
editor = "/usr/bin/vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

for i, program in ipairs(private.autostart) do
    run_once(program)
end

local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

tags = {}
for s = 1, screen.count() do
    tags[s] = awful.tag({ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D' }, s, layouts[1])
end

-- Include the mainmenu from external file to make customisation easier
require("mymainmenu")
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

local batterywidgets = {}
for i=1, tablelength(private.battery) do
    batterywidgets[i] = wibox.widget.textbox()
    vicious.register(batterywidgets[i], vicious.widgets.bat, "$1$2% / ", 20, private.battery[i])
end

local netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, '<span color="green">⇩${'..private.net_device..' down_kb}</span> / <span color="#C83321">${'..private.net_device..' up_kb}⇧</span> ', 1)

local thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C ", 20, private.thermal_zone )

cpuwidget = awful.widget.graph()
cpuwidget:set_width(100)
cpuwidget:set_background_color("#222222")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#FF5656"}, {0.5, "#88A175"}, {1, "#AECF96" }}})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

mytextclock = awful.widget.textclock(" %a %b %d, %H:%M:%S ", 1)

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(netwidget)
    right_layout:add(cpuwidget)
    for i=1, tablelength(batterywidgets) do
        right_layout:add(batterywidgets[i])
    end

    right_layout:add(thermalwidget)
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Set backlight
    awful.key({ modkey, "Mod1"    }, "1", function() awful.util.spawn("/usr/bin/xbacklight -set 10") end),
    awful.key({ modkey, "Mod1"    }, "2", function() awful.util.spawn("/usr/bin/xbacklight -set 20") end),
    awful.key({ modkey, "Mod1"    }, "3", function() awful.util.spawn("/usr/bin/xbacklight -set 30") end),
    awful.key({ modkey, "Mod1"    }, "4", function() awful.util.spawn("/usr/bin/xbacklight -set 40") end),
    awful.key({ modkey, "Mod1"    }, "5", function() awful.util.spawn("/usr/bin/xbacklight -set 50") end),
    awful.key({ modkey, "Mod1"    }, "6", function() awful.util.spawn("/usr/bin/xbacklight -set 60") end),
    awful.key({ modkey, "Mod1"    }, "7", function() awful.util.spawn("/usr/bin/xbacklight -set 70") end),
    awful.key({ modkey, "Mod1"    }, "8", function() awful.util.spawn("/usr/bin/xbacklight -set 80") end),
    awful.key({ modkey, "Mod1"    }, "9", function() awful.util.spawn("/usr/bin/xbacklight -set 90") end),
    awful.key({ modkey, "Mod1"    }, "0", function() awful.util.spawn("/usr/bin/xbacklight -set 100") end),

    awful.key({ modkey, "Mod1"    }, "o", function()
                                            local handle = io.popen("/usr/bin/xbacklight -get")
                                            local result = handle:read("*a")
                                            handle:close()
                                            result = math.floor(result)
                                            local newval = tonumber(result) - 5
                                            awful.util.spawn("/usr/bin/xbacklight -set "..newval)
                                          end),

    awful.key({ modkey, "Mod1"    }, "p", function()
                                            local handle = io.popen("/usr/bin/xbacklight -get")
                                            local result = handle:read("*a")
                                            handle:close()
                                            result = math.floor(result)
                                            local newval = tonumber(result) + 5
                                            awful.util.spawn("/usr/bin/xbacklight -set "..newval)
                                          end),
    
    awful.key({ modkey, "Mod1"    }, "y", function() awful.util.spawn("/usr/bin/killall xautolock") end),
    awful.key({ modkey, "Mod1"    }, "x", function() awful.util.spawn("/usr/bin/xautolock -locker slock -time 5") end),

    -- Some Application shortcuts
    awful.key({ modkey            }, "v", function() awful.util.spawn("/usr/bin/chromium") end),
    awful.key({ modkey            }, "b", function() awful.util.spawn("/usr/bin/firefox") end),
    awful.key({ modkey            }, "n", function() awful.util.spawn("/usr/bin/thunderbird") end),
    awful.key({ modkey            }, "m", function() awful.util.spawn("/usr/bin/claws-mail") end),

    awful.key({ modkey            }, "c", function()
                                              awful.util.spawn(editor_cmd .. " " .. awesome.conffile) end),
    awful.key({ modkey            }, "z", function()
                                              awful.util.spawn(editor_cmd .. " " .. os.getenv("HOME") .. "/.zshrc") end),
    awful.key({ modkey            }, "y", function() awful.util.spawn("/usr/bin/thunar") end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn("/usr/bin/slock") end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),
    
    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

root.keys(globalkeys)

awful.rules.rules = {
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { instance = "plugin-container" },
      properties = { floating = true } },
}

client.connect_signal("manage", function (c, startup)
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
