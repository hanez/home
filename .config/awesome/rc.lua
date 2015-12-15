-- Require some basic stuff
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
vicious = require("vicious")

-- require $HOME/.config/awesome/private.lua for including variables that are different on 
-- my systems like private.thermal_zone or private.net_device; this makes sure that widgets
-- are displaying the right value... ;)
-- This file needs to exist. You need to explore this if you want to use my widget stuff!
require("private")

-- Set programs to autostart. They will only runce once even when reloading awesome.
local autostart = {
    "cbatticon",
    "python3 /usr/bin/brightnessicon",
    "nm-applet",
    "pasystray",
    "xfce4-clipman",
    "xfce4-notes",
}

function file_exists(name)
    local f = io.open(name, "r")
    if f~=nil then io.close(f) return true else return false end 
end

function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

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

terminal = "/usr/bin/uxterm -bg black -fg grey -sb -leftbar -si -bc -cr orange" 
editor = "/usr/bin/vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

for i, program in ipairs(autostart) do
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
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

tags = {}
for s = 1, screen.count() do
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end

accessoriesmenu = {
    { "calculator", "/usr/bin/galculator", "/usr/share/icons/hicolor/48x48/apps/galculator.png" },
    { "engrampa", "/usr/bin/engrampa", "/usr/share/icons/hicolor/32x32/apps/engrampa.png" },
    { "ghex", "/usr/bin/ghex ", "/usr/share/icons/hicolor/48x48/apps/ghex.png" },
    { "gnu privacy agent", "/usr/bin/gpa", "/usr/share/pixmaps/gpa.png" },
    { "pluma", "/usr/bin/pluma", "/usr/share/icons/Adwaita/48x48/apps/accessories-text-editor.png" },
    { "retext", "/usr/bin/retext ", "/usr/share/icons/hicolor/48x48/apps/retext.png" },
    { "seahorse", "/usr/bin/seahorse", "/usr/share/icons/hicolor/48x48/apps/seahorse.png" },
    { "vim", terminal.." -e /usr/bin/vim", os.getenv("HOME").."/.config/awesome/icons/vim32x32.png" },
    { "xarchiver", "xarchiver", "/usr/share/icons/hicolor/48x48/apps/xarchiver.png" },
}
developmentmenu = {
    { "android studio", "/usr/bin/android-studio ", "/usr/share/pixmaps/android-studio.png" },
    { "anjuta", "/usr/bin/anjuta", "/usr/share/icons/hicolor/48x48/apps/anjuta.png" },
    { "clion", "/usr/bin/clion", "/usr/share/pixmaps/clion.svg" },
    { "eclipse", "/usr/bin/eclipse", "/usr/share/icons/hicolor/48x48/apps/eclipse.png" },
    { "glade", "/usr/bin/glade", "/usr/share/icons/hicolor/48x48/apps/glade.png" },
    { "glade2", "/usr/bin/glade-2 ", "/usr/share/pixmaps/glade-2.png" },
    { "intellij", "/usr/bin/idea.sh", "/usr/share/pixmaps/idea.png" },
    { "lazarus", "/usr/bin/lazarus", "/usr/share/pixmaps/lazarus.png" },
    { "liteide", "/usr/bin/liteide", "/usr/share/pixmaps/liteide.png" },
    { "monodevelop", "/usr/bin/monodevelop", "/usr/share/icons/hicolor/48x48/apps/monodevelop.png" },
    { "netbeans", "/usr/bin/netbeans", "/usr/share/pixmaps/netbeans.png" },
    { "pycharm", "/usr/bin/pycharm", "/opt/pycharm-community/bin/pycharm.png" },
    { "qgit", "/usr/bin/qgit", "/usr/share/pixmaps/qgit.png" },
    { "qtcreator", "/usr/bin/qtcreator", "/usr/share/icons/hicolor/48x48/apps/QtProject-qtcreator.png" },
    { "wxglade", "/usr/bin/wxglade", "/usr/share/pixmaps/wxglade.png" },
    { "zbstudio", "/usr/bin/zbstudio", "/usr/share/icons/hicolor/48x48/apps/zbstudio.png" },
}
engineeringmenu = {
    { "arduino", "/usr/bin/arduino", "/usr/share/icons/hicolor/48x48/apps/arduino.png" },
    { "eagle", "/home/hanez/bin/eagle", "/usr/share/pixmaps/eagle.png" },
    { "energia", "/usr/bin/energia", "/usr/share/pixmaps/energia_48.png" },
    { "freecad", "/usr/bin/freecad", "/usr/share/freecad/freecad-icon-48.png" },
    { "fritzing", "/usr/bin/Fritzing", "/usr/share/icons/fritzing.png" },
    { "gqrx", "/usr/bin/gqrx", "/usr/share/pixmaps/gqrx.png" },
    { "kicad", "/usr/bin/kicad", "/usr/share/icons/hicolor/48x48/apps/kicad.png" },
    { "leocad", "/usr/bin/leocad", "/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.leocad.svg" },
    { "librecad", "/usr/bin/librecad", "/usr/share/icons/hicolor/scalable/apps/librecad.svg" },
    { "openscad", "/usr/bin/openscad", "/usr/share/pixmaps/openscad.png" },
    { "processing", "/usr/bin/processing", "/usr/share/pixmaps/processing.png" },
    { "qcad", "/usr/bin/qcad", "/usr/share/pixmaps/qcad_icon.png" },
    { "qucs", "/usr/bin/qucs", "/usr/share/icons/hicolor/48x48/apps/qucs.png" },
}
gamesmenu = {
    { "0 a.d.", "/usr/bin/0ad", "/usr/share/pixmaps/0ad.png" },
    { "extreme tux racer", "/usr/bin/etr", "/usr/share/pixmaps/etr.png" },
    { "gvbam", "/usr/bin/gvbam", "/usr/share/icons/hicolor/48x48/apps/vbam.png" },
    { "supertux 2", "/usr/bin/supertux2", "/usr/share/pixmaps/supertux.png" },
}
graphicsmenu = {
    { "blender", "/usr/bin/blender", "/usr/share/icons/hicolor/48x48/apps/blender.png" },
    { "font manager", "/usr/bin/font-manager", "/usr/share/icons/gnome/48x48/apps/preferences-desktop-font.png" },
    { "gimp", "/usr/bin/gimp", "/usr/share/icons/hicolor/48x48/apps/gimp.png" },
    { "gpick", "/usr/bin/gpick", "/usr/share/icons/hicolor/48x48/apps/gpick.png" },
    { "image scan!", "/usr/bin/iscan", "/usr/share/icons/gnome/48x48/devices/scanner.png" },    
    { "inkscape", "/usr/bin/inkscape", "/usr/share/icons/hicolor/48x48/apps/inkscape.png" },
    { "pinta", "/usr/bin/pinta", "/usr/share/pixmaps/pinta.xpm" },
    { "scribus", "/usr/bin/scribus", "/usr/share/icons/oxygen/48x48/apps/scribus.png" },
    { "sk1", "/usr/bin/sk1", "/usr/share/pixmaps/sk1.png" },
    { "viewnior", "/usr/bin/viewnior", "/usr/share/icons/hicolor/48x48/apps/viewnior.png" },
    { "xsane scanning", "/usr/bin/xsane", "/usr/share/pixmaps/xsane.xpm" },
}
internetmenu = {
    { "chromium", "/usr/bin/chromium", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "claws", "/usr/bin/claws-mail", "/usr/share/icons/hicolor/48x48/apps/claws-mail.png" },
    { "evolution", "/usr/bin/evolution", "/usr/share/icons/hicolor/48x48/apps/evolution.png" },
    { "firefox", "/usr/bin/firefox", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "google chrome", "/usr/bin/google-chrome-stable", "/opt/google/chrome/product_logo_32.xpm" },
    { "google earth", "/usr/bin/google-earth", "/opt/google/earth/free/product_logo_32.xpm" },
    { "konqueror", "/usr/bin/konqueror", "/usr/share/icons/hicolor/48x48/apps/konqueror.png" },
    { "opera", "/usr/bin/opera", "/usr/share/pixmaps/opera.xpm" },
    { "pidgin", "/usr/bin/pidgin", "/usr/share/icons/hicolor/48x48/apps/pidgin.png" },
    { "skype", "skype ", "/usr/share/icons/hicolor/48x48/apps/skype.png" },
    { "tor browser", "/usr/bin/tor-browser-en", "/usr/share/pixmaps/tor-browser-en.png" },
    { "vivaldi", "/usr/bin/vivaldi-preview", "/opt/vivaldi/product_logo_48.png" },
}
multimediamenu = {
    { "alsamixer", terminal.." -e alsamixer" },
    { "audacity", "/usr/bin/audacity", "/usr/share/icons/hicolor/48x48/apps/audacity.png" },
    { "brasero", "/usr/bin/brasero ", "/usr/share/icons/hicolor/48x48/apps/brasero.png" },
    { "cmus", terminal.." -e cmus" },
    { "kaffeine", "/usr/bin/kaffeine", "/usr/share/icons/hicolor/48x48/apps/kaffeine.png" },
    { "spotify", "/usr/bin/spotify", "/usr/share/pixmaps/spotify-client.png" },
    { "vlc", "/usr/bin/vlc", "/usr/share/icons/hicolor/48x48/apps/vlc.png" },
    { "xfce4 mixer", "/usr/bin/xfce4-mixer", "/usr/share/icons/Adwaita/48x48/apps/multimedia-volume-control.png" },
}
officemenu = {
    { "acrobat reader", "/usr/bin/acroread", "/usr/share/pixmaps/acroread.png" },
    { "dia", "/usr/bin/dia", "/usr/share/icons/hicolor/48x48/apps/dia.png" },
    { "epdfview", "/usr/bin/epdfview", "/usr/share/icons/hicolor/48x48/apps/epdfview.png" },
    { "gnucash", "/home/hanez/bin/gnucash", "/usr/share/icons/hicolor/48x48/apps/gnucash-icon.png" },
    { "hibiscus", "/usr/bin/jameica", "/opt/jameica/plugins/hibiscus/icons/hibiscus-icon-32x32.png" },
    { "libreoffice base", "/usr/bin/libreoffice --base", "/usr/share/icons/hicolor/48x48/apps/libreoffice-base.png" },
    { "libreoffice calc", "/usr/bin/libreoffice --calc", "/usr/share/icons/hicolor/48x48/apps/libreoffice-calc.png" },
    { "libreoffice draw", "/usr/bin/libreoffice --draw", "/usr/share/icons/hicolor/48x48/apps/libreoffice-draw.png" },
    { "libreoffice impress", "/usr/bin/libreoffice --impress", "/usr/share/icons/hicolor/48x48/apps/libreoffice-impress.png" },
    { "libreoffice math", "/usr/bin/libreoffice --math", "/usr/share/icons/hicolor/48x48/apps/libreoffice-math.png" },
    { "libreoffice writer", "/usr/bin/libreoffice --writer", "/usr/share/icons/hicolor/48x48/apps/libreoffice-writer.png" },
    { "pdfshuffler", "/usr/bin/pdfshuffler", "/usr/share/pixmaps/pdfshuffler.png" },
}
othermenu = {
    { "apache directory studio", "/usr/bin/apachedirectorystudio", "/opt/ApacheDirectoryStudio/icon.xpm" },
    { "mysql workbench", "/usr/bin/mysql-workbench", "/usr/share/icons/hicolor/48x48/apps/mysql-workbench.png" },
    { "sqlitebrowser", "/usr/bin/sqlitebrowser", "/usr/share/icons/hicolor/256x256/apps/sqlitebrowser.png" },
    { "umongo", "/usr/bin/umongo.sh", "/usr/share/pixmaps/umongo.png" },
}
sciencemenu = {
    { "cantor", "/usr/bin/cantor", "/usr/share/icons/hicolor/48x48/apps/cantor.png" },
    { "octave", "/usr/bin/octave --force-gui", "/usr/share/icons/hicolor/48x48/apps/octave.png" },
    { "stellarium", "/usr/bin/stellarium", "/usr/share/icons/hicolor/48x48/apps/stellarium.png" },
}
systemmenu = {
    { "control center", "/usr/bin/mate-control-center", "/usr/share/icons/mate/48x48/categories/gnome-control-center.png" },
    { "gparted", "sudo /usr/bin/gparted_polkit ", "/usr/share/icons/hicolor/48x48/apps/gparted.png" },
    { "hardinfo", "hardinfo", "/usr/share/hardinfo/pixmaps/logo.png" },
--   { "gufw", "/usr/bin/gufw" },
    { "virtualbox", "/usr/bin/virtualbox", "/usr/share/pixmaps/VBox.png" },
    { "wireshark", "/usr/bin/wireshark", "/usr/share/icons/hicolor/48x48/apps/wireshark.png" },
}
utilitiesmenu = {
    { "arandr", "/usr/bin/arandr" },
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
    { "other", othermenu, beautiful.icon_path.."categories/applications-other.png" },
    { "science", sciencemenu, beautiful.icon_path.."categories/applications-science.png" },
    { "system", systemmenu, beautiful.icon_path.."categories/applications-system.png" },
    { "utilities", utilitiesmenu, beautiful.icon_path.."categories/applications-utilities.png" },
    { "filemanager", "/usr/bin/thunar", beautiful.icon_path.."apps/system-file-manager.png" },
    { "terminal", terminal, beautiful.icon_path.."apps/utilities-terminal.png" },
    { "configuration", editor_cmd .. " " .. awesome.conffile, beautiful.icon_path.."categories/preferences-other.png" },
    { "reload", awesome.restart, beautiful.icon_path.."actions/view-refresh.png" },
    { "quit", awesome.quit, beautiful.icon_path.."actions/system-log-out.png" }
  }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

local batwidget  = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, " $1$2% / ", 20, private.battery )

local netwidget = wibox.widget.textbox()
vicious.register(netwidget, vicious.widgets.net, '<span color="green">⇩${'..private.net_device..' down_kb}</span> / <span color="#C83321">${'..private.net_device..' up_kb}⇧</span> ', 1)

local thermalwidget  = wibox.widget.textbox()
vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C ", 20, private.thermal_zone )

cpuwidget = awful.widget.graph()
cpuwidget:set_width(50)
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
    right_layout:add(batwidget)
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
    awful.key({ modkey            }, "v", function() awful.util.spawn("/usr/bin/chromium") end),
    awful.key({ modkey            }, "b", function() awful.util.spawn("/usr/bin/firefox") end),
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
