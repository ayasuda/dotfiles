source ~/.bash_profile

HISTFILE=~/.histfile # 履歴ファイル
HISTSIZE=1000 # メモリに保存されるコマンド履歴の件数
SAVEHIST=5000 # ファイルに保存されるコマンド履歴の件数

# 環境変数設定
export LANG=ja_JP.UTF-8
export PAGER=less
# export EDITOR
# export VISUAL

# zsh オプション
# <D> 基本的にデフォルトでセットされてるやつ
# <C> csh のエミュレーションのときにデフォルトでセットされるやつ
# <K> ksh のエミュレーションのときにデフォルトでセットされるやつ
# <S>  sh のエミュレーションのときにデフォルトでセットされるやつ
# <Z> zsh のエミュレーションのときにデフォルトでセットされるやつ

## ディレクトリ移動
setopt AUTO_CD      # 入力されたコマンドが実行できず、入力と同じ名前のディレクトリがあるとき、入力を cd とみなす
setopt AUTO_PUSHD   # cd するごとに自動的にディレクトリスタックに積む
# CDABLE_VARS       # cd するときにディレクトリじゃなく、`/` からも始まらないとき、`~` を自動的に補完して変数として展開する。( see the section `Filename Expansion` )
# CHASE_DOTS        # cd するときに .. を使うと本当のディレクトリに移動する（リンクだったとき用）
# CHASE_LINKS       # cd するときに .. 使わなくても本当のディレクトリに移動する（リンクだったとき用）
# POSIX_CD          # <K> <S> 長いから man 読んで
# PUSHD_IGNORE_DUPS # pushd するときに、同じディレクトリを登録しない
# PUSHD_MINUS       # pushd の数を反転させる。 + が - になる。なお、このとき -1 はひとつ前。
# PUSHD_SILENT      # pushd を静かにする。
# PUSHD_TO_HOME     # pushd の引数がない場合は `pushd $HOME` になる

## 補完
# ALWAYS_LAST_PROMPT <D>
# ALWAYS_TO_END
# AUTO_LIST (-9) <D>
# AUTO_MENU <D>
# AUTO_NAME_DIRS
# AUTO_PARAM_KEYS <D>
# AUTO_PARAM_SLASH <D>
# AUTO_REMOVE_SLASH <D>
# BASH_AUTO_LIST
# COMPLETE_ALIASES
# COMPLETE_IN_WORD
# GLOB_COMPLETE
# HASH_LIST_ALL <D>
# LIST_AMBIGUOS <D>
# LIST_BEEP
# LIST_PACKED
# LIST_ROWS_FIRST
# LIST_TYPES (X) <D>
# MENU_COMPLETE (-Y)
# REX_EXACT (-S)
#
## 拡張 (Expansion and Globbing)
# BAD_PATTERN (+2) <C> <Z>
# BARE_GLOB_QUAL <Z>
# BRACE_CCL
# CASE_GLOB <D>
# CASE_MATCH <D>
# CSH_NULL_GLOB <C>
# EQUALS <Z>
# EXTENDED_GLOB
# FORCE_FLOAT
# GLOB (+F, ksh: +f) <D>
# GLOB_ASSIGN <C>
# GLOB_DOTS (-4)
# GLOB_SUBST <C> <K> <S>
# HIST_SUBST_PATTERN
# IGNORE_BRACES (-I) <S>
# IGNORE_CLOSE_BRACES
# KSH_GLOB <K>
# MAGIC_EQUAL_SUBST
# MARK_DIRS (-8, ksh: -X)
# MULTIBYTE <C> <K> <Z>
# NOMATCH (+3) <C> <Z>
# NULL_GLOB (-G)
# NUMERIC_GLOB_SORT
# RC_EXPAND_PARAM (-P)
# REMATCH_PCRE <Z>
# SH_GLOB <K> <S>
# UNSET (+u, ksh: +u) <K> <S> <Z>
# WARN_CREATE_GLOBAL

## History
# APPEND_HISTORY <D>
# BANG_HIST (+K) <C> <Z>
# ExTENDED_HISTORY <C>
# HIST_ALLOW_CLOBBER
# HIST_BEEP <D>
# HIST_EXPIRE_DUPS_FIRST
# HIST_FCNTL_LOCK
# HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # 同じコマンドをヒストリに残さない
setopt HIST_IGNORE_SPACE    # スペースから始まるコマンド行はヒストリに残さない
# HIST_LEX_WORDS
# HIST_NO_FUNCTIONS
# HIST_NO_STORE
setopt HIST_REDUCE_BLANKS # ヒストリに保存するときに余分なスペースを削除する
# HIST_SAVE_BY_COPY <D>
# HIST_SAVE_NO_DUPS
# HIST_VERIFY
# INC_APPEND_HISTORY
# INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY # 同時に起動したzshの間でヒストリを共有する

