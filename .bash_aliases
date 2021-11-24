alias mkenv='python3 -m venv .venv && printf "source .venv/bin/activate\nexport VENV_PS1=\"\$(echo \${PS1} | xargs)\"\nunset PS1\n" > .envrc && direnv allow'
alias rmenv='rm -rf .venv .envrc'
