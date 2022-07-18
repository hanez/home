-- require $HOME/.config/awesome/config.lua for including variables that are
-- different on my systems like config.thermal_zone or config.net_device;
-- this makes sure that widgets are displaying the right value... ;)
-- This file needs to exist. You need to explore this if you want to use my
-- widget stuff!
local config = require("config")
require("lib.functions")

--local math, string, os = math, string, os

gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
lain = require("lain")
--local vain = require("vain")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
local hotkeys_popup = require("awful.hotkeys_popup").widget
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(os.getenv("HOME").."/.config/awesome/themes/hanez/theme.lua")

-- To override the wallpaper provided by the theme you can just add a file named
-- ~/.background.png and then this file will be used as wallpaper. No need
-- to change the theme or this file for that... Even symlinks are working ;)
name = os.getenv("HOME").."/.background.png"
if file_exists(name) then
    beautiful.wallpaper = name
end


-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        --gears.wallpaper.maximized(beautiful.wallpaper, s, true)
        if s < 2 then
          gears.wallpaper.maximized(os.getenv("HOME").."/.background0.png", s, true)
        else
          gears.wallpaper.maximized(os.getenv("HOME").."/.background1.png", s, true)
        end
    end
end
-- }}}


-- This is used later as the default terminal and editor to run.
terminal = '/usr/bin/uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange  -fa "'..config.font_xterm..'" -fs '..config.font_xterm_size
editor = "/usr/bin/vim"
editor_cmd = terminal .. " -e " .. editor

awful.util.terminal = terminal

local modkey = "Mod4"
local altkey = "Mod1"

-- Autostart some programs defined in config.lua; Start them only once... ;)
for i, program in ipairs(config.autostart) do
    run_once(program)
end

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    awful.layout.suit.floating,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- }}}

-- Include the mainmenu from external file to make customisation easier
local mainmenu = require(config.menu)
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Vicious widgets
batterywidget = wibox.widget.textbox()
vicious.register(batterywidget, vicious.widgets.bat, "$1$2% / ", 20, config.battery)

--netwidget = wibox.widget.textbox()
--vicious.register(netwidget, vicious.widgets.net,
--'<span color="green">⇩${'..config.net_device..' down_kb}</span> / <span color="#C83321">${'..config.net_device..' up_kb}⇧</span> ', 1)

thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C ", 20, config.thermal_zone )

--myweather = lain.widget.weather({
--    APPID = config.openweather_api_key,
--    city_id = config.cityid,
--    notification_preset = { font = beautiful.font },
--    notification_text_fun = function (wn)
--                                local day = os.date("%a %d", wn["dt"])
--                                local tmin = math.floor(wn["temp"]["min"])
--                               local tmax = math.floor(wn["temp"]["max"])
--                                local desc = wn["weather"][1]["description"]
--                            return string.format("<b>%s</b>: %s, %d°C/%d°C ", day, desc, tmin, tmax)
--    end,
--})
--myweather.attach(myweather.icon)

cpuwidget = awful.widget.graph()
cpuwidget:set_width(100)
cpuwidget:set_background_color("#000000")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#FF5656"}, {0.5, "#88A175"}, {1, "#AECF96" }}})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- {{{ Wibar
-- Create a textclock widget
--mytextclock = wibox.widget.textclock()
mytextclock = awful.widget.textclock(" %a %b %d, %H:%M:%S ", 1)

-- Create a wibox for each screen and add it
taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

