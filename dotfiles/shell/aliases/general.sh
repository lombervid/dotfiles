
# eza
if (command_exists 'eza'); then
    alias ls='eza --icons=auto --group-directories-first --octal-permissions --group --smart-group'
    alias l='ls -laah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -Ah'
else
    alias ls='ls --color=tty'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -Ah'
fi

alias lsb='lsblk -o name,size,type,fstype,label,parttypename,uuid,mountpoints'

# Startx
alias startx='\startx ${XINITRC}'

# grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

# Get terminal name
alias terminal='ps -p $PPID | tail -n 1 | awk '\''{print $NF}'\'

# Neovim
if (command_exists 'nvim'); then
    alias vi="nvim"
    alias vim="nvim"
fi

# Batcat
if (command_exists 'bat'); then
    alias cat='bat --paging=never'
    alias catp='bat --paging=never -p'
    alias catn='bat --paging=never -n'
elif (command_exists 'batcat'); then
    alias cat='batcat --paging=never'
    alias catp='batcat --paging=never -p'
    alias catn='batcat --paging=never -n'
fi