## 初期化 (Initialisation)
# ALL_EXPORT (-a, ksh: -a)
# GLOBAL_EXPORT <Z>
# GLOBAL_RCS (-d) <D>
# RCS (+f) <D>

## 入出力
# ALIASES <D>
# CLOBBER (+C, ksh: +C) <D>
# CORRECT (-0)
# CORRECT_ALL (-O)
# DVORAK
# FLOW_CONTROL <D>
# IGNORE_EOF (-7)
# INTERACTIVE_COMMENTS (-k) <K> <S>
# HASH_CMDS <D>
# HASH_DIRS <D>
# HASH_EXECUTABLES_ONLY
# MAIL_WARNING (-U)
# PATH_DIRS (-Q)
# PATH_SCRIPT <K> <S>
# PRINT_EIGHT_BIT
# PRINT_EXIT_VALUE (-1)
# RC_QUOTES
# RM_STAR_SILENT (-H) <K> <S>
# RM_STAR_WAIT
# SHORT_LOOPS
# SUN_KEYBOARD_HACK

## Job Control
# AUTO_CONTINUE
# AUTO_RESUME (-W)
# BG_NICE (-G) <C> <Z>
# CHECK_JOBS <Z>
# HUP <Z>
# LONG_LIST_JOBS (-R)
# MONITOR (-m, ksh: -m)
# NOTIFY (-5, ksh: -b) <Z)
# POSIX_JOBS <K> <S>

## プロンプト (Prompting)
# PROMPT_BANG <K>
# PROMPT_CR (+V) <D>
# PROMPT_SP <D>
# PROMPT_PERCENT <C> <Z>
# PROMPT_SUBST <K> <S>
# TRANSIENT_PROMPT

## Script and Functions
# C_BASES
# C_PRECEDENCES
# DEBUG_BEFORE_CMD
# ERR_EXIT
# ERR_RETURN
# EVAL_LINENO <Z>
# EXEC (+n, ksh: +n) <D>
# FUNCTION_ARGZERO <C> <Z>
# LOCAL_LOOPS
# LOCAL_OPTIONS <K>
# LOCAL_PATTERNS
# LOCAL_TRAPS <K>
# MULTI_FUNC_DEF <Z>
# MULTIOS <Z>
# OCTAL_ZEROES <S>
# PIRE_FAIL
# SOURCE_TRACE
# TYPESET_SILENT
# VERBOSE (-v, ksh: -v)
# XTRACE (-x, ksh: -x)

## Shell Emulation
# BASH_REMATCH
# BSD_ECHO <S>
# CONTINUE_ON_ERROR
# CSH_JUNKIE_HISTORY
# BASH_REMATCH
# BSD_ECHO <S>
# CONTINUE_ON_ERROR
# CSH_JUNKIE_HISTORY <C>
# CSH_JUNKIE_LOOPS <C>
# CSH_JUNKIE_QUOTES <C>
# CSH_NULLCMD <C>
# KSH_ARRAYS <K> <S>
# KSH_AUTOLOAD <K> <S>
# KSH_OPTION_PRINT <K>
# KSH_TYPESET <K>
# KSH_ZERO_SUBSCRIPT
# POSIX_ALIASES <K> <S>
# POSIX_ARGZERO
# POSIX_BUILIINS <K> <S>
# POSIX_IDENTIFIERS <K> <S>
# POSIX_STRINGS <K> <S>
# POSIX_TRAPS <K> <S>
# SH_FILE_EXPANSION <K> <S>
# SH_NULLCMD <K> <S>
# SH_OPTION_LETTERS <K> <S>
# SH_WORD_SPLIT (-y) <K> <S>
# TRAP_ASYNC

## Shell State
# INTERACTIVE (-i, ksh: -i)
# LOGIN (-l, ksh: -l)
# PRIVILEGED (-p, ksh: -p)
# RESTRICTED (-r)
# SHIN_STDIN (-s, ksh: -s)
# SINGLE_COMMAND (-t, ksh: -t)

## Zle
# BEEP (+B) <D>
# COMBINING_CHARS
# EMACS
# OVERSTRIKE
# SINGLE_LINE_ZLE (-M) <K>
# VI
# ZLE (-Z)

## Option のエイリアス
# BRACE_EXPAND
# DOT_GLOB
# HASH_ALL
# HIST_APPEND
# HIST_EXPAND
# LOG
# MAIL_WARN
# ONE_CMD
# PHYSICAL
# PROMPT_VARS
# STDIN
# TRACK_ALL




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


if which direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi

if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
