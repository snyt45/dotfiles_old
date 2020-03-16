"----------------------------------------------------------
" NeoBundle
"----------------------------------------------------------
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" vim用のGitコマンドを追加
NeoBundle 'tpope/vim-fugitive'
" 末尾の全角半角空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'

call neobundle#end()

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"----------------------------------------------------------
" ファイルタイプ別のVimプラグイン/インデントを有効にする
"----------------------------------------------------------
filetype plugin indent on

"----------------------------------------------------------
" スワップファイルを作成しない
"----------------------------------------------------------
" viminfo ファイルを作成しない
set viminfo=
" swap ファイルを作成しない
set noswapfile
" バックアップファイルを作成しない
set nobackup

"----------------------------------------------------------
" クリップボード機能
"----------------------------------------------------------
" vimのヤンク、プット有効
" Ctrl+c、Ctrl+v有効
set clipboard=unnamed,autoselect


"----------------------------------------------------------
" 行番号の表示
"----------------------------------------------------------
set number

"----------------------------------------------------------
" vim-fugitive
"----------------------------------------------------------
"vimのステータスラインに現在のブランチ名を表示
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
