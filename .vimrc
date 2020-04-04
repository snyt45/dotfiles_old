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
" Marddownの表整形
NeoBundle 'kannokanno/previm'
" コード整形
NeoBundle 'prettier/vim-prettier'

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
" 文字
"----------------------------------------------------------
" list モードを設定。タブや改行文字、末尾の半角スペースなど、通常は非表示の文字を目に見える記号で表示
set list
" 行末を'↲'、タブを'>'、末尾のスペースを'_'で表示
set listchars=eol:↲,tab:>.,trail:_

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
" マウス操作
"----------------------------------------------------------
set mouse=a

"----------------------------------------------------------
" 警告
"----------------------------------------------------------
" 無視する
set hidden

"----------------------------------------------------------
" 警告音
"----------------------------------------------------------
" 無効にする
set belloff=all

"----------------------------------------------------------
" ハイライト
"----------------------------------------------------------
set hlsearch

"----------------------------------------------------------
" デフォルトのファイラー
"----------------------------------------------------------
" デフォルトをVimfilerにする｡:e .でvimfilerが開けるようになる｡
let g:vimfiler_as_default_explorer = 1

"----------------------------------------------------------
" キーマッピング(ノーマルモード)
"----------------------------------------------------------

"===========================
" 設定ファイル呼び出し
"===========================
" .vimrcを \ev で開く
nnoremap <Leader>ev :e ~/.dotfiles/.vimrc<CR>
" .tmux.confを \et で開く
nnoremap <Leader>et :e ~/.dotfiles/.tmux.conf<CR>
" .bashrcを \eb で開く
nnoremap <Leader>eb :e ~/.dotfiles/.bashrc<CR>
" .bash_profileを \ep で開く
nnoremap <Leader>ep :e ~/.dotfiles/.bash_profile<CR>

"===========================
" ウィンドウ移動
"===========================
" ウィンドウを下に移動
nnoremap sj <C-w>j
" ウィンドウを上に移動
nnoremap sk <C-w>k
" ウィンドウを右に移動
nnoremap sl <C-w>l
" ウィンドウを左に移動
nnoremap sh <C-w>h

"===========================
" ウィンドウ分割
"===========================
" ウィンドウを水平分割
nnoremap ss :<C-u>sp<CR>
" ウィンドウを垂直分割
nnoremap sv :<C-u>vs<CR>

"===========================
" タブ移動
"===========================
" 前のタブに移動
nmap <S-Tab> :tabprev<Return>
" 次のタブに移動
nmap <Tab> :tabnext<Return>

"===========================
" バッファ
"===========================
" 選択しているバッファ以外を閉じる
nnoremap <silent> <Space>o  :only<CR>
" 次のバッファを開く
nnoremap <silent> <C-j> :bprev<CR>
" 前のバッファを開く
nnoremap <silent> <C-k> :bnext<CR>

"===========================
" ハイライト
"===========================
" Esc連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"===========================
" fugitive.vim
"===========================
" Git 過去の変更を辿る
nnoremap <silent> <Space>gb :Gblame<CR>
" Git 差分を表示する
nnoremap <silent> <Space>gd :Gdiff<CR>
" Git ステータス画面を開く
nnoremap <silent> <Space>gs :Gstatus<CR>

"===========================
" vimfiler
"===========================
nmap sf :VimFilerBufferDir<Return>
nmap sF :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>

"----------------------------------------------------------
" キーマッピング(インサートモード)
"----------------------------------------------------------
" jjでインサートモードを抜ける
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>

"----------------------------------------------------------
" 自動コマンド
"----------------------------------------------------------
" :Unite bookmark後にEnter押下でそのディレクトリをVimfilerで開く
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

"----------------------------------------------------------
" ctagsのtagsファイル読み込み
"----------------------------------------------------------
set tags=./.tags;

"----------------------------------------------------------
" vimfiler
"----------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

"----------------------------------------------------------
" vim-gitgutte
"----------------------------------------------------------
" 記号更新のタイミング
set updatetime=250


"------------------------------------
" Unit.vim
"------------------------------------
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  " デフォルトのgrepコマンドをagにする
  let g:unite_source_grep_command = 'ag'
  " grep時のデフォルトオプションを設定
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  " grep時の再帰オプションを設定
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------
" ctrlp.vim
"------------------------------------
" ag入ってたらagで検索させる
" ついでにキャッシュファイルからの検索もさせない
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif


"------------------------------------
" Previm
"------------------------------------
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>
