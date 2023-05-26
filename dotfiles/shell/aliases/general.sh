# ls
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -lah'

# Startx
alias startx='\startx ${XINITRC}'

# grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

# Neovim
if (command_exists 'nvim'); then
    alias vi="nvim"
    alias vim="nvim"
fi

# Batcat
if (command_exists 'bat'); then
    alias cat='bat  --paging=never'
    alias catp='bat  --paging=never -p'
    alias catn='bat  --paging=never -n'
elif (command_exists 'batcat'); then
    alias cat='batcat  --paging=never'
    alias catp='batcat  --paging=never -p'
    alias catn='batcat  --paging=never -n'
fi
