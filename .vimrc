" '"' 以降はコメント

" vi 互換モードを切り、より使いやすくする。 (まぁ、vimrc 見つかった時点で off になるけど)
set nocompatible

" ================ Pathogen の設定 ================
" pathogen.vim
runtime bundle/vim-patogen/autoload/patogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ================ エディタの基本設定 ================
set nobackup " 自動バックアップをきる
set number   " 左端に行番号を示す
set title    " ファイル名をタイトルバーに表示する
set history=500 " コマンドラインの実行記録を 500 件保持する
set visualbell
syntax on    " シンタックスハイライトを使う
colorscheme desert " 砂漠系テーマ
set noexpandtab " tab 文字の代わりにホワイトスペースを挿入する
set tabstop=2 " tab はホワイトスペース 2 文字分
set softtabstop=2
set shiftwidth=2 " インデントはホワイトスペース 2 文字分

" ================ インデントの設定 ================
set autoindent  " 自動的にインデントする
set smartindent " 'スマートな' インデントを行う
set smarttab    " 行頭で tab をうつと、 shiftwitdh 分だけ tab がうたれる

set laststatus=2
" ステータスラインは
" 「{GetStatusEx関数の戻り値}ファイル名(フルパス)<列番号:行番号>
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>

" set encoding=utf-8
set fileencoding=utf-8
" set termencoding=cp932


set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<


""" ref.vim
nmap ,rp :<C-u>Ref phpmanual<Space>
let g:ref_phpmanual_path = '/home/ayasuda/dotfile-vim/.vim/doc/phpmanual'

""" tagexplorer
set tags=tags

""" for php
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=2

function! GetStatusEx()
    let str = ''
    let str = str . '[' .&fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ']' . str
    endif
    return str
endfunction

