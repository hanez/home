--------------------------
-- Hanez' Awesome theme --
--------------------------
theme = {}

theme.font = config.font_awesome.." "..config.font_awesome_size

theme.bg_normal   = "#000000"
theme.bg_focus    = "#000000"
theme.bg_urgent   = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = "#aaaaaa"
theme.fg_focus    = "#ffa500"
theme.fg_urgent   = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#e95421"
theme.border_marked = "#91231c"

theme.icon_theme    = "Adwaita"
theme.icon_size     = "22x22"
theme.icon_path     = "/usr/share/icons/"..theme.icon_theme.."/"..theme.icon_size.."/legacy/"
theme.notification_icon_size = 80;

theme.wallpaper    = os.getenv("HOME").."/.config/awesome/themes/hanez/31c3-saal-3.jpg"
theme.awesome_icon = os.getenv("HOME").."/.config/awesome/themes/hanez/awesome.png"

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

theme.taglist_squares_sel   = os.getenv("HOME").."/.config/awesome/themes/hanez/taglist/squarefw.png"
theme.taglist_squares_unsel = os.getenv("HOME").."/.config/awesome/themes/hanez/taglist/squarew.png"

-- theme.menu_bg_normal = "#000000"
theme.menu_bg_focus     = "#F0544C"
-- theme.menu_fg_normal =
theme.menu_fg_focus     = "#222222"
-- theme.menu_border_color = "#e95421"
-- theme.menu_border_width = 1
theme.menu_submenu_icon = theme.icon_path.."actions/media-playback-start.png"
theme.menu_height       = 30
theme.menu_width        = 250

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
theme.titlebar_bg                               = "#000000"
theme.titlebar_close_button_normal              = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/close_focus.png"
theme.titlebar_ontop_button_normal_inactive     = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = os.getenv("HOME").."/.config/awesome/themes/hanez/titlebar/maximized_focus_active.png"

theme.layout_fairh       = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/fairh.png"
theme.layout_fairv       = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/fairv.png"
theme.layout_floating    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/floating.png"
theme.layout_magnifier   = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/magnifier.png"
theme.layout_max         = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/max.png"
theme.layout_fullscreen  = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/fullscreen.png"
theme.layout_tilebottom  = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/tilebottom.png"
theme.layout_tileleft    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/tileleft.png"
theme.layout_tile        = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/tile.png"
theme.layout_tiletop     = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/tiletop.png"
theme.layout_spiral      = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/spiral.png"
theme.layout_dwindle     = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/dwindle.png"
theme.layout_cornernw    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/cornernw.png"
theme.layout_cornerne    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/cornerne.png"
theme.layout_cornersw    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/cornersw.png"
theme.layout_cornerse    = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/cornerse.png"
theme.layout_centerwork  = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/centerwork.png"
theme.layout_centerworkh = os.getenv("HOME").."/.config/awesome/themes/hanez/layouts/centerworkh.png"

return theme
