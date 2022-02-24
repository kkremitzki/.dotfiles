Find if there is a bash equivalent to zsh's automatic definition of `..`,
`...`, etc.

Q: I have intentionally broken transparent background support with current tmux
   config. How can I fix it? Do I want it to be disabled?

A: `:hi! Normal ctermbg=NONE guibg=NONE` added to vim config.

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
