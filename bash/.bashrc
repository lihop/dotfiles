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
PATH=$PATH:~/usr/bin:~/.dynamic-colors/bin

# Use previous color scheme
dynamic-colors init

mvn_path=$(readlink -f $(which mvn))
idea_path=$(readlink -f $(which idea-community))
tmp_var=${idea_path#*community-}
idea_version=${tmp_var%/bin*}
alias maven="$(readlink -f $(which java)) -Dmaven.home=${mvn_path%/bin/mvn} -Dclassworlds.conf=${mvn_path%/mvn}/m2.conf -Didea.launcher.port=7535 -Didea.launcher.bin.path=${idea_path%/idea-community} -Dfile.encoding=UTF-8 -classpath ${mvn_path%/bin/mvn}/boot/plexus-classworlds-2.5.2.jar:${idea_path%/bin/idea-community}/idea-community-$idea_version/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain org.codehaus.classworlds.Launcher -Didea.version=$idea_version"

alias lock="xscreensaver-command --lock"
