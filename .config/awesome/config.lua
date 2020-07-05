config = {}
config.thermal_zone = "k10temp/temp2"
config.net_device = "eth0"
config.battery = "BAT0"
config.font_awesome = "Source Code Pro"
config.font_awesome_size = "9"
config.font_xterm = "Source Code Pro"
config.font_xterm_size = "10"
config.titlebars_enabled = "true"
config.autostart = {
    --"kalu",
    --"amor",
    "megasync",
    "pasystray",
    "xfce4-clipman",
    "xfce4-notes",
    "xautolock -locker slock -time 5",
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
    --"spotify-tray",
    "pamac-tray",
    --"/bin/bash /home/hanez/bin/steam.sh",
    "redshift",
    "pidgin",
    "claws-mail",
    "blueman-applet",
    --"virt-manager",
}

return config
