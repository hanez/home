-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
require('naughty')
vicious = require("vicious")

-- Set programs to autostart. They will only runce once even when reloading awesome.
local autostart = {
    "cbatticon",
    "python3 /usr/bin/brightnessicon",
    "nm-applet",
    "pasystray",
    "xfce4-clipman",
    "xfce4-notes",
}

-- Function definitions.
function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) return true else return false end 
end

-- Check if a program already runs, else start the program.
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
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
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(".config/awesome/themes/hanez/theme.lua")

-- I Don't add wallpapers to the theme because of licensing issues; you need to set
-- this yourself. I recommend to symlink your wallpaper image to
-- ~/images/background.png. I will change this at some time to become more
-- flexible. If you do not add this symlink or file, the awesome's default background 
-- image will be used.
name = os.getenv("HOME").."/images/background.png"
if file_exists(name) then 
    beautiful.wallpaper = name  
end

-- This is used later as the default terminal and editor to run.
terminal = "uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange"
editor = "/usr/bin/vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Autostart programs and make sure  they only run once. 
for i, program in ipairs(autostart) do
    run_once(program)
end

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}

-- Initialize widgets
--local batwidget  = wibox.widget.textbox()
--vicious.register(batwidget, vicious.widgets.bat, " $2%/$3 | ", 20, "BAT0" )

local thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "$1C ", 20, "thermal_zone0" )

cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_background_color("#222222")
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 10,0 }, stops = { {0, "#FF5656"}, {0.5, "#88A175"}, {1, "#AECF96" }}})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- {{{ Menu
-- Create a laucher widget and a main menu
accessoriesmenu = {
    { "calculator", "/usr/bin/galculator", "/usr/share/icons/hicolor/48x48/apps/galculator.png" },
    { "pluma", "/usr/bin/pluma", "/usr/share/icons/Adwaita/48x48/apps/accessories-text-editor.png" },
    { "vim", terminal.." -e /usr/bin/vim", os.getenv("HOME").."/.config/awesome/icons/vim32x32.png" },
}
developmentmenu = {
    { "anjuta", "/usr/bin/anjuta", "/usr/share/icons/hicolor/48x48/apps/anjuta.png" },
    { "eclipse", "/usr/bin/eclipse", "/usr/share/icons/hicolor/48x48/apps/eclipse.png" },
    { "intellij", "/usr/bin/idea.sh", "/usr/share/pixmaps/idea.png" },
    { "monodevelop", "/usr/bin/monodevelop", "/usr/share/icons/hicolor/48x48/apps/monodevelop.png" },
    { "netbeans", "/usr/bin/netbeans", "/usr/share/pixmaps/netbeans.png" },
    { "pycharm", "/usr/bin/pycharm", "/opt/pycharm-community/bin/pycharm.png" },
    { "wxglade", "/usr/bin/wxglade", "/usr/share/pixmaps/wxglade.png" },
}
engineeringmenu = {
    { "arduino", "/usr/bin/arduino", "/usr/share/icons/hicolor/48x48/apps/arduino.png" },
    { "fritzing", "/usr/bin/Fritzing", "/usr/share/icons/fritzing.png" },
}

gamesmenu = {
    { "vba-m", "/usr/bin/gvbam", "/usr/share/icons/hicolor/48x48/apps/vbam.png" },
}
graphicsmenu = {
    { "gimp", "/usr/bin/gimp", "/usr/share/icons/hicolor/48x48/apps/gimp.png" },
    { "inkscape", "/usr/bin/inkscape", "/usr/share/icons/hicolor/48x48/apps/inkscape.png" },
    { "viewnior", "/usr/bin/viewnior", "/usr/share/icons/hicolor/48x48/apps/viewnior.png" },
}
internetmenu = {
    { "chromium", "/usr/bin/chromium", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "claws", "/usr/bin/claws-mail", "/usr/share/icons/hicolor/48x48/apps/claws-mail.png" },
    { "firefox", "/usr/bin/firefox", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "pidgin", "/usr/bin/pidgin", "/usr/share/icons/hicolor/48x48/apps/pidgin.png" },
}
multimediamenu = {
    { "alsamixer", terminal.." -e alsamixer" },
    { "cmus", terminal.." -e cmus" },
    { "kaffeine", "/usr/bin/kaffeine", "/usr/share/icons/hicolor/48x48/apps/kaffeine.png" },
    { "spotify", "/usr/bin/spotify", "/usr/share/spotify/spotify-client/Icons/spotify-linux-22.png" },
    { "vlc", "/usr/bin/vlc", "/usr/share/icons/hicolor/48x48/apps/vlc.png" },
    { "xfce4 mixer", "/usr/bin/xfce4-mixer", "/usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control.png" },
}
officemenu = {
    { "dia", "/usr/bin/dia", "/usr/share/icons/hicolor/48x48/apps/dia.png" },
    { "libreoffice base", "/usr/bin/libreoffice --base", "/usr/share/icons/hicolor/48x48/apps/libreoffice-base.png" },
    { "libreoffice calc", "/usr/bin/libreoffice --calc", "/usr/share/icons/hicolor/48x48/apps/libreoffice-calc.png" },
    { "libreoffice draw", "/usr/bin/libreoffice --draw", "/usr/share/icons/hicolor/48x48/apps/libreoffice-draw.png" },
    { "libreoffice impress", "/usr/bin/libreoffice --impress", "/usr/share/icons/hicolor/48x48/apps/libreoffice-impress.png" },
    { "libreoffice math", "/usr/bin/libreoffice --math", "/usr/share/icons/hicolor/48x48/apps/libreoffice-math.png" },
    { "libreoffice writer", "/usr/bin/libreoffice --writer", "/usr/share/icons/hicolor/48x48/apps/libreoffice-writer.png" },
}
othermenu = {
   
}
sciencemenu = {
    { "stellarium", "/usr/bin/stellarium", "/usr/share/icons/hicolor/48x48/apps/stellarium.png" },
}
systemmenu = {
    { "apache directory studio", "/usr/bin/apachedirectorystudio", "/opt/ApacheDirectoryStudio/ApacheDirectoryStudio.xpm" },
    { "mysql workbench", "/usr/bin/mysql-workbench", "/usr/share/icons/hicolor/48x48/apps/mysql-workbench.png" },
--   { "gufw", "/usr/bin/gufw" },
    { "umongo", "/usr/bin/umongo.sh", "/usr/share/pixmaps/umongo.png" },
    { "virtualbox", "/usr/bin/virtualbox", "/usr/share/pixmaps/VBox.png" },
    { "wireshark", "/usr/bin/wireshark", "/usr/share/icons/hicolor/48x48/apps/wireshark.png" },
}
utilitiesmenu = {
    { "gsshfs", "/usr/bin/gsshfs", "/usr/share/pixmaps/gsshfs.png" },
}
mymainmenu = awful.menu({ items = { 
    { "accessories", accessoriesmenu, beautiful.icon_path.."categories/applications-accessories.png" },
    { "development", developmentmenu, beautiful.icon_path.."categories/applications-development.png" },
    { "engineering", engineeringmenu, beautiful.icon_path.."categories/applications-engineering.png" },
    { "games", gamesmenu, beautiful.icon_path.."categories/applications-games.png" },
    { "graphics", graphicsmenu, beautiful.icon_path.."categories/applications-graphics.png" },
    { "internet", internetmenu, beautiful.icon_path.."categories/applications-internet.png" },
    { "multimedia", multimediamenu, beautiful.icon_path.."categories/applications-multimedia.png" },
    { "office", officemenu, beautiful.icon_path.."categories/applications-office.png" },
--   { "other", othermenu, beautiful.icon_path.."categories/applications-other.png" },
    { "science", sciencemenu, beautiful.icon_path.."categories/applications-science.png" },
    { "system", systemmenu, beautiful.icon_path.."categories/applications-system.png" },
    { "utilities", utilitiesmenu, beautiful.icon_path.."categories/applications-utilities.png" },
    { "filemanager", "/usr/bin/thunar", beautiful.icon_path.."apps/system-file-manager.png" },
    { "open terminal", terminal, beautiful.icon_path.."apps/utilities-terminal.png" },
    { "edit config", editor_cmd .. " " .. awesome.conffile, beautiful.icon_path.."categories/preferences-other.png" },
    { "reload", awesome.restart, beautiful.icon_path.."actions/view-refresh.png" },
    { "quit", awesome.quit, beautiful.icon_path.."actions/system-log-out.png" }
  }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock("%a %b %d, %H:%M:%S ", 1)

-- Create a wibox for each screen and add it
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
    right_layout:add(cpuwidget)
--    right_layout:add(batwidget)
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

    awful.key({ modkey            }, ",", function() awful.util.spawn("/usr/bin/wmgo") end),
    awful.key({ modkey            }, "b", function() awful.util.spawn("/usr/bin/chromium") end),
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
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
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
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
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

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
