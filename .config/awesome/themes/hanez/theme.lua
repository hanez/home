-------------------------
-- Hanez awesome theme --
-------------------------
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

theme = {}

theme.font          = "sans 8"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "~/.config/awesome/themes/hanez/taglist/squarefw.png"
theme.taglist_squares_unsel = "~/.config/awesome/themes/hanez/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "~/.config/awesome/themes/hanez/submenu.png"
theme.menu_height = 18
theme.menu_width  = 120

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "~/.config/awesome/themes/hanez/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "~/.config/awesome/themes/hanez/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "~/.config/awesome/themes/hanez/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "~/.config/awesome/themes/hanez/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "~/.config/awesome/themes/hanez/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "~/.config/awesome/themes/hanez/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "~/.config/awesome/themes/hanez/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "~/.config/awesome/themes/hanez/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "~/.config/awesome/themes/hanez/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "~/.config/awesome/themes/hanez/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "~/.config/awesome/themes/hanez/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "~/.config/awesome/themes/hanez/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "~/.config/awesome/themes/hanez/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "~/.config/awesome/themes/hanez/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "~/.config/awesome/themes/hanez/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "~/.config/awesome/themes/hanez/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "~/.config/awesome/themes/hanez/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "~/.config/awesome/themes/hanez/titlebar/maximized_focus_active.png"

-- Dont add wallpapers to the repo because of licensing issues; you need to set
-- this yourself.
if file_exists("~/images/background.jpg") then
    theme.wallpaper = "~/images/background.jpg"
end
if file_exists("~/images/background.png") then
    theme.wallpaper = "~/images/background.png"
end

    theme.wallpaper = "~/images/background.jpg"
-- You can use your own layout icons like this:
theme.layout_fairh = "~/.config/awesome/themes/hanez/layouts/fairhw.png"
theme.layout_fairv = "~/.config/awesome/themes/hanez/layouts/fairvw.png"
theme.layout_floating  = "~/.config/awesome/themes/hanez/layouts/floatingw.png"
theme.layout_magnifier = "~/.config/awesome/themes/hanez/layouts/magnifierw.png"
theme.layout_max = "~/.config/awesome/themes/hanez/layouts/maxw.png"
theme.layout_fullscreen = "~/.config/awesome/themes/hanez/layouts/fullscreenw.png"
theme.layout_tilebottom = "~/.config/awesome/themes/hanez/layouts/tilebottomw.png"
theme.layout_tileleft   = "~/.config/awesome/themes/hanez/layouts/tileleftw.png"
theme.layout_tile = "~/.config/awesome/themes/hanez/layouts/tilew.png"
theme.layout_tiletop = "~/.config/awesome/themes/hanez/layouts/tiletopw.png"
theme.layout_spiral  = "~/.config/awesome/themes/hanez/layouts/spiralw.png"
theme.layout_dwindle = "~/.config/awesome/themes/hanez/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from ~/.icons and ~/.icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
