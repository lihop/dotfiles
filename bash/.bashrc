#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

set -o vi

export VISUAL=vim
export EDITOR=$VISUAL
PATH=$PATH:~/.dynamic-colors/bin

# Use previous color scheme
dynamic-colors init
