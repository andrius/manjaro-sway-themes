Manjaro sway themes
===================
Color themes for manjaro sway and foot terminal (https://manjaro.org/download/#sway and https://github.com/Manjaro-Sway/manjaro-sway)

# Installation

## Sway theme

Copy your theme to the sway themes folder:

```shell
mkdir -p ~/.config/sway/themes
cp -R "./themes/foot/THEME NAME" >> ~/.config/sway/themes
```

Edit `definitions` file in theme folder and tweak theme variables (fonts and GTK, icon and cursor themes).
This is important step, especially for light themes. `nvim "~/.config/sway/themes/THEME NAME/definitions"`:

```conf
# some global theme specific variables
set $gtk-theme Matcha-light-azul
set $icon-theme Papirus-Light-Maia
set $cursor-theme xcursor-breeze-snow
set $gui-font Roboto 11
set $term-font PragmataPro Mono 11
set $kvantum-theme Matcha-Light
```

Edit your `~/.config/sway/config` file and specify `$theme` variable (example for ayu Light theme):

**IMPORTANT: Do not forget to escape spaces! For some reason, theme path plased between quotation marks does not work.**

```shell
set $theme $HOME/.config/sway/themes/ayu\ Light
```

## Foot terminal

Edit your `~/.config/foot.ini` and replace both `[cursor]` and `[colors]` sections.
Or just add theme content at the bottom of `foot.ini`:

```shell
cat "./themes/foot/THEME NAME/foot.ini" >> ~/.config/foot/foot.ini
```

# Screenshot

Sway WM, foot and nvim with ayu Light theme
![image](https://user-images.githubusercontent.com/26776/156170917-0517802f-fdb1-4985-83f0-8c6988b189cb.png)

# Color palette

Most of the themes generated from this repository https://github.com/mbadolato/iTerm2-Color-Schemes,
where you can [find colors palette/screenshots](https://github.com/mbadolato/iTerm2-Color-Schemes#screenshots).

For the rest themes, usually some screenshot is available through theme repository,
[`convert.sh` script include them all](https://github.com/andrius/manjaro-sway-themes/blob/master/convert.sh#L3).
