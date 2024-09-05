#!/usr/bin/env zsh

# Create wrappers around common nvm consumers.
# nvm, node, yarn and npm will load nvm.sh on their first invocation,
# posing no start up time penalty for the shells that aren't going to use them at all.
# There is only single time penalty for one shell.

typeset -ga lazyLoadLabels=(nvm node npm npx pnpm yarn pnpx bun)

set-labels() {
    for label in "${lazyLoadLabels[@]}"; do
        eval "$label() { work; command $label \"\$@\"; }"
    done
}

remove-all-lazyLoadLabels() {
    for label in $lazyLoadLabels; do
        unset -f $label
    done
    unset -v lazyLoadLabels
}

load-nvm() {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

work() {
    load-nvm
    remove-all-lazyLoadLabels
}

set-labels