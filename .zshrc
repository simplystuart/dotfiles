# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# aliases
alias clear="clear && echo 'Use Ctrl-l instead'"
alias please="sudo"
alias spot="mdfind"
alias sshup="ssh-copy-id"

# base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# brew
export HOMEBREW_NO_ANALYTICS=1

# colors
autoload -U colors
colors
export CLICOLOR=1

# completion
autoload -U compinit
compinit

# history
setopt histignoredups
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# iterm2
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# prompt
setopt autocd
setopt promptsubst
export PS1='${HOST+"%{$fg_bold[red]%}%m"}%{$reset_color%}:%{$fg_bold[blue]%}%~%{$reset_color%} '

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# vi
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^J" down-line-or-history
bindkey "^K" up-line-or-history
export VISUAL=vim
export EDITOR=$VISUAL

# man
man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

# yarn
export PATH="$HOME/.yarn/bin:$PATH"
