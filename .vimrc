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
" vim 用の統合ユーザインターフェース
NeoBundle 'Shougo/unite.vim'
" vimで非同期処理を実現する
NeoBundle 'Shougo/vimproc'
" ファイル操作をサポート(unite.vimとvimprocに依存)
NeoBundle 'Shougo/vimfiler'
" スクロール操作をなめらかにする
NeoBundle 'yuttie/comfortable-motion.vim'

call neobundle#end()

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

"----------------------------------------------------------
" ファイルタイプ別のVimプラグイン/インデントを有効にする
"----------------------------------------------------------
filetype plugin indent on

"----------------------------------------------------------
" 文字コード
"----------------------------------------------------------
" ファイル読み込み時の文字コード
set encoding=utf-8
" Vim Script内でマルチバイト文字を使う設定
scriptencoding utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" □や○文字が崩れる問題を解決
set ambiwidth=double

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
" ステータスライン
"----------------------------------------------------------
" ステータスラインを常に表示
set laststatus=2
" 現在のモードを表示
set showmode
" 打ったコマンドをステータスラインの下に表示
set showcmd
" ステータスラインの右側にカーソルの位置を表示する
set ruler
" ステータスラインに現在のgitブランチを表示する
if neobundle#is_installed('vim-fugitive')
  set statusline+=%{fugitive#statusline()}
endif

"----------------------------------------------------------
" キーマッピング(ノーマルモード)
"----------------------------------------------------------
" ウィンドウを下に移動
nnoremap sj <C-w>j
" ウィンドウを上に移動
nnoremap sk <C-w>k
" ウィンドウを右に移動
nnoremap sl <C-w>l
" ウィンドウを左に移動
nnoremap sh <C-w>h
" ウィンドウを水平分割(Hyperのキーマッピングに合わせる)
nnoremap se :<C-u>sp<CR>
" ウィンドウを垂直分割(Hyperのキーマッピングに合わせる)
nnoremap sd :<C-u>vs<CR>
" 選択しているバッファ以外を閉じる
nnoremap <silent> <Space>o  :only<CR>

if neobundle#is_installed('vim-fugitive')
  " 過去の変更を辿る
  nnoremap <silent> <Space>gb :Gblame<CR>
  " 差分を表示する
  nnoremap <silent> <Space>gd :Gdiff<CR>
  " ステータス画面を開く
  nnoremap <silent> <Space>gs :Gstatus<CR>
endif

"----------------------------------------------------------
" 自動コマンド
"----------------------------------------------------------
" :Unite bookmark後にEnter押下でそのディレクトリをVimfilerで開く
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')
