Plugin that will lazy load [nvm](https://github.com/nvm-sh/nvm).

Running `nvm.sh` in your `.zshrc` is destroying startup time. This plugin will mitigate that.

Commands `nvm`, `node`, `yarn` and `npm` will load `nvm.sh` on their first invocation,
posing no start up time penalty for the shells that aren't going to use them at all.

There is only single time penalty for shell. Every next time you will run any of commands above, `nvm` will be already initialized.
