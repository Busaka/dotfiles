import subprocess
config.load_autoconfig()
# exec(open("/home/ll/.bin/mm.py").read())

c.spellcheck.languages = ['en-US']
c.auto_save.session = True
c.completion.cmd_history_max_items = 1000
c.completion.scrollbar.padding = 0
# Value to send in the `Accept-Language` header.
# c.content.headers.accept_language = "en-GB,en,en-US"
c.content.headers.accept_language = "en-US,en;q=0.8,fi;q=0.6"
c.content.notifications = True 
# c.content.user_stylesheets = ["styles/style2.css"]
# c.colors.webpage.darkmode.enabled  = True
c.downloads.open_dispatcher = "xdg-open"
c.downloads.position = "bottom"
c.input.insert_mode.auto_load = False
c.messages.timeout = 3000
c.editor.command = ["st", "-e", "nvim", "{}"]
c.prompt.radius = 0
# c.scrolling.bar = "never"
c.scrolling.bar = "always"
c.scrolling.smooth = True
c.statusbar.padding = {"top": 0, "right": 0, "bottom": 0, "left": 0}
c.statusbar.widgets = ["url", "scroll_raw", "progress"]
c.tabs.background = True
#c.tabs.favicons.scale = 2
#c.tabs.indicator.padding = {"top": 0, "right": 0, "bottom": 0, "left": 0}
c.tabs.position = "top"
c.tabs.show = "always"
# c.tabs.show_switching_delay = 2000
# c.tabs.title.format = ""
# c.tabs.title.format_pinned = c.tabs.title.format
# c.tabs.width = 24
# c.tabs.indicator.width = 0
c.tabs.padding = {"top": 0, "right": 3, "bottom": 0, "left": 3}
c.url.start_pages = "about:blank"
c.url.default_page = "https://www.google.com"
c.downloads.location.prompt = False
c.content.geolocation = False
c.content.ssl_strict = True
c.content.autoplay = False
#c.downloads.remove_finished = 800
# c.qt.force_platform = Wayland
# c.qt.force_platformtheme = Wayland


# Fnux's configuration file for qutebrowser >=1.0
# See http://qutebrowser.org/doc/help/settings.html for all available settings.

# General
# c.url.start_pages = "file:///home/fnux/.local/var/lib/browser-homepage/home.html"
# c.url.default_page = "file:///home/fnux/.local/var/lib/browser-homepage/home.html"
c.content.default_encoding = "utf-8"
c.editor.command = ['urxvt256c', '-e','vim', '{}']

# Rendering
import platform
if platform.node() == 'hiln':
    config.set('qt.force_software_rendering', True)

# Tabs
c.tabs.background = True
c.tabs.select_on_remove = 'prev'

# Keybindings
config.unbind('th')
config.unbind('tl')

config.bind('o', 'set-cmd-text -s :open')
config.bind('O', 'set-cmd-text :open {url:pretty}')
config.bind('t', 'set-cmd-text -s :open -t ')
config.bind('T', 'set-cmd-text :open -t {url:pretty}')

# config.bind('m', 'spawn mpv {url}', mode='normal')
# config.bind('M', 'hint links spawn mpv {url}', mode='normal')

c.hints.dictionary = "/usr/share/dict/british"
c.url.searchengines = {"DEFAULT": "https://google.com/search?&q={}",
"dd": "https://www.duckduckgo.com/?q={}",
"ddi": "https://duckduckgo.com/?q={}&iar=images",
"ggi": "https://www.google.co.uk/search?q={}&tbm=isch",
"w": "https://en.wikipedia.org/w/index.php?search={}",
"st": "http://store.steampowered.com/search/?term={}",
"g": "https://www.google.com/search?q={}",
"gi": "https://www.google.com/search?q={}&tbm=isch",
"mw": "http://en.uesp.net/w/index.php?title=Special%3ASearch&search={}",
"aur": "https://aur.archlinux.org/packages/?O=0&K={}",
"pac": "https://www.archlinux.org/packages/?sort=&arch=x86_64&maintainer=&flagged=&q={}",
"aw": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
"gw": "https://wiki.gentoo.org/index.php?title=Special%3ASearch&search={}&go=Go",
"i": "http://www.imdb.com/find?ref_=nv_sr_fn&s=all&q={}",
"dick": "https://en.wiktionary.org/wiki/{}",
"ety": "http://www.etymonline.com/index.php?allowed_in_frame=0&search={}",
"u": "http://www.urbandictionary.com/define.php?term={}",
"y": "https://www.youtube.com/results?search_query={}",
"r": "https://www.reddit.com/r/{}/new/",
"it": "https://itch.io/search?q={}",
"tpb": "https://thepiratebay.org/search/{}/0/7/0",
"p": "https://www.protondb.com/search?q={}",
"a": "https://www.amazon.co.uk/s/?url=search-alias&field-keywords={}", 
"eb": "https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2380057.m570.l1313&_nkw={}&_sacat=0", 
"ji": "https://jiji.co.ke/search?query={}", 
"ju": "https://www.jumia.co.ke/catalog/?q={}", 
}
c.completion.open_categories = ["quickmarks", "bookmarks", "history"]
# ads
c.content.blocking.enabled = True
c.content.blocking.adblock.lists.append("http://sbc.io/hosts/hosts")
c.content.blocking.whitelist = ["thepiratebay.org", "www.bet365.com"]

