# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=/home/ben_andken/bin:/home/build:/home/msijka/bin:/home/msijka/bin/backup:/usr/pkg/bin:$PATH
#alias emacs="emacs.sh"
alias grep='grep --color=auto'
alias cscope='cscope -d -p3'

# enable to run pahole
#export LD_LIBRARY_PATH=/home/benjamin_andken/lib:$LD_LIBRARY_PATH

EDITOR="emacs"
export EDITOR

SVN_EDITOR=EDITOR
export SVN_EDITOR

