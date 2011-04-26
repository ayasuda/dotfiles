# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ayasuda/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
export LANG=ja_JP.UTF-8


#
# set prompt
#
case ${UID} in
0)
  PROMPT="%/%% "
  PROMPT2="%_%% "
  SPROMPT="%r is correct? [n,y,a,e]: "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%/%% "
  PROMPT2="%_%% "
  SPROMPT="%r is correct? [n,y,a,e]: "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
  PROMPT="${HOST%%.*} ${PROMPT}"
  ;;
esac