# zoom

c.zoom.default = 100

# colours

## Background color of the tab bar.
## Type: QssColor
c.colors.tabs.bar.bg = "#000000"

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = "#000000"

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = "#b4b4b4"

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = "#000000"

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = "#b4b4b4"

## Background color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.bg = "#ebe5d9"

## Foreground color of selected even tabs.
## Type: QtColor
c.colors.tabs.selected.even.fg = "#000000"

## Background color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.bg = "#ebe5d9"

## Foreground color of selected odd tabs.
## Type: QtColor
c.colors.tabs.selected.odd.fg = "#000000"

# keys

#config.bind('<Ctrl-Shift-m>', 'spawn --detach mpv --force-window yes {url}')
# config.bind('<Ctrl-Shift-y>', 'spawn --detach mpv --force-window yes --ytdl-format=160+249 {url}')
config.bind('zd', 'download-open')
config.bind('xx', 'config-cycle tabs.show switching always')
config.bind('xp', 'spawn ~/.local/bin/pocketadd {url}')
# config.bind('xh', 'config-cycle content.user_stylesheets /home/ll/.config/qutebrowser/styles/style2.css  /home/ll/.config/qutebrowser/styles/style.css')
# config.bind('xh', 'config-cycle content.user_stylesheets "" /home/ll/.config/qutebrowser/styles/style2.css')
config.bind('B', 'set-cmd-text -s :bookmark-load')
config.bind('xs', 'config-source')
config.bind('xb', 'config-cycle statusbar.show in-mode always')
config.bind('<Alt+Left>', 'tab-prev')
config.bind('<Alt+Right>', 'tab-next')
config.bind('<Alt+Down>', 'tab-give')
# Unbind shite defaults
config.unbind('q')
# config.unbind('z')
config.unbind('<Ctrl-v>')

config.bind('<Ctrl-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind('<Ctrl-Shift-y>', 'spawn --detach mpv --force-window yes {url}')

# configs are for downloading videos and music
config.bind('zy', 'hint links spawn ~/.local/bin/ytdv {hint-url}')
config.bind('zp', 'hint links spawn ~/.local/bin/ytdlp {hint-url} ~/Downloads/qbdownloads')
config.bind('zv', 'spawn ~/.local/bin/ytdv {url}')
config.bind('qr', 'spawn ~/.local/bin/qr {url}')

# Dealing with login forms
# config.bind(',p', 'spawn --userscript qute-pass --dmenu-invocation wofi -dmenu')
# config.bind(',P', 'spawn --userscript qute-pass --dmenu-invocation dmenu --password-only')
# config.bind('<Ctrl-Shift-p>', 'spawn --userscript password_fill')
config.bind('<,><l>', 'spawn --userscript qute-pass --dmenu-invocation "wofi --show dmenu" -U secret -u "username: (.+)"')
config.bind('<,><u><l>', 'spawn --userscript qute-pass --dmenu-invocation "wofi --show dmenu" --username-only')
config.bind('<,><p><l>', 'spawn --userscript qute-pass --dmenu-invocation "wofi --show dmenu" --password-only')
config.bind('<,><o><l>', 'spawn --userscript qute-pass --dmenu-invocation "wofi --show dmenu" --otp-only')
# config.bind('<,><l>', 'spawn --userscript qute-pass --username-target secret --username-regex "username: (.+)"')
# config.bind('<,><u><l>', 'spawn --userscript qute-pass --username-only')
# config.bind('<,><p><l>', 'spawn --userscript qute-pass --password-only')
# config.bind('<,><o><l>', 'spawn --userscript qute-pass --otp-only')
