
#enables color in the terminal bash shell export

export CLICOLOR=1

# sets up the color scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad

#sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

#enables color for iTerm
export TERM=xterm-256color

export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
source ~/.git-completion.sh

export JSTESTDRIVER_HOME=/usr/local/bin
