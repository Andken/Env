# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=/u/benjamia/bin:/usr/software/rats/bin:/usr/pkg/bin:$PATH
#alias emacs="emacs.sh"
alias grep='grep --color=auto'
alias cscope='cscope -d -p3'

# enable to run pahole
#export LD_LIBRARY_PATH=/home/benjamin_andken/lib:$LD_LIBRARY_PATH

EDITOR="emacs"
export EDITOR

SVN_EDITOR=EDITOR
export SVN_EDITOR

if [ -a "/mnt/project/granite/gdb/7.8/bin/gdb" ]
then
    alias gdb="/mnt/project/granite/gdb/7.8/bin/gdb -annotate=3"
fi

