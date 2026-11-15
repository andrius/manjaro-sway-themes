# CLAUDE.md

## Overview

Own repo (github.com/andrius/manjaro-sway-themes) of color themes for Manjaro Sway and the foot terminal (the manjaro-sway project). Themes live under `themes/`.

## Stack

Ruby ERB generators (`sway-theme.erb`/`.rb`, `foot-ini.erb`/`.rb`) render per-theme configs; `convert.sh` + `build.sh` (Dockerised) generate them. Install by copying a theme into `~/.config/sway/themes` and tuning its `definitions` file.

Last commit: 2022-03-01.
