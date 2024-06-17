alias udcar='sudo apt update && sudo apt full-upgrade && sudo apt autoclean && sudo apt autoremove'
alias ssc='sudo systemctl'
alias scu='systemctl --user'
alias vla='sudo virsh list --all'
alias vss='sudo virsh start'
alias vsh='sudo virsh shutdown'
alias vco='sudo virsh console'
alias nvd='nvim -c VimwikiMakeDiaryNote +'

function rg_nvim () {
    rg "$@" -c | cut -d ':' -f1 | xargs nvim -p
}

mkenv () {
    if [ ! -d .venv ]; then
        python3 -m venv .venv
    fi
    # Check before clobbering .envrc
    if [ ! -f .envrc ]; then
        # Create a 0-size file
        touch .envrc
        direnv allow
    fi
}

rmenv () {
    # Clean up our virtualenv and direnv
    # Check if .venv is a Python virtual environment before removing it
    if [ -d .venv ]; then
        # Reference for pyvenv.cfg as indicator:
        # https://docs.python.org/3/library/venv.html
        if [ -f .venv/pyvenv.cfg ]; then
            rm -rf --one-file-system .venv
        else
            echo The .venv dir does not appear to be a Python virtualenv.
        fi
    else
        echo "No virtualenv directory detected."
    fi
    # Only remove .envrc if its contents match print_python_envrc output
    if [ -f .envrc ]; then
        # Check if it's our empty 0-size file
        if [ ! -s .envrc ]; then
            rm .envrc
        else
            echo "Non-default .envrc not removed."
        fi
    else
        echo "No envrc file detected."
    fi
}

mkcd () {
    mkdir -p "$1" && cd "$1" || return
}

if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi

    alias ls='ls --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'

    alias ip='ip --color=auto'
fi

if [ -x /usr/bin/fdfind ]; then
    alias fd=/usr/bin/fdfind
fi
