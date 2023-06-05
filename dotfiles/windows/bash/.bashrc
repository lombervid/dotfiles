path="$(pwd)"

if [[ "${path}" == "/c/WINDOWS/system32" ]]; then
    cd ~
fi

# OhMyPosh
eval "$(oh-my-posh init bash --config ~/p10k-lean.omp.json)"

# Aliases
alias exit='exit 0'
# ls
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -Ah'

# grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
