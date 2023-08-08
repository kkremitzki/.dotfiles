Find if there is a bash equivalent to zsh's automatic definition of `..`,
`...`, etc.

Check out telescope.nvim @ https://github.com/nvim-telescope/telescope.nvim

Might be nice to have a sort of update utility for dotfiles, at a basic level
this will require something like 'git pull && stow -R .' but it could be made more
elaborate by having automatisms and error reporting. This is something that could
live in ~/.local/bin, for example, with the idea being I can ssh to a host that is
set up to use my dotfiles to run a single command which pulls any updates available
and deploys them. The need for this is not terribly pressing, but it's a decent
example of the plan to deploy small, useful utilities as part of my dotfiles
repo.

While bootstraping, I get this result if I open neovim before gruvbox is installed:
Error detected while processing /home/debian/dotfiles/.config/nvim/init.lua:
E5113: Error while calling lua chunk: /home/debian/.config/nvim/init.lua:6: Vim(colorscheme):E185: Cannot find color scheme 'gruvbox'
stack traceback:
        [C]: in function 'cmd'
        /home/debian/.config/nvim/init.lua:6: in main chunk
How can I guard against this error and handle it appropriately?

When using Steam, absolute symlinks get created that produce a warning in stow:
  BUG in find_stowed_path? Absolute/relative mismatch between Stow dir dotfiles and path /home/kurt/.steam/steam.pid at /usr/share/perl5/Stow.pm line 966.
  BUG in find_stowed_path? Absolute/relative mismatch between Stow dir dotfiles and path /home/kurt/.steam/sdk32/steam at /usr/share/perl5/Stow.pm line 966.

To fix, run:
  $ unlink .steampath
  $ ln -s .steam/sdk32/steam .steampath
  $ unlink .steampid
  $ ln -s .steam/steam.pid .steampid
  
Handle dependency of wl-clipboard without needing to pull in unnecessary
wayland packages

Development deploys with multiple tools: Docker, LXD, Vagrant, as reasonable,
for bookworm & sid.

Separate meta-development stuff like the Vagrantfile and the dotfiles
themselves, so for example make stow-friendly dirs named "omnibus", and maybe
one that is "minimal", one that is "default"

In vagrant env, after setup, running `zsh` enters into bash shell with tmux etc
activated (so the dotfiles took effect) but upon running `zsh` a second time we
see the expected zsh prompt, YET `echo $SHELL` continues to report `/bin/bash`.
