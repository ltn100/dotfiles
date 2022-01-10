# executed by the command interpreter for login shells.
# This file overrides any content in ~/.profile (that file will not be sourced
# at all.

# custom profile
if [ -d "$HOME/.profile.d" ]; then
    for i in $HOME/.profile.d/*; do
        if [ -r $i ]; then
            . $i
        fi
    done
    unset i
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

