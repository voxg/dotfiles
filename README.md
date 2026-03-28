# dotfiles

This is a repo for my personal configuration files, starting with Neovim.

# Homebrew

Separate files per OS type, in `brew/$OS/Brewfile`. CWD into the appropriate directory and:

```shell
brew bundle dump # Creates the Brewfile
brew bundle install # Installs crap from the Brewfile
```

# Neovim

There's a reason I have 3 Neovim directories...

I was using AstroNvim, which was really cool but had serious problems editing
PowerShell scripts. I maintain a lot of PowerShell code for work, so I really
needed it to work better. After too much time trying, I couldn't figure out
which of the plugins or configurations that come with AstroNvim was to blame.

I tried going back to VS Code for just PowerShell stuff, but that was so bad.
The Vim/Neovim plugins for VS Code just aren't good enough to be my daily
daily driver. I tried Doom Emacs with evil mode, but holy crap is that a
sluggish and unstable mess.

So I decided I needed to go back to Neovim, but build my own config from
scratch rather than rely on someone else's choices that I don't understand.
That was better for a while, but took too much effort to maintain.

When AstroNvim 4 came out, I decided to give it another try. It was a lot
better, so that's what I currently use.

Both times switching Neovim configs, I wanted to be able to quickly jump
back and forth between them, so I kept all 3. But only `nvim-astro4` is
maintained and used currently.
