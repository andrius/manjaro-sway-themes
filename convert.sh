#!/usr/bin/env bash

# git repositories with xrdb or iterm2 themes
REPOSITORIES=( \
    https://github.com/Relaxed-Theme/relaxed-terminal-themes.git \
    https://github.com/challenger-deep-theme/iterm.git \
    https://github.com/fehawen/iterm2-material-theme.git \
    https://github.com/folke/tokyonight.nvim.git \
    https://github.com/hwyncho/ayu-iTerm.git \
    https://github.com/joshjon/bliss-iterm.git \
    https://github.com/leandromatos/pre-theme.git \
    https://github.com/mattly/iterm-colors-farmhouse.git \
    https://github.com/mattly/iterm-colors-pencil.git \
    https://github.com/mbadolato/iTerm2-Color-Schemes.git \
    https://github.com/mcchrish/iterm-snow.git \
    https://github.com/one-dark/iterm-one-dark-theme.git \
    https://github.com/rakr/hemisu-iterm2.git \
    https://github.com/rileytwo/kiss.git \
    https://github.com/sindresorhus/iterm2-snazzy.git \
    https://github.com/sonph/onehalf.git \
    https://github.com/stoeffel/material-iterm.git \
)

# extra files
wget https://raw.githubusercontent.com/aseom/dotfiles/master/osx/iterm2/papercolor-light.itermcolors

for THEME_REPOSITORY in "${REPOSITORIES[@]}"; do
    echo "Clonning ${THEME_REPOSITORY}"
    git clone --depth 1 "${THEME_REPOSITORY}" theme >/dev/null 2>&1
    find theme/ -type f \
        \( -iname '*.xrdb' -or -iname '*.itermcolors' \) \
        -exec cp {} . \;
    rm -rf theme
done

for ITERMCOLORS_FILE in *.itermcolors; do
    XRDB_FILE="$(echo "${ITERMCOLORS_FILE}" | sed "s/.itermcolors/.xrdb/")"
    if ! test -f "${XRDB_FILE}"; then
        echo "Converting ${ITERMCOLORS_FILE} to xrdb format"
        iterm2xrdb "${ITERMCOLORS_FILE}" > "${XRDB_FILE}"
    fi
    rm "${ITERMCOLORS_FILE}"
done

for XRDB_FILE in *.xrdb; do
    echo "Creating sway theme and foot.ini colors from ${XRDB_FILE}"
    /code/sway-theme.rb "${XRDB_FILE}"
    /code/foot-ini.rb "${XRDB_FILE}"
    rm "${XRDB_FILE}"
done
# vim: set ft=sh ts=4 sts=4 sw=4 et fileencoding=utf-8 ff=unix:
