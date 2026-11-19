# Armin's MangoWM (MangoWC) Config

My personal config for **[MangoWM](https://github.com/DreamMaoMao/mango/)** (also known as MangoWC) - a Wayland compositor built on `wlroots`. This setup tries to replicate my custom **DWM (Dynamic Window Manager)** workflow (including most of my custom keybinds) onto Wayland, bringing that keyboard-driven tiling window experience I've been living in for MANY years to the modern world.

![mangoprint.jpg](mangoprint.jpg)

## The big idea: DWM for Wayland, but make it bling

[DWM](https://dwm.suckless.org/) is an absolute legend in the Unix world. Seriously minimalist, dynamic tiling, almost entirely keyboard-driven via **Alt (Mod1)** or **Super (Win)**. It basically invented the **master-stack** layout - a big "master" zone on the left, a "stacking" zone on the right. DWM also gave us **tags** (virtual desktops you flip through with `Mod+1..9`), **scratchpads**, and a whole "do one thing well" ethos for window management.

**MangoWM** is the closest thing to a spiritual DWM successor on Wayland. MangoWM just tries to stay out of your way. This config pushes it into DWM-replacement territory for me: basically every keybind I've accumulated over the last ~7-8 years is here. Master resize (`Alt+h/l`), stack navigation (`Alt+j/k`), tag-based window wrangling (`Alt+Shift+1..9`). All that muscle memory transfers one-to-one, but now finally with those cool Wayland goodies: **tearing-free rendering, per-display fractional scaling, proper hardware cursor support, seamless GPU integration, no screen-tearing.**

If you're coming from Xorg and want a Wayland compositor that feels like DWM instead of i3 or Sway - then Mango might be worth an evening of fiddling.

## Color scheme: NORD

Colors follow the awesome [NORD palette](https://www.nordtheme.com/) by [Arctic Ice Studio](https://github.com/arcticicestudio/nord). I've been switching forth and back in terms of color palettes, but NORD is one I come back to on a regular basis.

- **High contrast, but low harshness** - Polar Night backgrounds + Snow Storm foregrounds = readable even after 12-hour coding sessions.
- **Frost accents** - the Frost biome (`#8FBCBB`, `#88C0D0`, `#81A1C1`, `#5E81AC`) gives us four distinct accent tones for focused windows, borders, UI elements.
- **Aurora for attention** - the Aurora biome (`#BF616A`, `#D08770`, `#EBCB8B`, `#A3BE8C`, `#B48EAD`) handles urgency, maximize, and split indicators without some too distracting visual clashing.

| Token               | Hex       | NORD Definition               |
|---------------------|-----------|-------------------------------|
| Root background     | `#2E3440` | `nord0` - Polar Night         |
| Borders (inactive)  | `#4C566A` | `nord3` - Polar Night lighter |
| Focused border      | `#5E81AC` | `nord10` - Frost              |
| Split indicator     | `#BF616A` | `nord11` - Aurora red         |
| Maximize indicator  | `#A3BE8C` | `nord14` - Aurora green       |
| Urgency             | `#BF616A` | `nord11` - Aurora red         |
| Scratchpad border   | `#81A1C1` | `nord9` - Frost               |

Links: [Nord Homepage](https://www.nordtheme.com/) · [Nord Docs](https://www.nordtheme.com/docs) · [Nord Ports](https://www.nordtheme.com/ports)

## Built on

- **Fedora 44**, May 2026
- **MangoWM** (git main)
- **Wayland** (wlroots-based)

## Keybindings

Modifier key is **Alt** (a.k.a. Mod1 in X11). Every binding has its DWM equivalent listed so you can cross-reference.

### General

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + r`       | `Mod + Shift + r`     | **Reload config** - hot-reloads `config.conf` without restarting. |
| `Alt + Shift + q`       | `Mod + Shift + q`     | **Quit** MangoWM entirely.                           |
| `Alt + Ctrl + Backspace`| `Ctrl + Alt + Bksp`   | Secondary quit (classic Xorg muscle memory).         |

### Application launcher

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + space`           | -                     | **Launch wofi** app runner (drun mode).              |
| `Alt + Shift + d`       | -                     | **Launch wofi** (alternative binding).               |
| `Alt + Return`          | `Mod + Return`        | **Spawn foot terminal** - the main terminal emulator. |

### Tag / workspace navigation

Tags = DWM's name for virtual desktops. 9 numbered tags plus a "view all" tag.

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + 1` through `9`   | `Mod + 1..9`         | **Switch to tag N** - views that tag.                |
| `Alt + 0`               | `Mod + 0`            | **View all tags** - shows every window everywhere (handy for overview). |
| `Alt + p`               | -                     | **Previous tag** - cycles to the tag on the left.    |
| `Alt + n`               | -                     | **Next tag** - cycles to the tag on the right.       |
| `Alt + ScrollUp`        | -                     | **Scroll to previous tag** - scroll on desktop bg.   |
| `Alt + ScrollDown`      | -                     | **Scroll to next tag** - same deal, opposite direction. |

### Moving windows between tags

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + 1..9`    | `Mod + Shift + 1..9` | **Move focused client to tag N and follow** - teleports the active window there and switches to it. |
| `Alt + Shift + Left`    | `Mod + Shift + Left` | **Move client to tag on the left** (`tagtoleft`).    |
| `Alt + Shift + Right`   | `Mod + Shift + Right`| **Move client to tag on the right** (`tagtoright`).  |

### Multi-monitor

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + ,`       | `Mod + Shift + ,`     | **Send client to monitor on the left** (`tagmon`).   |
| `Alt + Shift + .`       | `Mod + Shift + .`     | **Send client to monitor on the right** (`tagmon`).  |
| `Alt + Shift + -`       | -                     | **Send client to next monitor and follow** (cycles monitors in list order, wrapping). |

### Focus & stack navigation

DWM's `j`/`k` stack traversal and `Tab` cycling, all here.

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + j`               | `Mod + j`             | **Focus next window** in the stack (down).           |
| `Alt + k`               | `Mod + k`             | **Focus previous window** in the stack (up).         |
| `Alt + Tab`             | `Mod + Tab`           | **Focus next** (wraps around).                       |
| `Alt + Shift + Tab`     | `Mod + Shift + Tab`   | **Focus previous** (wraps around).                   |

### Directional focus

For moving focus in cardinal directions - handy in floating or non-linear tiling layouts.

| Binding                 | Action                                               |
|-------------------------|------------------------------------------------------|
| `Alt + Left`            | **Focus window to the left**.                        |
| `Alt + Right`           | **Focus window to the right**.                       |
| `Alt + Up`              | **Focus window above**.                              |
| `Alt + Down`            | **Focus window below**.                              |

### Moving windows in stack

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + j`       | `Mod + Shift + j`     | **Move window down** in stack order.                 |
| `Alt + Shift + k`       | `Mod + Shift + k`     | **Move window up** in stack order.                   |

### Master area management

Classic DWM master-stack layout: master zone on the left, stack zone on the right.

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + h`               | `Mod + h`             | **Shrink master area** by 5% (`mfact -0.05`).        |
| `Alt + l`               | `Mod + l`             | **Grow master area** by 5% (`mfact +0.05`).          |
| `Alt + u`               | `Mod + u`             | **Increase number of masters** (`nmaster +1`).       |
| `Alt + i`               | `Mod + i`             | **Decrease number of masters** (`nmaster -1`).       |

### Window resize (floating)

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + h`       | -                     | **Resize floating window left** by 10px.             |
| `Alt + Shift + l`       | -                     | **Resize floating window right** by 10px.            |

### Gaps

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Ctrl + j`        | `Mod + Ctrl + j`      | **Decrease inner gaps** by 1px.                      |
| `Alt + Ctrl + k`        | `Mod + Ctrl + k`      | **Increase inner gaps** by 1px.                      |

### Layout cycling

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + ,` (comma)       | -                     | **Previous layout** - cycles backward through tile, scroller, grid, deck, monocle, center_tile, vertical_tile, vertical_scroller. |
| `Alt + .` (period)      | -                     | **Next layout** - cycles forward through the same list. |

### Floating / scratchpad

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + Shift + space`   | `Mod + Shift + space` | **Toggle floating** - switches window between tiled and floating mode. |
| `Alt + grave`           | `Mod + grave`         | **Toggle scratchpad** - opens/closes a persistent scratchpad terminal (floating, centered, great for quick commands). |

### Killing windows

| Binding                 | DWM Equivalent        | Action                                               |
|-------------------------|-----------------------|------------------------------------------------------|
| `Alt + x`               | `Mod + x`             | **Kill focused client** - sends a close signal.      |
| `Alt + Shift + x`       | `Mod + Shift + x`     | **Force kill focused client** (same effect in Mango).|

### System control

| Binding                 | Action                                               |
|-------------------------|------------------------------------------------------|
| `Alt + Ctrl + l`        | **Lock screen** - invokes `swaylock`.                |
| `Alt + Ctrl + Up`       | **Increase brightness** - via `xbacklight`.          |
| `Alt + Ctrl + Down`     | **Decrease brightness** - via `xbacklight`.          |
| `Alt + Ctrl + Right`    | **Volume up** - invokes `scripts/vol +10`.           |
| `Alt + Ctrl + Left`     | **Volume down** - invokes `scripts/vol -10`.         |

### Screenshots

| Binding                 | Action                                               |
|-------------------------|------------------------------------------------------|
| `Alt + Shift + s`       | **Screenshot region** - interactive area selection.  |
| `Alt + Ctrl + s`        | **Screenshot full** - captures all monitors.         |

### Mouse

| Binding                              | Action                                               |
|--------------------------------------|------------------------------------------------------|
| `Alt + Left-click`                   | **Move window** - drag to reposition (works on any client, tiled included). |
| `Alt + Right-click`                  | **Resize window** - drag to resize.                  |

## Animation & visual config

MangoWM supports per-action animations with configurable curves and durations. This config enables smooth **slide** transitions for window open/close and **horizontal tag switching**. Key parameters:

| Parameter                           | Value    | Effect                                              |
|-------------------------------------|----------|-----------------------------------------------------|
| `animation_duration_*`              | 250ms    | All animations in a quarter-second - fast enough to be useful, slow enough to feel polished. |
| `animation_curve_open`              | `0.46,1,0.29,1` | Ease-out cubic bezier - windows "settle" into place. |
| `animation_curve_close`             | `0.08,0.92,0,1` | Ease-in cubic bezier - windows fade out snappy.     |
| `blur`                              | On       | Background blur with 5px radius, subtle noise, brightness/contrast tweaks for transparent surface readability. |
| `shadows`                           | On (floating only) | Drop shadows on floating windows only - tiled windows stay flat, keeping DWM's no-nonsense look. |
| `border_radius`                     | 6px      | Rounded corners on all windows for a modern, polished feel. |

## Supported layouts

The default is DWM's classic `tile` layout on all 9 tags, but MangoWM comes with more layouts you can flip through with `Alt + ,` and `Alt + .`:

- **tile** - The classic DWM master-stack. Master left, stack right.
- **scroller** - Horizontal scrolling layout; windows laid out left-to-right with focus-on-scroll.
- **grid** - All windows in an equally-sized grid.
- **deck** - Only the focused window fully visible; the rest stack like a deck of cards (monocle with previews).
- **monocle** - All windows maximized; only the focused one visible; `Alt+j/k` cycles through them.
- **center_tile** - Master centered instead of left-aligned.
- **vertical_tile** - Master on top, stack below (classic tile flipped).
- **vertical_scroller** - Scrollable vertical layout with a master area.

## Monitor setup

This config targets the 2x 4k 32" dual-monitor setup of my Fedora desktop machine:

| Monitor | Resolution         | Scale | Position    |
|---------|--------------------|-------|-------------|
| DP-2    | 3840×2160 (4K)     | 1.5   | `x:0, y:0` (left) |
| DP-1    | 3840×2160 (4K)     | 1.5   | `x:2560, y:0` (right - the offset accounts for 2560px effective width at 1.5× scale) |

Both monitors are 4K at 1.5× fractional scaling, giving a comfy 2560×1440 logical resolution. The `x:2560` offset on DP-1 lines things up right at scaled resolutions.

> Tip: `find . | less` in this repo to poke around the file tree.

## Requirements

- **MangoWM** - built from source: https://github.com/DreamMaoMao/mango/
- **Wayland session** - Fedora 44 (or any distro with a modern wlroots stack)
- **waybar** - status bar
- **wofi** - app launcher
- **foot** - terminal emulator
- **swaybg** - wallpaper
- **grim / slurp** - screenshots
- **swaylock** - screen locking (optional)
- **xbacklight** - backlight control (optional, probably only makes sense with acpilight)

## Installation

### Fedora

MangoWM is available via the [Terra](https://terra.fyralabs.com/) repo and a [COPR](https://copr.fedorainfracloud.org/coprs/dennemann/MangoWC/):

```bash
# Terra repo (recommended)
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf install mangowm

# COPR (alternative)
sudo dnf copr enable denneman/MangoWC
sudo dnf install mangowm
```

### Arch Linux

In the AUR - stable and git variants:

| Package | Type |
|---------|------|
| `mangowm` | AUR (stable release) |
| `mangowm-git` | AUR (git master) |

```bash
yay -S mangowm          # stable release
yay -S mangowm-git      # git version (latest)
```

[ArchWiki page](https://wiki.archlinux.org/title/MangoWM) has detailed setup guides.

### Debian / Ubuntu

No official packages yet. Build from source:

```bash
sudo apt install git meson ninja-build libwayland-dev wayland-protocols \
  libinput-dev libdrm-dev libxkbcommon-dev libpixman-1-dev \
  libdisplay-info-dev libliftoff-dev hwdata libpcre2-dev libxcb-dev \
  libxcb-util-dev seatd xwayland
git clone https://github.com/DreamMaoMao/mango.git
cd mango
meson setup build --prefix=/usr --buildtype=release
ninja -C build
sudo ninja -C build install
```

### Void Linux

Available in the main repo:

```bash
sudo xbps-install mangowc
```

### Other distributions

| Distribution | Package | Source |
|---|---|---|
| **Alpine Linux** | `mangowc` | edge/community |
| **Gentoo** | `gui-wm/mangowm` | GURU overlay |
| **NixOS** | `mangowm` | Flake with NixOS module |
| **openSUSE** | `mangowc-git` | OBS `home:darix:playground` |
| **FreeBSD** | `x11-wm/mangowc` | FreshPorts |

### Build from source (universal)

Deps: `meson`, `ninja`, `wayland`, `wayland-protocols`, `libinput`, `libdrm`, `libxkbcommon`, `pixman`, `libdisplay-info`, `libliftoff`, `hwdata`, `seatd`, `pcre2`, `xwayland`, `libxcb`

```bash
git clone https://github.com/DreamMaoMao/mango.git
cd mango
meson setup build --prefix=/usr --buildtype=release
ninja -C build
sudo ninja -C build install
```

### Installing this config

```bash
git clone https://github.com/armin/mango-config.git
cd mango-config
# Symlink or copy the config to MangoWM's config directory:
#   mkdir -p ~/.config/mangowm
#   ln -sf "$(pwd)/config.conf" ~/.config/mangowm/config.conf
```

> **Note:** Adjust paths and deps for your installation. Check the [MangoWM repo](https://github.com/DreamMaoMao/mango/) for the latest build instructions.

### IRC

So far I'm not aware of some IRC channel for Mango. :-( If you come across one, please let me know. Thank you.

## License

[MIT](LICENSE)
