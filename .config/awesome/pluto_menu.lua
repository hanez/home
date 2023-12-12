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
    --{ "lector", "/usr/bin/lector", "/usr/share/icons/hicolor/scalable/apps/Lector.png" },
    { "pluma", "/usr/bin/pluma", "/usr/share/icons/Vimix/scalable/apps/gedit-icon.svg" },
    { "regexxer", "/usr/bin/regexxer", "/usr/share/icons/hicolor/48x48/apps/regexxer.png" },
    { "retext", "/usr/bin/retext", "/usr/share/icons/hicolor/48x48/apps/retext.png" },
    { "xarchiver", "xarchiver", "/usr/share/icons/hicolor/48x48/apps/xarchiver.png" },
    { "xreader", "xreader", "/usr/share/icons/hicolor/scalable/apps/xreader.svg" },
}
audiomenu = {
    { "ableton live 11", "/home/hanez/bin/ableton.sh", "/home/hanez/images/ableton_logo.png" },
    { "ardour", "/usr/bin/ardour7", "/usr/share/icons/hicolor/48x48/apps/ardour7.png" },
    { "audacity", "/usr/bin/audacity", "/usr/share/icons/hicolor/48x48/apps/audacity.png" },
    { "mixxx", "/usr/bin/mixxx", "/usr/share/icons/hicolor/scalable/apps/mixxx.svg" },
    { "qjackctl", "/usr/bin/qjackctl", "/usr/share/icons/hicolor/scalable/apps/qjackctl.svg" },
}
communicationmenu = {
    { "claws mail", "/usr/bin/claws-mail", "/usr/share/icons/hicolor/48x48/apps/claws-mail.png" },
    { "clawsker", "/usr/bin/clawsker", "/usr/share/icons/hicolor/48x48/apps/clawsker.png" },
    { "gajim", "/usr/bin/gajim", "/usr/share/icons/hicolor/scalable/apps/org.gajim.Gajim.svg" },
    { "linphone", "/usr/bin/linphone", "/usr/share/icons/hicolor/scalable/apps/linphone.svg" },
    { "pidgin", "/usr/bin/pidgin", "/usr/share/icons/hicolor/scalable/apps/pidgin.svg" },
    { "signal", "/usr/bin/signal-desktop-beta", "/usr/share/icons/hicolor/48x48/apps/signal-desktop-beta.png" },
    { "skype", "/usr/bin/skypeforlinux", "/usr/share/pixmaps/skypeforlinux.png" },
    { "slack", "/usr/bin/slack", "/usr/share/pixmaps/slack.png" },
    { "teams", "/usr/bin/teams", "/usr/share/pixmaps/teams.png" },
    { "telegram", "/usr/bin/telegram-desktop", "/usr/share/icons/hicolor/48x48/apps/telegram.png" },
    { "webex", "/usr/bin/webex", "/opt/Webex/bin/sparklogosmall.png" },
    { "zoom", "/usr/bin/zoom", "/usr/share/pixmaps/application-x-zoom.png" },
}
databasemenu = {
    { "apache directory studio", "/usr/bin/apachedirectorystudio", "/usr/share/pixmaps/apachedirectorystudio.png" },
    { "datagrip", "/home/hanez/opt/DataGrip/bin/datagrip.sh", "/home/hanez/opt/DataGrip/bin/datagrip.svg" },
    { "dataspell", "/home/hanez/opt/DataSpell/bin/dataspell.sh", "/home/hanez/opt/DataSpell/bin/dataspell.svg" },
    { "dbeaver", "/usr/bin/dbeaver", "/usr/share/icons/hicolor/48x48/apps/dbeaver.png" },
    { "mysql workbench", "/usr/bin/mysql-workbench", "/usr/share/icons/hicolor/48x48/apps/mysql-workbench.png" },
    { "resp.app", "/usr/bin/resp", "/usr/share/pixmaps/resp.png" },
    { "sqlitebrowser", "/usr/bin/sqlitebrowser", "/usr/share/icons/hicolor/256x256/apps/sqlitebrowser.png" },
}
developmentmenu = {
    { "android studio", "/usr/bin/android-studio", "/usr/share/pixmaps/android-studio.png" },
    { "anjuta", "/usr/bin/anjuta", "/usr/share/icons/hicolor/48x48/apps/anjuta.png" },
    { "codeblocks", "/usr/bin/codeblocks", "/usr/share/icons/hicolor/64x64/apps/codeblocks.png" },
    { "clion", "/home/hanez/opt/CLion/bin/clion.sh", "/home/hanez/opt/CLion/bin/clion.svg" },
    { "cmake gui", "/usr/bin/cmake-gui", "/usr/share/icons/hicolor/64x64/apps/cmake.png" },
    { "ddd", "/usr/bin/ddd", "/usr/share/pixmaps/ddd.xpm" },
    { "fluid", "/usr/bin/fluid", "/usr/share/icons/hicolor/48x48/apps/fluid.png" },
    { "glade", "/usr/bin/glade ", "/usr/share/icons/hicolor/scalable/apps/glade-3.svg" },
    { "gnat studio", "/home/hanez/bin/gnatstudio.sh", "/home/hanez/opt/GNAT/2021/share/gnatstudio/icons/hicolor/32x32/apps/gnatstudio_logo.png" },
    { "goland", "/home/hanez/opt/GoLand/bin/goland.sh", "/home/hanez/opt/GoLand/bin/goland.svg" },
    { "intellij idea", "/home/hanez/opt/IntelliJIDEA/bin/idea.sh", "/home/hanez/opt/IntelliJIDEA/bin/idea.svg" },
    { "kdevelop", "/usr/bin/kdevelop", "/usr/share/icons/hicolor/48x48/apps/kdevelop.png" },
    { "liteide", "/usr/bin/liteide", "/usr/share/pixmaps/liteide.png" },
    { "meld", "/usr/bin/meld", "/usr/share/icons/hicolor/scalable/apps/org.gnome.meld.svg" },
    { "netbeans", "/usr/bin/netbeans", "/usr/share/pixmaps/netbeans.png" },
    { "phpstorm", "/home/hanez/opt/PhpStorm/bin/phpstorm.sh", "/home/hanez/opt/PhpStorm/bin/phpstorm.svg" },
    { "pycharm", "/home/hanez/opt/PyCharm/bin/pycharm.sh", "/home/hanez/opt/PyCharm/bin/pycharm.svg" },
    { "qgit", "/usr/bin/qgit", "/usr/share/icons/hicolor/48x48/apps/qgit.png" },
    { "qtcreator", "/usr/bin/qtcreator", "/usr/share/icons/hicolor/48x48/apps/QtProject-qtcreator.png" },
    { "rider", "/home/hanez/opt/Rider/bin/rider.sh", "/home/hanez/opt/Rider/bin/rider.svg" },
    { "rubymine", "/home/hanez/opt/RubyMine/bin/rubymine.sh", "/home/hanez/opt/RubyMine/bin/rubymine.svg" },
    { "sasm", "/usr/bin/sasm", "/usr/share/sasm/sasm.png" },
    { "smartgit", "/usr/bin/smartgit", "/usr/share/icons/hicolor/48x48/apps/smartgit.png" },
    { "thonny", "/usr/bin/thonny", "/usr/share/icons/hicolor/48x48/apps/org.thonny.Thonny.png" },
    { "webstorm", "/home/hanez/opt/WebStorm/bin/webstorm.sh", "/home/hanez/opt/WebStorm/bin/webstorm.svg" },
    { "wxformbuilder", "/usr/bin/wxformbuilder", "/usr/share/pixmaps/wxformbuilder.png" },
    { "wxglade", "/usr/bin/wxglade", "/usr/share/icons/hicolor/32x32/apps/wxglade.png" },
}
engineeringmenu = {
    { "arduino (1.0.5)", "/home/hanez/opt/arduino-1.0.5/arduino", "/usr/share/icons/hicolor/48x48/apps/arduino.png" },
    { "arduino (1.8.16)", "/usr/bin/arduino", "/usr/share/icons/hicolor/48x48/apps/arduino.png" },
    --{ "cura", "/usr/bin/cura", "/usr/share/icons/hicolor/128x128/apps/cura-icon.png" },
    { "eagle", "/home/hanez/bin/eagle.sh", "/usr/share/pixmaps/eagle.png" },
    { "energia", "/usr/bin/energia", "/usr/share/pixmaps/energia.png" },
    { "fritzing", "/usr/bin/Fritzing", "/usr/share/pixmaps/fritzing.png" },
    { "kicad", "/usr/bin/kicad", "/usr/share/icons/hicolor/48x48/apps/kicad.png" },
    { "kingstvis", "/opt/kingstvis/KingstVIS", "/usr/share/icons/hicolor/48x48/KingstVIS.png" },
    { "leocad", "/usr/bin/leocad", "/usr/share/icons/hicolor/scalable/mimetypes/application-vnd.leocad.svg" },
    { "librecad", "/usr/bin/librecad", "/usr/share/icons/hicolor/scalable/apps/librecad.svg" },
    { "openmv", "/usr/bin/openmvide", "/usr/share/pixmaps/openmv-ide.png" },
    { "openscad", "/usr/bin/openscad", "/usr/share/pixmaps/openscad.png" },
    { "processing", "/usr/bin/processing", "/usr/share/pixmaps/processing.png" },
    { "pulseview", "/usr/bin/pulseview", "/usr/share/icons/hicolor/scalable/apps/pulseview.svg" },
    { "qcad", "/usr/bin/qcad", "/usr/share/pixmaps/qcad_icon.png" },
    { "qtresistors", "/usr/bin/qtResistors", "/usr/share/icons/hicolor/64x64/apps/qtResistors.png" },
    { "simulide", "/usr/bin/simulide", "/usr/share/icons/hicolor/256x256/simulide.png" },
}
gamesmenu = {
    { "0 a.d.", "/usr/bin/0ad", "/usr/share/pixmaps/0ad.png" },
    --{ "flightgear", "/usr/bin/fgfs --launcher", "/usr/share/icons/hicolor/scalable/apps/flightgear.svg" },
    { "kobodeluxe", "/usr/bin/kobodl", "/usr/share/icons/hicolor/48x48/apps/kobodl.png" },
    { "lutris", "/usr/bin/lutris", "/usr/share/icons/hicolor/scalable/apps/lutris.svg" },
    { "neverball", "/usr/bin/neverball", "/usr/share/icons/hicolor/48x48/apps/neverball.png" },
    { "neverputt", "/usr/bin/neverputt", "/usr/share/icons/hicolor/48x48/apps/neverputt.png" },
    { "red eclipse", "/opt/redeclipse/redeclipse.sh", "/usr/share/pixmaps/redeclipse.png" },
    { "retroarch", "/usr/bin/retroarch", "/usr/share/pixmaps/retroarch.svg" },
    { "supertux", "/usr/bin/supertux2", "/usr/share/icons/hicolor/scalable/apps/supertux2.svg" },
    { "supertux kart", "/usr/bin/supertuxkart", "/usr/share/icons/hicolor/48x48/apps/supertuxkart.png" },
    { "sauerbraten", "/usr/bin/sauerbraten-client", "/usr/share/pixmaps/sauerbraten.png" },
    { "steam", "/home/hanez/bin/steam.sh", "/usr/share/pixmaps/steam.png" },
    --{ "thimbleweed park", "/home/hanez/bin/thimbleweedpark", "/home/hanez/.local/share/Steam/steamapps/common/Thimbleweed Park/Icon32.png" },
    { "warzone 2100", "/usr/bin/warzone2100", "/usr/share/icons/warzone2100.png" },
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
    { "screenshooter", "/usr/bin/xfce4-screenshooter", "/usr/share/icons/hicolor/scalable/apps/org.xfce.screenshooter.svg" },
    { "scribus", "/usr/bin/scribus", "/usr/share/icons/hicolor/32x32/apps/scribus.png" },
    { "viewnior", "/usr/bin/viewnior", "/usr/share/icons/hicolor/48x48/apps/viewnior.png" },
    { "wacom", "/usr/bin/kde_wacom_tabletfinder", "/usr/share/icons/Vimix/scalable/apps/csd-wacom.svg" },
    { "xsane scanning", "/usr/bin/xsane", "/usr/share/pixmaps/xsane.xpm" },
}
hackingmenu = {
    { "ghidra", "/usr/bin/ghidra", "/usr/share/pixmaps/Ghidra_Logo.png" },
    { "ghex", "/usr/bin/ghex ", "/usr/share/icons/hicolor/scalable/apps/org.gnome.GHex.svg" },
    { "iaito", "/usr/bin/iaito ", "/usr/share/icons/hicolor/scalable/apps/iaito-o.svg" },
}
internetmenu = {
    { "chrome", "/usr/bin/google-chrome-stable", "/usr/share/icons/hicolor/48x48/apps/google-chrome.png" },
    { "chrome (incognito)", "/usr/bin/google-chrome-stable", "/usr/share/icons/hicolor/48x48/apps/google-chrome.png" },
    { "chromium", "/usr/bin/chromium", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "chromium (incognito)", "/usr/bin/chromium --incognito", "/usr/share/icons/hicolor/48x48/apps/chromium.png" },
    { "edge", "/usr/bin/microsoft-edge-stable", "/usr/share/icons/hicolor/48x48/apps/microsoft-edge.png" },
    { "edge (private)", "/usr/bin/microsoft-edge-stable --inprivate", "/usr/share/icons/hicolor/48x48/apps/microsoft-edge.png" },
    { "firefox", "/usr/bin/firefox", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "firefox (private)", "/usr/bin/firefox --private-window", "/usr/share/icons/hicolor/48x48/apps/firefox.png" },
    { "mega", "/usr/bin/megasync", "/usr/share/icons/hicolor/48x48/apps/mega.png" },
    { "nextcloud", "/usr/bin/nextcloud", "/usr/share/icons/hicolor/48x48/apps/Nextcloud.png" },
    { "opera", "/usr/bin/opera", "/usr/share/pixmaps/opera.xpm" },
    { "qietrss", "/usr/bin/qietrss", "/usr/share/icons/hicolor/48x48/apps/quiterss.png" },
    { "seamonkey", "/usr/bin/seamonkey", "/usr/share/pixmaps/seamonkey.png" },
    { "tor browser", "/usr/bin/tor-browser", "/usr/share/icons/hicolor/scalable/apps/tor-browser.svg" },
    { "transmission", "/usr/bin/transmission-gtk", "/usr/share/icons/hicolor/scalable/apps/transmission.svg" },
    { "viking", "/usr/bin/viking", "/usr/share/icons/hicolor/48x48/apps/viking.png" },
    { "yt-dlg", "/usr/bin/yt-dlg", "/usr/share/icons/hicolor/48x48/apps/youtube-dl-gui.png" },
}
multimediamenu = {
    { "acidrip", "/usr/bin/acidrip", "/usr/share/icons/Vimix/scalable/apps/acidrip.svg" },
    { "audex", "/usr/bin/audex", "/usr/share/icons/hicolor/48x48/apps/audex.png" },
    { "brasero", "/usr/bin/brasero", "/usr/share/icons/hicolor/48x48/apps/brasero.png" },
    { "demon editor", "/usr/bin/demon-editor", "/usr/share/icons/hicolor/scalable/apps/demon-editor.svg" },
    { "handbrake", "/usr/bin/ghb", "/usr/share/icons/hicolor/scalable/apps/hb-icon.svg" },
    { "k3b", "/usr/bin/k3b", "/usr/share/icons/hicolor/48x48/apps/k3b.png" },
    { "k9copy", "/usr/bin/k9copy", "/usr/share/icons/hicolor/48x48/actions/k9copy.png" },
    { "kaffeine", "/usr/bin/kaffeine", "/usr/share/icons/hicolor/scalable/apps/kaffeine.svg" },
    { "mediathekview", "/home/hanez/opt/MediathekView/MediathekView", "/home/hanez/opt/MediathekView/MediathekView.svg" },
    { "spotiflyer", "/opt/spotiflyer/bin/SpotiFlyer", "/opt/spotiflyer/lib/SpotiFlyer.png" },
    { "spotify", "/usr/bin/spotify-tray", "/usr/share/pixmaps/spotify-client.png" },
    { "sound juicer", "/usr/bin/sound-juicer", "/usr/share/icons/hicolor/48x48/apps/org.gnome.SoundJuicer.png" },
    { "tvbrowser", "/usr/bin/tvbrowser", "/usr/share/icons/hicolor/48x48/apps/tvbrowser.png" },
    { "vlc", "/usr/bin/vlc", "/usr/share/icons/hicolor/48x48/apps/vlc.png" },
}
networkmenu = {
    { "ettercap", "/usr/bin/ettercap -G", "/usr/share/pixmaps/ettercap.svg" },
    { "fwbuilder", "/usr/bin/fwbuilder", "/usr/share/icons/hicolor/48x48/apps/fwbuilder.png" },
    { "gns3", "/usr/bin/gns3", "/usr/share/icons/hicolor/48x48/apps/gns3.png" },
    { "gufw", "/usr/bin/gufw_fixed", "/usr/share/icons/hicolor/scalable/apps/gufw.svg" },
    { "wireshark", "/usr/bin/wireshark-gtk", "/usr/share/icons/hicolor/48x48/apps/wireshark.png" },
    { "zenmap", "/usr/bin/gksu /usr/bin/zenmap", "/usr/share/zenmap/pixmaps/zenmap.png" },
}
officemenu = {
    --{ "calendar", "/usr/bin/io.elementary.calendar", "/usr/share/icons/elementary/apps/48/office-calendar.svg" },
    { "gimagereader (ocr)", "/usr/bin/gimagereader-gtk", "" },
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
    { "ausweisapp 2", "/usr/bin/AusweisApp2", "/usr/share/icons/hicolor/scalable/apps/AusweisApp2.svg" },
    { "cryptomator", "/usr/bin/cryptomator", "/usr/share/icons/hicolor/512x512/apps/org.cryptomator.Cryptomator.svg" },
    { "gnu privacy agent", "/usr/bin/gpa", "/usr/share/pixmaps/gpa.png" },
    { "keepassxc", "/usr/bin/keepassxc", "/usr/share/icons/hicolor/scalable/apps/keepassxc.svg" },
    { "kleopatra", "/usr/bin/kleopatra", "/usr/share/icons/hicolor/48x48/apps/kleopatra.png" },
    { "open ecard app", "/usr/bin/openecardapp", "/opt/open-ecard-app/lib/open-ecard-app.png" },
    { "seahorse", "/usr/bin/seahorse", "/usr/share/icons/hicolor/scalable/apps/org.gnome.seahorse.Application.svg" },
    { "tor browser", "/usr/bin/tor-browser", "/usr/share/icons/hicolor/scalable/apps/tor-browser.svg" },
    { "veracrypt", "/usr/bin/veracrypt", "/usr/share/icons/hicolor/scalable/apps/tor-browser.svg" },
    { "yubikey athenticator", "/usr/bin/yubioath-desktop", "/usr/share/pixmaps/com.yubico.yubioath.svg" },
    { "yubikey manager", "/usr/bin/ykman-gui", "/usr/share/pixmaps/ykman.png" },
    { "yubikey personalization tool", "/usr/bin/yubikey-personalization-gui", "/usr/share/icons/hicolor/48x48/apps/yubikey-personalization-gui.png" },
    { "yubikey piv manager", "/usr/bin/pivman", "/usr/share/pixmaps/pivman.xpm" },
    { "zulucrypt", "/usr/bin/zuluCrypt-gui", "/usr/share/pixmaps/zuluCrypt.papirus.dark.png" },
}
radiomenu = {
    { "gnuradio", "/usr/bin/gnuradio-companion", "/usr/share/gnuradio/grc/freedesktop/grc-icon-48.png" },
    { "gqrx", "/usr/bin/gqrx", "/usr/share/pixmaps/gqrx.svg" },
    { "urh", "/usr/bin/urh", "/usr/share/pixmaps/urh.png" },
}
sciencemenu = {
    { "epsilon", "/usr/bin/numworks-epsilon", "/usr/share/pixmaps/numworks-epsilon.png" },
    { "firebird nspire", "/usr/bin/firebird-emu", "/usr/share/icons/hicolor/512x512/apps/org.firebird-emus.firebird-emu.png" },
    { "google earth", "/usr/bin/google-earth-pro", "/opt/google/earth/pro/product_logo_32.xpm" },
    { "gpredict", "/usr/bin/gpredict", "/usr/share/pixmaps/gpredict-icon.png" },
    { "hp 15c", "/usr/bin/hp15c", "/usr/share/icons/hicolor/48x48/apps/hp15c.png" },
    { "stellarium", "/usr/bin/stellarium", "/usr/share/icons/hicolor/48x48/apps/stellarium.png" },
    { "worldwind", "/usr/bin/worldwind", "/usr/share/worldwind/src/images/32x32-icon-earth.png" },
}
systemmenu = {
    { "gparted", "/usr/bin/gparted", "/usr/share/icons/hicolor/48x48/apps/gparted.png" },
    { "hardinfo", "/usr/bin/hardinfo", "/usr/share/icons/hicolor/48x48/apps/hardinfo.png" },
    { "ksysguard", "/usr/bin/ksysguard", "/usr/share/icons/hicolor/16x16/apps/ksysguardd.png" },
    { "partition manager", "/usr/bin/partitionmanager", "/usr/share/icons/hicolor/scalable/apps/partitionmanager.svg" },
    { "printer", "/usr/bin/system-config-printer", "/usr/share/icons/Adwaita/48x48/legacy/printer-printing.png" },
    { "sysmon", "/usr/bin/sysmon", "/home/hanez/.config/awesome/icons/sysmon.png" },
    { "teamviewer", "/usr/bin/teamviewer", "/usr/share/icons/hicolor/48x48/apps/TeamViewer.png" },
    { "timeshift", "/usr/bin/timeshift-launcher", "/usr/share/icons/hicolor/48x48/apps/timeshift.png" },
    { "virt-manager", "/usr/bin/virt-manager", "/usr/share/icons/hicolor/48x48/apps/virt-manager.png" },
    { "virtualbox", "/usr/bin/virtualbox", "/usr/share/pixmaps/VBox.png" },
}
utilitiesmenu = {
    { "arandr", "/usr/bin/arandr", "/usr/share/icons/hicolor/scalable/devices/video-television.svg" },
    { "appearance", "/usr/bin/lxappearance", "/usr/share/icons/nuoveXT2/96x96/apps/preferences-desktop-theme.png" },
    { "file search tool", "/usr/bin/gnome-search-tool", "/usr/share/icons/Adwaita/48x48/legacy/system-search.png" },
    { "furiusisomount", "/usr/bin/furiusisomount", "/usr/share/furiusisomount/pix/furiusisomount.png" },
    { "raspberry pi imager", "/usr/bin/rpi-imager", "/usr/share/icons/hicolor/128x128/apps/rpi-imager.png" },
}
videomenu = {
    { "obs", "/usr/bin/obs", "/usr/share/icons/hicolor/256x256/apps/com.obsproject.Studio.png" },
    { "shotcut", "/usr/bin/shotcut", "/usr/share/icons/hicolor/64x64/apps/org.shotcut.Shotcut.png" },
}
windowsmenu = {
    { "bottles", "/usr/bin/bottles", "/usr/share/icons/hicolor/scalable/apps/com.usebottles.bottles.svg" },
    { "control panel", "wine /home/hanez/.wine/drive_c/windows/syswow64/control.exe", "" },
    { "playonlinux", "/usr/bin/playonlinux", "/usr/share/pixmaps/playonlinux.png" },
    { "wineconsole", "/usr/bin/wineconsole", "" },
    { "winefile", "/usr/bin/winefile", "" },
    { "winetricks", "/usr/bin/winetricks", "/usr/share/icons/hicolor/scalable/apps/winetricks.svg" },
    { "regedit", "/usr/bin/regedit", "" },
}
mainmenu = awful.menu({ items = {
    { "accessories", accessoriesmenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-accessories.png" },
    { "audio", audiomenu, "/home/hanez/.config/awesome/icons/synth2.png" },
    { "communication", communicationmenu, icondir.."actions/quote.png" },
    { "database", databasemenu, "/usr/share/icons/Adwaita/22x22/legacy/applications-development.png" },
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
    { "wine", windowsmenu, "" },
    { "filemanager (nemo)", "/usr/bin/nemo", "/usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png" },
    { "filemanager (thunar)", "/usr/bin/thunar", "/usr/share/icons/Adwaita/22x22/legacy/system-file-manager.png" },
    { "terminal (alacritty)", "/usr/bin/alacritty", "/usr/share/pixmaps/Alacritty.svg" },
    { "terminal (xfce4)", "/usr/bin/xfce4-terminal", "/usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png" },
    { "terminal (xterm)", terminal, "/usr/share/icons/Adwaita/22x22/legacy/utilities-terminal.png" },
    { "configuration", editor_cmd .. " " .. awesome.conffile, "/usr/share/icons/Adwaita/22x22/legacy/preferences-other.png" },
    { "reload", awesome.restart, "/usr/share/icons/Adwaita/22x22/legacy/view-refresh.png" },
    { "suspend", function () awful.util.spawn("/usr/bin/loginctl suspend") end, "/usr/share/icons/Faenza-Dark/apps/48/system-suspend.png" },
    { "quit", function() awesome.quit() end, "/usr/share/icons/Adwaita/22x22/legacy/system-log-out.png" }
  }
})

return mainmenu
