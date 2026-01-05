# fzf
if (command_exists 'fzf'); then
    source <(fzf --zsh)
fi

# fnm
if (command_exists 'fnm'); then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# zoxide
if (command_exists 'zoxide'); then
    eval "$(zoxide init zsh)"
fi

# Homebrew
if (test -x /home/linuxbrew/.linuxbrew/bin/brew); then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# kubectl
if (command_exists 'kubectl'); then
    source <(kubectl completion zsh)
fi

# minikube
if (command_exists 'minikube'); then
    source <(minikube completion zsh)
fi