function set_wallpaper(s)
--    -- Wallpaper
--    if beautiful.wallpaper then
--        local wallpaper = beautiful.wallpaper
--        -- If wallpaper is a function, call it with the screen
--        if type(wallpaper) == "function" then
--            wallpaper = wallpaper(s)
--       end
--        gears.wallpaper.maximized(wallpaper, s, false)
--        --gears.wallpaper.centered(wallpaper, s, true)
--    end
-- {{{ Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end

        for s = 1, screen.count() do
            --gears.wallpaper.maximized(beautiful.wallpaper, s, true)
            if s < 2 then
              gears.wallpaper.maximized(os.getenv("HOME").."/.background0.png", s, true)
            else
              gears.wallpaper.maximized(os.getenv("HOME").."/.background1.png", s, true)
            end
        end
    end
-- }}}
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- {{{ Build Taskbar layout
require(config.taskbar)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(

    -- Dropdown application
    awful.key({ modkey,           }, "q", function () awful.screen.focused().quake:toggle() end,
              {description = "dropdown application", group = "launcher"}),

    -- Set backlight
    awful.key({ modkey,           }, "1", function() awful.util.spawn("/usr/bin/xbacklight -set 10") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "2", function() awful.util.spawn("/usr/bin/xbacklight -set 20") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "3", function() awful.util.spawn("/usr/bin/xbacklight -set 30") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "4", function() awful.util.spawn("/usr/bin/xbacklight -set 40") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "5", function() awful.util.spawn("/usr/bin/xbacklight -set 50") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "6", function() awful.util.spawn("/usr/bin/xbacklight -set 60") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "7", function() awful.util.spawn("/usr/bin/xbacklight -set 70") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "8", function() awful.util.spawn("/usr/bin/xbacklight -set 80") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "9", function() awful.util.spawn("/usr/bin/xbacklight -set 90") end,
              { description="set backlight", group="awesome" }),
    awful.key({ modkey,           }, "0", function() awful.util.spawn("/usr/bin/xbacklight -set 100") end,
              { description="set backlight", group="awesome" }),

    awful.key({ modkey,           }, "o", function()
        local handle = io.popen("/usr/bin/xbacklight -get")
        local result = handle:read("*a")
        handle:close()
        result = math.floor(result)
        local newval = tonumber(result) - 5
        awful.util.spawn("/usr/bin/xbacklight -set "..newval)
        end,
        { description="decrease backlight", group="awesome" }),
    awful.key({ modkey,           }, "p", function()
        local handle = io.popen("/usr/bin/xbacklight -get")
        local result = handle:read("*a")
        handle:close()
        result = math.floor(result)
        local newval = tonumber(result) + 5
        awful.util.spawn("/usr/bin/xbacklight -set "..newval)
        end,
        { description="increase backlight", group="awesome" }),
    awful.key({ modkey, altkey    }, "y", function() awful.util.spawn("/usr/bin/killall xautolock") end,
              { description="kill xautolock", group="awesome" }),
    awful.key({ modkey, altkey    }, "x", function() awful.util.spawn("/usr/bin/xautolock -locker slock -time 5") end,
              { description="enable xautolock", group="awesome" }),

    -- Some Application shortcuts
    awful.key({ modkey            }, "e", function() awful.util.spawn("/usr/bin/emulationstation") end,
              { description="start emulationstation", group="awesome" }),
    awful.key({ modkey            }, "v", function() awful.util.spawn("/usr/bin/chromium") end,
              { description="start chromium", group="awesome" }),
    awful.key({ modkey            }, "b", function() awful.util.spawn("/usr/bin/firefox") end,
              { description="start firefox", group="awesome" }),
    awful.key({ modkey            }, "m", function() awful.util.spawn("/usr/bin/birdtray") end,
              { description="start claws-mail", group="awesome" }),
    awful.key({ modkey            }, "c", function() awful.util.spawn(editor_cmd .. " " .. awesome.conffile) end,
              { description="edit awesome configuration", group="awesome" }),
    awful.key({ modkey            }, "z", function() awful.util.spawn(editor_cmd .. " " .. os.getenv("HOME") .. "/.zshrc") end,
              { description="edit zsh configuration", group="awesome" }),
    awful.key({ modkey            }, "y", function() awful.util.spawn("/usr/bin/nemo") end,
              { description="start thunar", group="awesome"}),
    awful.key({ modkey,           }, "u", function() awful.util.spawn("/usr/bin/xdotool click 2") end),
    --awful.key({ modkey, altkey    }, "space", function() awful.util.spawn("/usr/bin/xdotool click 2") end),

    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn("/usr/bin/slock") end,
              { description="lock screen", group="awesome"}),

    -- Copy primary to clipboard (terminals to gtk)
    awful.key({ modkey, altkey    }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ modkey, altkey    }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),

    awful.key({ modkey,           }, "s", hotkeys_popup.show_help,
              { description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left", awful.tag.viewprev,
              { description="view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right", awful.tag.viewnext,
              { description= "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              { description= "go back", group = "tag"}),

    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(1) end,
              { description = "focus next by index", group = "client"}),
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx(-1) end,
              { description = "focus previous by index", group = "client"}),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              { description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              { description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              { description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              { description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              { description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              { description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab", function ()
        awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              { description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "Return", function () awful.util.spawn("/usr/bin/xfce4-terminal") end,
              { description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              { description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              { description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l", function () awful.tag.incmwfact( 0.05) end,
              { description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h", function () awful.tag.incmwfact(-0.05) end,
              { description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h", function () awful.tag.incnmaster( 1, nil, true) end,
              { description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.tag.incnmaster(-1, nil, true) end,
              { description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1, nil, true) end,
              { description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1, nil, true) end,
              { description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(1) end,
              { description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1) end,
              { description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n", function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
            client.focus = c
            c:raise()
        end
        end,
        { description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c", function (c) c:kill() end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o", function (c) c:move_to_screen() end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t", function (c) c.ontop = not c.ontop end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "galculator",
          "megasync",
          "MEGAsync",
          "qjackctl",
        },
        class = {
          "Arandr",
          "Gpick",
          "megasync",
          "MEGAsync",
          "qjackctl",
        },
        name = {
          "Event Tester",  -- xev.
          "megasync",
          "MEGAsync",
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
          "megasync",
          "MEGAsync",
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = config.titlebars_enabled }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
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

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
        client.focus = c
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
