# Manchester United — Omarchy theme

2026/27 **home red** (`#DC1F26`) mixed with **away royal blue** (`#0845BA`). Real 4K photographs of Old Trafford and Manchester, a UNITED bar badge, and a summonable overlay. Not an official club product.

![Empty desktop — Old Trafford aerial](docs/screenshots/desktop.jpg)

![Empty window](docs/screenshots/empty-window.jpg)

![Salford Quays night](docs/screenshots/salford-quays.jpg)

## Pages

![About](docs/screenshots/about.jpg)

![Files](docs/screenshots/files.jpg)

![Menu](docs/screenshots/menu.jpg)

![Theme picker](docs/screenshots/theme-menu.jpg)

![Backgrounds](docs/screenshots/backgrounds.jpg)

![Keybindings](docs/screenshots/keybindings.jpg)

![btop](docs/screenshots/btop.jpg)

![Theatre of Dreams](docs/screenshots/theatre-of-dreams.jpg)

![Stretford End](docs/screenshots/stretford-end.jpg)

## Install

Theme (desktop colours, wallpapers, lock preview):

```bash
omarchy theme install https://github.com/anujraja/omarchy-manchester-united-theme.git
```

Plugin (UNITED bar badge + overlay), from the same repository:

```bash
omarchy plugin add https://github.com/anujraja/omarchy-manchester-united-theme.git --enable
```

The badge lands on the right of the bar. Left click opens the overlay; right click cycles the wallpaper; Escape or click dismisses the overlay.

Optional screensaver wordmark:

```bash
cp branding/screensaver.txt ~/.config/omarchy/branding/screensaver.txt
```

## Remove

```bash
omarchy plugin remove io.github.anujraja.manchester-united
omarchy theme remove manchester-united
```

The plugin only writes its own entry in `~/.config/omarchy/shell.json` (added by `omarchy plugin enable`). It does not overwrite other user configuration. No extra packages are required.

## Palette

| Token | Colour | Role |
| --- | --- | --- |
| Accent | `#DC1F26` | 26/27 home red |
| Blue | `#0845BA` | 26/27 away royal |
| Background | `#0B1220` | Night navy |
| Foreground | `#E9EEF6` | White kit trim |

Window borders use a home-red → away-blue gradient.

## Wallpapers

All `3840×2160`. These photographs remain under their original licenses; this repository does not relicense them.

- Old Trafford aerial — Arne Müseler, Wikimedia Commons
- Stretford End — Stacey MacNaught, Flickr / Wikimedia Commons
- Theatre of Dreams — Samuel Regan-Asante, Unsplash
- Salford Quays night — Unsplash
- Sir Alex corner — Wikimedia Commons
- Manchester canal — Geograph
- Sir Alex Stand — Geograph

## License

MIT for the theme files, plugin QML, and documentation. Wallpaper files keep their upstream licenses as listed above.
