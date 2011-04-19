" '"' 以降はコメント

" 自動バックアップをきる
set nobackup
" シンタックスハイライトを使う
syntax on 
" 色は「darkblue」テーマで。
"colorscheme darkblue
"colorscheme blue " 青系テーマ
colorscheme desert " 砂漠系テーマ

" tab 文字の代わりにホワイトスペースを挿入する
set expandtab
" tab はホワイトスペース 2 文字分
set tabstop=2
set softtabstop=2
" インデントはホワイトスペース 2 文字分
set shiftwidth=2
"set textwidth=4

" 自動的にインデントする
set autoindent
set cindent

" 左端に行番号を示す
set number
" ファイル名をタイトルバーに表示する
set title
set laststatus=2
" ステータスラインは
" 「{GetStatusEx関数の戻り値}ファイル名(フルパス)<列番号:行番号>
set statusline=%y%{GetStatusEx()}%F%m%r%=<%c:%l>

" set encoding=utf-8
set fileencoding=utf-8
" set termencoding=cp932

set visualbell

call pathogen#runtime_append_all_bundles()

function! GetStatusEx()
    let str = ''
    let str = str . '[' .&fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ']' . str
    endif
    return str
endfunction

