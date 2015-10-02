source ~/.bash_profile


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
export LANG=ja_JP.UTF-8

setopt AUTO_CD # 入力されたコマンドが実行できず、入力と同じ名前のディレクトリがあるとき、入力を cd とみなす
setopt AUTO_PUSHD # cd するごとに自動的にディレクトリスタックに積む

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#
# set prompt
#
case ${UID} in
0)
  PROMPT="%{^[[31m%}%/%% "
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

