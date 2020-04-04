"* ===============================================================
" プラグインマネージャー
"=============================================================== *

"*
" NeoBundle
"--------------------------------------------------------------- *
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

" ○------------------------------- ○
" インストールするVimプラグインを以下に記述

" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" vim用のGitコマンドを追加
NeoBundle 'tpope/vim-fugitive'
" vim 用の統合ユーザインターフェース
NeoBundle 'Shougo/unite.vim'
" vimで非同期処理を実現する
NeoBundle 'Shougo/vimproc'
" ファイル操作をサポート(unite.vimとvimprocに依存)
NeoBundle 'Shougo/vimfiler'
" スクロール操作をなめらかにする
NeoBundle 'yuttie/comfortable-motion.vim'
" ウィンドウサイズの変更を簡単・高速にする
NeoBundle 'simeji/winresizer'
" Gitで管理しているファイル編集時に差分を表現する記号が左端に表示
NeoBundle 'airblade/vim-gitgutter'
" Agで高速grep
NeoBundle 'rking/ag.vim'
" Ctrl+pでカレントディレクトリのファイル名絞り込み
NeoBundle "ctrlpvim/ctrlp.vim"
" ブラウザでMarkdownプレビュー用
NeoBundle 'tyru/open-browser.vim'
" Markdownプレビュー
NeoBundle 'kannokanno/previm'
" Marddownの表作成
NeoBundle 'mattn/vim-maketable'
" コード整形
NeoBundle 'prettier/vim-prettier'
" ○------------------------------- ○

call neobundle#end()

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck





"* ===============================================================
" 設定
"=============================================================== *

"*
" 文字
"--------------------------------------------------------------- *
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
" 不可視文字を表示
set list
" 行末を'↲'、タブを'>'、末尾のスペースを'_'で表示
set listchars=eol:↲,tab:>.,trail:_

"*
" 表示
"--------------------------------------------------------------- *
" 行番号の表示
set number
" ハイライト表示
set hlsearch

"*
" ステータスライン
"--------------------------------------------------------------- *
" 常に表示
set laststatus=2
" モードを表示
set showmode
" コマンドをステータスラインの下に表示
set showcmd
" カーソルの位置を表示
set ruler
" 現在のgitブランチを表示
if neobundle#is_installed('vim-fugitive')
  set statusline+=%{fugitive#statusline()}
endif

"*
" ファイルタイプ
"--------------------------------------------------------------- *
filetype plugin indent on

"*
" バックアップ/スワップ/アンドゥ/vimingoファイル
"--------------------------------------------------------------- *
" viminfo ファイルを作成しない
set viminfo=
" swap ファイルを作成しない
set noswapfile
" バックアップファイルを作成しない
set nobackup

"*
" クリップボード
"--------------------------------------------------------------- *
" vimのヤンク、プット有効
" Ctrl+c、Ctrl+v有効
set clipboard=unnamed,autoselect

"*
" マウス
"--------------------------------------------------------------- *
set mouse=a

"*
" 警告
"--------------------------------------------------------------- *
" 無視する
set hidden
" 警告音を無効にする
set belloff=all





"* ===============================================================
" キーマッピング <normal>
"=============================================================== *

"*
" 設定ファイル
"--------------------------------------------------------------- *
" [.vimrc] を \ev で開く
nnoremap <Leader>ev :e ~/.dotfiles/.vimrc<CR>
" [.tmux.conf] を \et で開く
nnoremap <Leader>et :e ~/.dotfiles/.tmux.conf<CR>
" [.bashrc] を \eb で開く
nnoremap <Leader>eb :e ~/.dotfiles/.bashrc<CR>
" [.bash_profile] を \ep で開く
nnoremap <Leader>ep :e ~/.dotfiles/.bash_profile<CR>

"*
" 表示
"--------------------------------------------------------------- *
" Esc連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

"*
" ウィンドウ
"--------------------------------------------------------------- *
" 下に移動
nnoremap sj <C-w>j
" 上に移動
nnoremap sk <C-w>k
" 右に移動
nnoremap sl <C-w>l
" 左に移動
nnoremap sh <C-w>h

" 水平分割
nnoremap ss :<C-u>sp<CR>
" 垂直分割
nnoremap sv :<C-u>vs<CR>

"*
" バッファ
"--------------------------------------------------------------- *
" カレントバッファ以外を閉じる
nnoremap <silent> <Space>o :only<CR>
" 次のバッファ
nnoremap <silent> <C-j> :bprev<CR>
" 前のバッファ
nnoremap <silent> <C-k> :bnext<CR>





"* ===============================================================
" キーマッピング <insert>
"=============================================================== *

"*
" mode change <insert → normal>
"--------------------------------------------------------------- *
" jjでinsert modeを抜ける
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキー確定でinsert modeを抜ける
inoremap <silent> っj <ESC>





"* ===============================================================
" プラグイン設定
"=============================================================== *

"*
" vimfiler
"--------------------------------------------------------------- *
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動
let g:vimfiler_safe_mode_by_default = 0
" ファイルツリーアイコンの設定
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

" カレントバッファのディレクトリを開く
nnoremap sf :VimFilerBufferDir<Return>
" 作業ディレクトリをIDE風に開く
nnoremap sF :VimFilerExplorer -find<Return>

"*
" unite
"--------------------------------------------------------------- *
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  " デフォルトのgrepコマンドをagにする
  let g:unite_source_grep_command = 'ag'
  " grep時のデフォルトオプションを設定
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  " grep時の再帰オプションを設定
  let g:unite_source_grep_recursive_opt = ''
endif

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" バッファ一覧を開く
nnoremap sb :unite buffer<Return>

"*
" ctrlp
"--------------------------------------------------------------- *
" ag入ってたらagで検索させる
" ついでにキャッシュファイルからの検索もさせない
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

"*
" fugitive
"--------------------------------------------------------------- *
" Git 過去の変更を辿る
nnoremap <silent> <Space>gb :Gblame<CR>
" Git 差分を表示する
nnoremap <silent> <Space>gd :Gdiff<CR>
" Git ステータス画面を開く
nnoremap <silent> <Space>gs :Gstatus<CR>

"*
" vim-gitgutte
"--------------------------------------------------------------- *
" 記号更新のタイミング
set updatetime=250

"*
" Previm
"--------------------------------------------------------------- *
" open-browserを使う
let g:previm_open_cmd = ''

" 何もしないキーを設定
nnoremap [previm] <Nop>
" [previm] に スペース + pを割り当て
nmap <Space>p [previm]
" prefix + o でブラウザプレビュー
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
" prefix + r でブラウザリロード
nnoremap <silent> [previm]r :call previm#refresh()<CR>

"*
" ctags
"--------------------------------------------------------------- *
" カレントディレクトリの.tasを読込
set tags=./.tags;

"*
" vim-maketable
"--------------------------------------------------------------- *
" 最初の行をテーブルのヘッダーとして使用
vnoremap <Space>t :MakeTable!<CR>

"*
" prettier
"--------------------------------------------------------------- *
" コード整形
vnoremap pre :Prettier<CR>

