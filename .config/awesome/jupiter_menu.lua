local icondir = os.getenv("HOME").."/.config/awesome/icons/rrze/tango/22x22/"

accessoriesmenu = {
    { "calculator", "/usr/bin/galculator", "/usr/share/icons/hicolor/48x48/apps/galculator.png" },
    { "calibre", "/usr/bin/calibre", "/usr/share/icons/hicolor/48x48/apps/calibre-gui.png" },
    { "dia", "/usr/bin/dia --integrated", "/usr/share/icons/hicolor/48x48/apps/dia.png" },
    { "engrampa", "/usr/bin/engrampa", "/usr/share/icons/hicolor/32x32/apps/engrampa.png" },
    { "epdfview", "/usr/bin/epdfview", "/usr/share/icons/hicolor/48x48/apps/epdfview.png" },
    { "freemind", "/usr/bin/freemind", "/usr/share/icons/hicolor/32x32/apps/freemind.png" },
    { "gscriptor", "/usr/bin/gscriptor", "/usr/share/icons/hicolor/48x48/apps/gcr-smart-card.png" },
    { "gvim", "/usr/bin/gvim", "/usr/share/icons/hicolor/48x48/apps/gvim.png" },
    { "lector", "/usr/bin/lector", "/usr/share/icons/hicolor/scalable/apps/Lector.png" },
    { "pluma", "/usr/bin/pluma", "/usr/share/icons/Vimix/scalable/apps/gedit-icon.svg" },
    { "regexxer", "/usr/bin/regexxer", "/usr/share/icons/hicolor/48x48/apps/regexxer.png" },
    { "retext", "/usr/bin/retext", "/usr/share/icons/hicolor/48x48/apps/retext.png" },
    { "xarchiver", "xarchiver", "/usr/share/icons/hicolor/48x48/apps/xarchiver.png" },
}
audiomenu = {
    { "airwave manager", "/usr/bin/airwave-manager", "/usr/share/icons/hicolor/48x48/apps/airwave-manager.png" },
    { "ardour", "/usr/bin/ardour6", "/usr/share/icons/hicolor/48x48/apps/ardour6.png" },
    { "audacity", "/usr/bin/audacity", "/usr/share/icons/hicolor/48x48/apps/audacity.png" },
    { "bitwig studio", "/usr/bin/bitwig-studio", "/usr/share/icons/hicolor/scalable/apps/bitwig-studio.svg" },
    { "carla", "/usr/bin/carla", "/usr/share/icons/hicolor/scalable/apps/carla.svg" },
    { "qjackctl", "/usr/bin/qjackctl", "/usr/share/icons/hicolor/scalable/apps/qjackctl.svg" },
    { "reaper", "/usr/bin/reaper", "/usr/share/icons/hicolor/256x256/apps/cockos-reaper.png" },
}
communicationmenu = {
    { "claws mail", "/usr/bin/claws-mail", "/usr/share/icons/hicolor/48x48/apps/claws-mail.png" },
    { "clawsker", "/usr/bin/clawsker", "/usr/share/icons/hicolor/48x48/apps/clawsker.png" },
    { "gajim", "/usr/bin/gajim", "/usr/share/icons/hicolor/scalable/apps/org.gajim.Gajim.svg" },
    { "signal", "/usr/bin/signal-desktop-beta", "/usr/share/icons/hicolor/48x48/apps/signal-desktop-beta.png" },
    { "skype", "/usr/bin/skypeforlinux", "/usr/share/pixmaps/skypeforlinux.png" },
    { "teams", "/usr/bin/teams", "/usr/share/pixmaps/teams.png" },
    { "thunderbird", "/usr/bin/thunderbird", "/usr/share/icons/hicolor/48x48/apps/thunderbird.png" },
    { "whatsapp", "/usr/bin/whatsapp-for-linux", "/usr/share/icons/hicolor/32x32/apps/whatsapp-for-linux.png" },
    { "zoom", "/usr/bin/zoom", "/usr/share/pixmaps/application-x-zoom.png" },
}
dbmenu = {
    { "datagrip", "/home/hanez/bin/datagrip.sh", "/opt/datagrip/bin/datagrip.svg" },
    { "mysql workbench", "/usr/bin/mysql-workbench", "/usr/share/icons/hicolor/48x48/apps/mysql-workbench.png" },
    { "sqlitebrowser", "/usr/bin/sqlitebrowser", "/usr/share/icons/hicolor/256x256/apps/sqlitebrowser.png" },
}
developmentmenu = {
    { "anjuta", "/usr/bin/anjuta", "/usr/share/icons/hicolor/48x48/apps/anjuta.png" },
    { "android studio", "/opt/android-studio/bin/studio.sh", "/opt/android-studio/bin/studio.png" },
    { "bluegriffon", "/usr/bin/bluegriffon", "/usr/share/icons/hicolor/48x48/apps/bluegriffon.png" },
    { "codeblocks", "/usr/bin/codeblocks", "/usr/share/icons/hicolor/64x64/apps/codeblocks.png" },
    { "clion", "/home/hanez/bin/clion.sh", "/usr/share/pixmaps/clion.svg" },
    { "cmake gui", "/usr/bin/cmake-gui", "/usr/share/icons/hicolor/64x64/apps/cmake.png" },
    { "ddd", "/usr/bin/ddd", "/usr/share/pixmaps/ddd.xpm" },
    { "fluid", "/usr/bin/fluid", "/usr/share/icons/hicolor/48x48/apps/fluid.png" },
    { "glade", "/usr/bin/glade ", "/usr/share/icons/hicolor/scalable/apps/glade-3.svg" },
    { "goland", "/home/hanez/bin/goland.sh", "/usr/share/pixmaps/goland.png"},
    { "intellij", "/usr/bin/idea", "/usr/share/pixmaps/idea.png" },
    { "intellij ultimate", "/usr/bin/intellij-idea-ultimate-edition", "/usr/share/pixmaps/idea.png" },
    { "kdevelop", "/usr/bin/kdevelop", "/usr/share/icons/hicolor/48x48/apps/kdevelop.png" },
    { "lazarus", "/usr/bin/lazarus", "/usr/lib/lazarus/images/ide_icon48x48.png" },
    { "liteide", "/usr/bin/liteide", "/usr/share/pixmaps/liteide.png" },
    { "phpstorm", "/home/hanez/bin/phpstorm.sh", "/usr/share/pixmaps/phpstorm.svg" },
    { "pycharm professional", "/home/hanez/bin/pycharm.sh", "/usr/share/icons/hicolor/scalable/apps/pycharm.svg" },
    { "qgit", "/usr/bin/qgit", "/usr/share/icons/hicolor/48x48/apps/qgit.png" },
    { "qtcreator", "/usr/bin/qtcreator", "/usr/share/icons/hicolor/48x48/apps/QtProject-qtcreator.png" },
    { "rider", "/home/hanez/bin/rider.sh", "/usr/share/rider/bin/rider.svg" },
    { "rubymine", "/home/hanez/bin/rubymine.sh", "/usr/share/icons/hicolor/scalable/apps/rubymine.svg" },
    { "sasm", "/usr/bin/sasm", "/usr/share/sasm/sasm.png" },
    { "smartgit", "/usr/bin/smartgit", "/opt/smartgit/bin/smartgit.svg" },
    { "thonny", "/usr/bin/thonny", "/usr/share/icons/hicolor/48x48/apps/org.thonny.Thonny.png" },
    --{ "webstorm", "/home/hanez/bin/webstorm.sh", "/usr/share/pixmaps/webstorm.svg" },
    { "wxglade", "/usr/bin/wxglade", "/usr/share/icons/hicolor/32x32/apps/wxglade.png" },
    { "zbstudio", "/usr/bin/zbstudio", "/usr/share/icons/hicolor/48x48/apps/zbstudio.png" },
}
engineeringmenu = {
    { "arduino", "/usr/bin/arduino", "/usr/share/icons/hicolor/48x48/apps/arduino.png" },
    { "cura", "/usr/bin/cura", "/usr/share/icons/hicolor/128x128/apps/cura-icon.png" },
    { "eagle", "/home/hanez/bin/eagle.sh", "/usr/share/pixmaps/eagle.png" },
    { "energia", "/usr/bin/energia", "/usr/share/pixmaps/energia.png" },
    { "fritzing", "/usr/bin/Fritzing", "/usr/share/pixmaps/fritzing.png" },
    { "kicad", "/usr/bin/kicad", "/usr/share/icons/hicolor/48x48/apps/kicad.png" },
    { "leocad", "/usr/bin/leocad", "/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.leocad.svg" },
    { "librecad", "/usr/bin/librecad", "/usr/share/icons/hicolor/scalable/apps/librecad.svg" },
    { "openscad", "/usr/bin/openscad", "/usr/share/pixmaps/openscad.png" },
    { "processing", "/usr/bin/processing", "/usr/share/pixmaps/processing.png" },
    { "qcad", "/usr/bin/qcad", "/usr/share/pixmaps/qcad_icon.png" },
    { "qtresistors", "/usr/bin/qtResistors", "/usr/share/icons/hicolor/64x64/apps/qtResistors.png" },
}
gamesmenu = {
    { "0 a.d.", "/usr/bin/0ad", "/usr/share/pixmaps/0ad.png" },
    { "kobodeluxe", "/usr/bin/kobodl", "/usr/share/icons/hicolor/48x48/apps/kobodl.png" },
    { "neverball", "/usr/bin/neverball", "/usr/share/icons/hicolor/48x48/apps/neverball.png" },
    { "neverputt", "/usr/bin/neverputt", "/usr/share/icons/hicolor/48x48/apps/neverputt.png" },
    { "supertux", "/usr/bin/supertux2", "/usr/share/icons/hicolor/scalable/apps/supertux2.svg" },
    { "supertux kart", "/usr/bin/supertuxkart", "/usr/share/icons/hicolor/48x48/apps/supertuxkart.png" },
    { "retroarch", "/usr/bin/retroarch", "/usr/share/pixmaps/retroarch.svg" },
    { "steam", "/home/hanez/bin/steam.sh", "/usr/share/pixmaps/steam.png" },
    --{ "thimbleweed park", "/home/hanez/bin/thimbleweedpark", "/home/hanez/.local/share/Steam/steamapps/common/Thimbleweed Park/Icon32.png" },
    { "xgalaga++", "/usr/bin/xgalaga++", "/usr/share/pixmaps/xgalaga++.xpm" },
}
graphicsmenu = {
    { "aseprite", "/usr/bin/aseprite", "/usr/share/icons/hicolor/48x48/apps/aseprite.png" },
    { "blender", "/usr/bin/blender", "/usr/share/icons/hicolor/scalable/apps/blender.svg" },
    { "font manager", "/usr/bin/font-manager", "/usr/share/icons/gnome/48x48/apps/preferences-desktop-font.png" },
    { "font viewer", "/usr/bin/gnome-font-viewer", "/usr/share/icons/gnome/48x48/apps/preferences-desktop-font.png" },
    { "gimp", "/usr/bin/gimp", "/usr/share/icons/hicolor/48x48/apps/gimp.png" },
    { "gpick", "/usr/bin/gpick", "/usr/share/icons/hicolor/48x48/apps/gpick.png" },
    { "image scan!", "/usr/bin/iscan", "/usr/share/icons/gnome/48x48/devices/scanner.png" },
    { "inkscape", "/usr/bin/inkscape", "/usr/share/icons/hicolor/48x48/apps/org.inkscape.Inkscape.png" },
    { "krita", "/usr/bin/krita", "/usr/share/icons/hicolor/48x48/apps/krita.png" },
    { "mtpaint", "/usr/bin/mtpaint", "/usr/share/pixmaps/mtpaint.png" },
    { "scribus", "/usr/bin/scribus", "/usr/share/icons/hicolor/32x32/apps/scribus.png" },
    { "viewnior", "/usr/bin/viewnior", "/usr/share/icons/hicolor/48x48/apps/viewnior.png" },
    { "wacom", "/usr/bin/kde_wacom_tabletfinder", "/usr/share/icons/Vimix/scalable/apps/csd-wacom.svg" },
    { "xsane scanning", "/usr/bin/xsane", "/usr/share/pixmaps/xsane.xpm" },
}
hackingmenu = {
    { "ghidra", "/usr/bin/ghidra", "/usr/share/pixmaps/Ghidra_Logo.png" },
    { "ghex", "/usr/bin/ghex ", "/usr/share/icons/hicolor/scalable/apps/org.gnome.GHex-symbolic.svg" },
    { "iaito", "/usr/bin/iaito ", "/usr/share/icons/hicolor/scalable/apps/iaito-o.svg" },
}
internetmenu = {
    { "chrome", "/usr/bin/google-chrome-stable", "/usr/share/icons/hicolor/48x48/apps/google-chrome.png" },
    { "chrome (incognito)", "/usr/bin/google-chrome-stable", "/usr/share/icons/hicolor/48x48/apps/google-chrome.png" },
    { "chromium", "/usr/bin/chromium", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "chromium (incognito)", "/usr/bin/chromium --incognito", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "edge", "/usr/bin/microsoft-edge-dev", "/usr/share/icons/hicolor/48x48/apps/microsoft-edge-dev.png" },
    { "edge (private)", "/usr/bin/microsoft-edge-dev --inprivate", "/usr/share/icons/hicolor/48x48/apps/microsoft-edge-dev.png" },
    { "firefox", "/usr/bin/firefox", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "firefox (private)", "/usr/bin/firefox --private-window", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "google earth", "/usr/bin/google-earth-pro", "/opt/google/earth/pro/product_logo_32.xpm" },
    { "konqueror", "/usr/bin/konqueror", "/usr/share/icons/hicolor/48x48/apps/konqueror.png" },
    { "opera", "/usr/bin/opera", "/usr/share/pixmaps/opera.xpm" },
    { "qietrss", "/usr/bin/qietrss", "/usr/share/icons/hicolor/48x48/apps/quiterss.png" },
    { "seamonkey", "/usr/bin/seamonkey", "/usr/share/pixmaps/seamonkey.png" },
    { "tor browser", "/usr/bin/tor-browser", "/usr/share/icons/hicolor/scalable/apps/tor-browser.svg" },
}
multimediamenu = {
    { "acidrip", "/usr/bin/acidrip", "/usr/share/icons/Vimix/scalable/apps/acidrip.svg" },
    { "brasero", "/usr/bin/brasero", "/usr/share/icons/hicolor/48x48/apps/brasero.png" },
    { "handbrake", "/usr/bin/ghb", "/usr/share/icons/hicolor/scalable/apps/hb-icon.svg" },
    { "k3b", "/usr/bin/k3b", "/usr/share/icons/hicolor/48x48/apps/k3b.png" },
    { "k9copy", "/usr/bin/k9copy", "/usr/share/icons/hicolor/48x48/actions/k9copy.png" },
    { "kaffeine", "/usr/bin/kaffeine", "/usr/share/icons/hicolor/scalable/apps/kaffeine.svg" },
    { "mediathekview", "/usr/bin/mediathekview", "/usr/share/icons/hicolor/scalable/apps/mediathekview.svg/MediathekView.svg" },
    { "spotify", "/usr/bin/spotify-tray", "/usr/share/pixmaps/spotify-client.png" },
    { "tvbrowser", "/usr/bin/tvbrowser", "/usr/share/icons/hicolor/48x48/apps/tvbrowser.png" },
    { "vlc", "/usr/bin/vlc", "/usr/share/icons/hicolor/48x48/apps/vlc.png" },
}
networkmenu = {
    { "ettercap", "/usr/bin/ettercap -G", "/usr/share/pixmaps/ettercap.svg" },
    { "gns3", "/usr/bin/gns3", "/usr/share/icons/hicolor/48x48/apps/gns3.png" },
    { "gufw", "/usr/bin/gufw_fixed", "/usr/share/icons/hicolor/scalable/apps/gufw.svg" },
    { "wireshark", "/usr/bin/wireshark-gtk", "/usr/share/icons/hicolor/48x48/apps/wireshark.png" },
    { "zenmap", "/usr/bin/gksu /usr/bin/zenmap", "/usr/share/zenmap/pixmaps/zenmap.png" },
}
officemenu = {
    { "calendar", "/usr/bin/io.elementary.calendar", "/usr/share/icons/elementary/apps/48/office-calendar.svg" },
    { "libreoffice base", "/usr/bin/libreoffice --base", "/usr/share/icons/hicolor/48x48/apps/libreoffice-base.png" },
    { "libreoffice calc", "/usr/bin/libreoffice --calc", "/usr/share/icons/hicolor/48x48/apps/libreoffice-calc.png" },
    { "libreoffice draw", "/usr/bin/libreoffice --draw", "/usr/share/icons/hicolor/48x48/apps/libreoffice-draw.png" },
    { "libreoffice impress", "/usr/bin/libreoffice --impress", "/usr/share/icons/hicolor/48x48/apps/libreoffice-impress.png" },
    { "libreoffice math", "/usr/bin/libreoffice --math", "/usr/share/icons/hicolor/48x48/apps/libreoffice-math.png" },
    { "libreoffice writer", "/usr/bin/libreoffice --writer", "/usr/share/icons/hicolor/48x48/apps/libreoffice-writer.png" },
    { "openboard", "/usr/bin/openboard", "/usr/share/icons/hicolor/64x64/apps/OpenBoard.png" },
    { "pdfslicer", "/usr/bin/pdfslicer", "/usr/share/icons/hicolor/scalable/apps/com.github.junrrein.PDFSlicer.svg" },
}
privacymenu = {
    { "gnu privacy agent", "/usr/bin/gpa", "/usr/share/pixmaps/gpa.png" },
    { "keepassxc", "/usr/bin/keepassxc", "/usr/share/icons/hicolor/scalable/apps/keepassxc.svg" },
    { "kleopatra", "/usr/bin/kleopatra", "/usr/share/icons/hicolor/48x48/apps/kleopatra.png" },
    { "seahorse", "/usr/bin/seahorse", "/usr/share/icons/hicolor/scalable/apps/org.gnome.seahorse.Application.svg" },
    { "zulucrypt", "/usr/bin/zuluCrypt-gui", "/usr/share/pixmaps/zuluCrypt.papirus.dark.png" },
}
radiomenu = {
    { "gnuradio", "/usr/bin/gnuradio-companion", "/usr/share/gnuradio/grc/freedesktop/grc-icon-48.png" },
    { "gqrx", "/usr/bin/gqrx", "/usr/share/pixmaps/gqrx.svg" },
    { "urh", "/usr/bin/urh", "/usr/share/pixmaps/urh.png" },
}
sciencemenu = {
    { "stellarium", "/usr/bin/stellarium", "/usr/share/icons/hicolor/48x48/apps/stellarium.png" },
}
systemmenu = {
    { "gparted", "/usr/bin/gparted", "/usr/share/icons/hicolor/48x48/apps/gparted.png" },
    { "hardinfo", "/usr/bin/hardinfo", "/usr/share/icons/hicolor/48x48/apps/hardinfo.png" },
    { "ksysguard", "/usr/bin/ksysguard", "/usr/share/icons/hicolor/16x16/apps/ksysguardd.png" },
    { "partition manager", "/usr/bin/partitionmanager", "/usr/share/icons/hicolor/scalable/apps/partitionmanager.svg" },
    { "printer", "/usr/bin/system-config-printer", "/usr/share/icons/Adwaita/48x48/legacy/printer-printing.png" },
    { "teamviewer", "/usr/bin/teamviewer", "/usr/share/icons/hicolor/48x48/apps/TeamViewer.png" },
    { "timeshift", "/usr/bin/timeshift-launcher", "/usr/share/icons/hicolor/48x48/apps/timeshift.png" },
    { "virt-manager", "/usr/bin/virt-manager", "/usr/share/icons/hicolor/48x48/apps/virt-manager.png" },
    { "virtualbox", "/usr/bin/virtualbox", "/usr/share/pixmaps/VBox.png" },
}
utilitiesmenu = {
    { "arandr", "/usr/bin/arandr", "/usr/share/icons/hicolor/scalable/devices/video-television.svg" },
    { "appearance", "/usr/bin/lxappearance", "/usr/share/icons/nuoveXT2/96x96/apps/preferences-desktop-theme.png" },
    { "file search tool", "/usr/bin/gnome-search-tool", "/usr/share/icons/Adwaita/48x48/legacy/system-search.png" },
    { "raspberry pi imager", "/usr/bin/rpi-imager", "/usr/share/icons/hicolor/128x128/apps/rpi-imager.png" },
}
videomenu = {
    { "shotcut", "/usr/bin/shotcut", "/usr/share/icons/hicolor/64x64/apps/org.shotcut.Shotcut.png" },
}
mainmenu = awful.menu({ items = {
    { "accessories", accessoriesmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png" },
    { "audio", audiomenu, "/usr/share/icons/hicolor/scalable/devices/audio-card.svg" },
    { "communication", communicationmenu, icondir.."actions/quote.png" },
    { "database", dbmenu, "/usr/share/icons/oxygen/base/48x48/places/server-database.png" },
    { "development", developmentmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-development.png" },
    { "engineering", engineeringmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-engineering.png" },
    { "games", gamesmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-games.png" },
    { "graphics", graphicsmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-graphics.png" },
    { "hacking", hackingmenu, "/usr/share/icons/Adwaita/22x22/legacy/face-devilish.png" },
    { "internet", internetmenu, icondir.."emblems/globe.png" },
    { "network", networkmenu, "/usr/share/icons/Adwaita/22x22/legacy/network-wired-disconnected.png" },
    { "multimedia", multimediamenu, "/usr/share/icons/Adwaita/scalable/categories/applications-multimedia-symbolic.svg" },
    { "office", officemenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-office.png" },
    { "privacy", privacymenu, icondir.."emblems/lock-key.png" },
    { "radio", radiomenu, icondir.."emblems/wifi.png" },
    { "science", sciencemenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-science.png" },
    { "system", systemmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-system.png" },
    { "utilities", utilitiesmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-utilities.png" },
    { "video", videomenu, "/usr/share/icons/Adwaita/48x48/legacy/camera-video.png" },
    { "filemanager", "/usr/bin/thunar", "/usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png" },
    { "terminal", terminal, "/usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png" },
    { "configuration", editor_cmd .. " " .. awesome.conffile, "/usr/share/icons/Adwaita/22x22/legacy/preferences-other.png" },
    { "reload", awesome.restart, "/usr/share/icons/Adwaita/22x22/legacy/view-refresh.png" },
    { "quit", function() awesome.quit() end, "/usr/share/icons/Adwaita/22x22/legacy/system-log-out.png" }
  }
})

return mainmenu
