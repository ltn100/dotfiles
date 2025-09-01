# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export SHELL=$(which zsh)

CASE_SENSITIVE="true"


source ~/.config/oh_my_zsh/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen theme ltn100/prompty --branch=main

setopt PROMPT_SUBST
unsetopt autocd

if command -v pyenv 1>/dev/null 2>&1
then
    eval "$(pyenv init -)"
fi

#eval $(thefuck --alias)
#alias fu=fuck

# highlight grep
alias grep="grep --exclude=tags --colour=auto"

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

#bindkey '^p' history-search-backward
#bindkey '^n' history-search-forward

if command -v nvim 1>/dev/null
then
    alias vim=nvim
fi

#for bash?
#bind '"\C-p": history-search-backward'
#bind '"\C-n": history-search-forward'

antigen apply

