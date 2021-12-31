Previously I used <leader>ev to open up my dotfiles dir for editing.
How can I do something similar now, preferably with something built-in?
For example, right now, I would like to know the current inventory of Neovim
plugins in use.

The command to use is `:source $MYVIMRC`.
This could be assigned to a shortcut:
    nnoremap <leader>sv :source $MYVIMRC

Investigate setting of `TERM=screen-256color` in tmux config.
Manpage says TERM "must" be `screen` or `tmux`.
However, without this setting, my bash prompt coloration does not work.
What is the correct solution?
