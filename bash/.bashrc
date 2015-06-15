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

alias maven="/nix/store/xbj41xqbns5mbk4h5nkc7z6bl4k795n3-oraclejdk-8u31/bin/java -Dmaven.home=/nix/store/2sml0hs53bnzg0hhzkvyc0di9ndlhl4z-apache-maven-3.2.5 -Dclassworlds.conf=/nix/store/2sml0hs53bnzg0hhzkvyc0di9ndlhl4z-apache-maven-3.2.5/bin/m2.conf -Didea.launcher.port=7535 -Didea.launcher.bin.path=/nix/store/jaygjklmbiz4g07wnm8psrwfgl47p4kb-idea-community-14.0.3/idea-community-14.0.3/bin -Dfile.encoding=UTF-8 -classpath /nix/store/2sml0hs53bnzg0hhzkvyc0di9ndlhl4z-apache-maven-3.2.5/boot/plexus-classworlds-2.5.2.jar:/nix/store/jaygjklmbiz4g07wnm8psrwfgl47p4kb-idea-community-14.0.3/idea-community-14.0.3/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain org.codehaus.classworlds.Launcher -Didea.version=14.0.3"
