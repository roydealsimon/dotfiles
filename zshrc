export PATH=/Users/roy/.rvm/gems/ruby-1.9.2-p180/bin:/Users/roy/.rvm/gems/ruby-1.9.2-p180@global/bin:/Users/roy/.rvm/rubies/ruby-1.9.2-p180/bin:/Users/roy/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

#enforce ack from /usr/local/bin
alias ack="/usr/local/bin/ack"

#make ls pretty-pretty
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias l="ls -lh"

#alias emacs="emacsclient -ct"
#alias de="/usr/local/bin/emacs --daemon && dvtm"

#enable completion system
autoload -U compinit
compinit
zstyle ':completion:*' menu select


#set history stuff
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY         # puts timestamps in the history

setopt HIST_VERIFY              # when using ! cmds, confirm first
setopt HIST_IGNORE_DUPS         # ignore same commands run twice
setopt APPEND_HISTORY           # don't overwrite history
setopt SHARE_HISTORY            # _all_ zsh sessions share the same history files
setopt INC_APPEND_HISTORY       # write after each command

setopt autopushd

bindkey ' ' magic-space

#set emacs the shell editor
#export EDITOR='emacsclient -ct'

export EMACS='/usr/local/bin/emacs'

source ~/gitstatus/gitstatus.zsh


#make the prompt pretty-pretty
autoload -U colors && colors
setopt prompt_subst
setopt notransient_rprompt
export PS1=$'
%{\e[0;34m%}∴ $(prompt_git_info)%{\e[0;34m%}%d%{\e[0m%}
%Bλ '

preexec () {
    echo -ne "$reset_color"
}

precmd () {
    echo -ne "$B"
}

# get zsh to offer corrections for incorrect commands
setopt correct

# allows the command stop to be used to stop jobs similar to C shells
alias stop='kill -TSTP'

#add Ctrl-w capabilities (kill region for later yanking)
bindkey '\C-x' kill-region

#enable bash style backward-kill-word
bindkey '\C-w' vi-backward-kill-word

# Upgrade Ctrl-q from just push-line to push-line-or-edit
bindkey '\eq' push-line-or-edit

setopt promptsubst

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

Dirstacksize=32
DIRSTACKFILE="${HOME}"/.zdirs

##https://github.com/defunkt/hub
function git(){hub "$@"}