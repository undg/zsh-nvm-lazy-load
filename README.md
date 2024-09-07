This is a plugin that will lazy load [nvm](https://github.com/nvm-sh/nvm).

Running `nvm.sh` in your `.zshrc` can significantly slow down startup time. This plugin is designed to mitigate that issue.

The commands `nvm`, `node`, `npm`, `npx`, `pnpm`, `yarn`, `pnpx`, `bun`, and `bunx` will load `nvm.sh` upon their first invocation, thereby avoiding any startup time penalty for shells that aren't going to use them at all.

There is only a single time penalty for the shell. After the first time you run any of the commands above, `nvm` will already be initialized, so there will be no additional delay.
