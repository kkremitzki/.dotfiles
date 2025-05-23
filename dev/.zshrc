# Initialize tmux first, if we haven't
# Check for interactive shell and existing tmux session
if [[ $- =~ i ]] && [ -z "${TMUX}" ]; then
    # Check if we have tmux command available
    if command -v tmux &>/dev/null; then
        # Check for VS Code & IntelliJ shell environment resolution
        # TODO: Can't assume presence of pstree.
        if ! pstree -s $$ | grep -wq code && [ -z "${INTELLIJ_ENVIRONMENT_READER}" ]; then
            exec tmux
        fi
    fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

# History options
# EXTENDED_HISTORY not storing command time correctly, disable for now
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY HIST_IGNORE_SPACE

# Use vi keybindings
bindkey -v
autoload -z edit-command-line
zle -N edit-command-line
# Optionally use emacs-style binding so we don't overlap with vi visual mode
# bindkey "^X^E" edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000000
SAVEHIST=2000000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

if command -v dircolors &>/dev/null; then
    eval "$(dircolors -b)"
fi

# Special-case handling for homebrew
if command -v gdircolors &>/dev/null; then
    eval "$(gdircolors -b)"

    alias ls='ls --color=always'
    alias grep='grep --color=always'
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

if [ -f ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
    source ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
elif [ -f /usr/share/powerlevel9k/powerlevel9k.zsh-theme ]; then
    source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
fi

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey '^F' autosuggest-accept
fi

if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey '^F' autosuggest-accept
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # TODO: Determine if/why this is necessary
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
fi

# File locations used by Homebrew
if [ -d /usr/local/Cellar/fzf ]; then
    if [ -f /usr/local/Cellar/fzf/*/shell/completion.zsh ]; then
        source /usr/local/Cellar/fzf/*/shell/completion.zsh
    fi
    if [ -f /usr/local/Cellar/fzf/*/shell/key-bindings.zsh ]; then
        source /usr/local/Cellar/fzf/*/shell/key-bindings.zsh
    fi
fi

if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
    source /usr/share/doc/fzf/examples/completion.zsh
fi

if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.config/kdesrc-buildrc.zsh ]; then
    source ~/.config/kdesrc-buildrc.zsh
fi

# Hacky solution for lxd completion, can we do better?
if [ -f /usr/local/go/src/github.com/lxc/lxd/scripts/bash/lxd-client ]; then
    # Normally available in bash...
    _have()
    {
        PATH=$PATH:/usr/sbin:/sbin:/usr/local/sbin type $1 &>/dev/null
    }

    source /usr/local/go/src/github.com/lxc/lxd/scripts/bash/lxd-client

fi

if [ -f /usr/share/bash-completion/completions/lxc ]; then
    # Normally available in bash...
    _have()
    {
        PATH=$PATH:/usr/sbin:/sbin:/usr/local/sbin type $1 &>/dev/null
    }

    source /usr/share/bash-completion/completions/lxc
fi

if [ -f /usr/share/zsh/vendor-completions/_incus ]; then
    source /usr/share/zsh/vendor-completions/_incus
fi

if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

if command -v terraform &>/dev/null; then
    complete -o nospace -C $(command -v terraform) terraform
fi

if command -v doctl &>/dev/null; then
    source <(doctl completion zsh)
    compdef _doctl doctl
fi

autoload -U +X bashcompinit && bashcompinit

if command -v uv &>/dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi

if command -v uvx &>/dev/null; then
    eval "$(uvx --generate-shell-completion zsh)"
fi
