" '"' 以降はコメント

"
" 現在のオプション設定の状態を確認する
" :set
" 書き換えたら
" :source $MYVIMRC
"

" ================ 初期化〜 ================
if has('vim_starting')
  set nocompatible " vi 互換モードを切る
endif

set encoding=utf-8
set fileencoding=utf-8
" set termencoding=cp932


" ================ プラグインの読み込み ================
call plug#begin('~/.vim/plugged')

Plug 'prabirshrestha/vim-lsp' " Language Server Protocol 対応
Plug 'mattn/vim-lsp-settings' " ↑ の設定を簡易にするプラグイン

Plug 'prabirshrestha/asyncomplete.vim' " コード補完
Plug 'prabirshrestha/asyncomplete-lsp.vim' " ↑ の LSP 対応
Plug 'tpope/vim-fugitive' " Git 統合
Plug 'nathanaelkane/vim-indent-guides'
Plug 'thinca/vim-quickrun'
Plug 'glidenote/memolist.vim' " This is a vimscript for create and manage memo. memolist.vim is inspired by jekyll.vim.

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
"End NeoBundle Scripts-------------------------

" ================ エディタの基本設定 ================

set nobackup   " 自動バックアップをきる
set noswapfile " スワップファイルを作らない
set autoread   " 他でファイルが書き換えられたら自動的にファイルを読み直す
set history=500 " コマンドラインの実行記録を 500 件保持する
set visualbell
set hidden " 保存しないでも他のファイルが開ける
set backspace=indent,eol,start " Backspace キーを押すとバックスペースキーと同じ動作をする
set tags=tags " tagexplorer

" ================ エディタの見た目の設定 ================
set number       " 左端に行番号を示す
set title        " ファイル名をタイトルバーに表示する
set nowrap       " 行末折り返しをしない
set showcmd      " 現在入力中のコマンドをステータス行に表示する (ex, 20cw と入力中 => 画面右下に出てくる)
set showmode     " 現在のモードを表示する (ex, i 押して入力モードに入る => 画面左下に出てくる)
set showmatch    " 対応する括弧をハイライトする
set cursorline   " カーソル行をハイライトする
set modeline     " モードライン機能を有効にする
set modelines=5  " ファイルの上から 5 行目までモードライン定義を探す
set laststatus=2 " ステータスライン
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l> " ステータスラインは「{GetStatusEx関数の戻り値}ファイル名(フルパス)<列番号:行番号>
set scrolloff=5      " 末尾５行からスクロール開始
set sidescrolloff=15 " 右端15文字からスクロール開始
set sidescroll=1     " 左端 15 文字からスクロール開始
set list             " 制御文字（改行とか）を表示する
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:< " 制御文字を表示するときに使う記号

syntax on    " シンタックスハイライトを使う
colorscheme elflord " カラースキーマはデフォで

" ================ インデントの設定 ================
set autoindent  " 自動的にインデントする
set smartindent " 'スマートな' インデントを行う
set smarttab    " 行頭で tab をうつと、 shiftwitdh 分だけ tab がうたれる

set expandtab   " tab 文字の代わりにホワイトスペースを挿入しない
set tabstop=2     " tab はホワイトスペース 2 文字分
set softtabstop=2 " tab はホワイトスペース 2 文字分
set shiftwidth=2  " インデントはホワイトスペース 2 文字分

" ================ 検索の設定 ================
set wrapscan   " ファイル末尾まで検索したら、次はファイル先頭へ戻る
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 上で設定したけど、大文字が検索条件に入ってる時はやっぱり区別する
set incsearch  " インクリメンタルサーチを有効にする (キーを入力するごとにすぐにサーチする
set hlsearch   " 検索文字をハイライトする

" ================ 畳み込みの設定 ================
" set foldmethod=syntax
" set foldopen=all
" set foldnestmax=3
" set nofoldenable " 

" ================ 補完の設定 ================
set wildmenu " コマンドの補完が見やすくなる


" ================ キーマップ (ショートカット) 設定 ================
" gd で vim-lsp のコード定義移動を実行
nmap <buffer> gd <plug>(lsp-definition)
" \r で quick run の QuickRun を実行
nnoremap <leader>r :QuickRun<CR>

function! GetStatusEx()
  let str = ''
  let str = str . '[' .&fileformat . ']'
  if has('multi_byte') && &fileencoding != ''
    let str = '[' . &fileencoding . ']' . str
  endif
  return str
endfunction
