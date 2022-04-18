alias mkenv='python3 -m venv .venv && printf "source .venv/bin/activate\nexport VENV_PS1=\"\$(echo \${PS1} | xargs)\"\nunset PS1\n" > .envrc && direnv allow'
alias rmenv='rm -rf .venv .envrc'
alias udcar='sudo apt update && sudo apt full-upgrade && sudo apt autoclean && sudo apt autoremove'
alias ssc='sudo systemctl'
alias scu='systemctl --user'
alias vla='sudo virsh list --all'
alias vss='sudo virsh start'
alias vsh='sudo virsh shutdown'
alias vco='sudo virsh console'

mcd () {
    mkdir -p "$1" && cd "$1"
}

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi
