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
" ウィンドウサイズの変更を簡単・高速にする
NeoBundle 'simeji/winresizer'
" Gitで管理しているファイル編集時に差分を表現する記号が左端に表示
NeoBundle 'airblade/vim-gitgutter'
" Agで高速grep
NeoBundle 'rking/ag.vim'
" ブラウザでMarkdownプレビュー用
NeoBundle 'tyru/open-browser.vim'
" Markdownプレビュー
NeoBundle 'kannokanno/previm'
" Marddownの表作成
NeoBundle 'mattn/vim-maketable'
" コード整形
NeoBundle 'prettier/vim-prettier'
" vim ステータスライン
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" tmux ステータスライン
NeoBundle 'edkolev/tmuxline.vim'
" solarized
NeoBundle 'altercation/vim-colors-solarized'

" コードの自動補完
NeoBundle 'Shougo/deoplete.nvim'
" vim8でdeopleteを使うのに必要
NeoBundle 'roxma/nvim-yarp'
" vim8でdeopleteを使うのに必要
NeoBundle 'roxma/vim-hug-neovim-rpc'
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
" 不可視文字を表示
set list
" 行末を'↲'、タブを'>'、末尾のスペースを'_'で表示
set listchars=eol:↲,tab:>.,trail:_
" ファイル末尾の改行をそのまま保持｡あれば保持｡なくてもないのを保持｡
set nofixendofline

"*
" 表示
"--------------------------------------------------------------- *
" 行番号の表示
set number
" ハイライト表示
set hlsearch
" シンタックスハイライト
syntax on
set background=dark

if has("mac")
  colorscheme default
elseif has("unix")
  colorscheme solarized
endif

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
" ディレクトリ
"--------------------------------------------------------------- *
" カレントディレクトリをカレントバッファ(今開いているバッファ)の位置に自動的に変更
:set autochdir

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
" タブ
"--------------------------------------------------------------- *
" 次のタブ
nnoremap <silent> <C-l> :tabnext<CR>
" 前のタブ
nnoremap <silent> <C-h> :tabprevious<CR>
" 新規タブ
nnoremap <silent> tn :tablast <bar> tabnew<CR>
" タブを閉じる
nnoremap <silent> tx :tabclose<CR>
" タブを右に移動
nnoremap <silent> tl :+tabmove<CR>
" タブを左に移動
nnoremap <silent> th :-tabmove<CR>

"*
" バッファ
"--------------------------------------------------------------- *
" カレントバッファ以外を閉じる
nnoremap <silent> <Space>o :only<CR>
" 次のバッファ
nnoremap <silent> <C-j> :bprev<CR>
" 前のバッファ
nnoremap <silent> <C-k> :bnext<CR>

"*
" 便利系
"--------------------------------------------------------------- *
" 改行を挿入
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j





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
" vimfiler上で現在いるディレクトリを動的にカレントディレクトリに設定してくれる
let g:vimfiler_enable_auto_cd = 1
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
" grep時の結果画面を画面下で開く
let g:unite_split_rule = 'botright'
" ファイル一覧取得時､画像を除く
call unite#custom#source('file_rec/async', 'ignore_pattern', '\(png\|gif\|jpeg\|jpg\)$')
" キャッシュファイルの上限
let g:unite_source_rec_max_cache_files = 5000

" unite grepにjvgrepを使う
if executable('jvgrep')
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '-r'
    let g:unite_source_grep_recursive_opt = '-R'
endif

" ブックマーク一覧
nnoremap <silent> ,b :<C-u>Unite bookmark<CR>
" ファイル名検索
nnoremap <silent> <C-p> :<C-u>Unite file_rec/async<CR>
" ファイル内grep検索
nnoremap <silent> ,/ :<C-u>Unite vimgrep:% -buffer-name=search-buffer<CR>
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" ディレクトリを指定してgrep検索
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" バッファ一覧を開く
nnoremap sb :Unite buffer<Return>

"*
" fugitive
"--------------------------------------------------------------- *
" Git 現在のソースと過去の履歴を比較
nnoremap <silent> <Space>gb :Gblame<CR>
" Git 差分を表示する
nnoremap <silent> <Space>gd :Gdiff<CR>
" Git ステータス画面を開く
nnoremap <silent> <Space>gs :tab sp<CR>:Gstatus<CR>:only<CR>
" Git コミット履歴一覧
nnoremap <silent> <Space>gh :tab sp<CR>:0Glog<CR>

"*
" vim-gitgutter
"--------------------------------------------------------------- *
" vim-gitgutter用の表示列をあらかじめ表示
set signcolumn=yes
" 記号更新のタイミング
set updatetime=100
" 行ハイライト
let g:gitgutter_highlight_lines = 0
" 最大表示数
let g:gitgutter_max_signs = 2000
" git diffのコマンドオプション
let g:gitgutter_diff_args = '-w'

" 行ハイライトトグル
nnoremap <silent> gl :GitGutterLineHighlightsToggle<CR>

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

"*
" deoplete
"--------------------------------------------------------------- *
" 起動時に有効
let g:deoplete#enable_at_startup = 1

"*
" airline
"--------------------------------------------------------------- *
set laststatus=2
set t_Co=256
"set guifont=Roboto\ Mono\ for\ Powerline:h12

let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if has("mac")
" mac用の設定
  let g:airline_left_sep = '⮀'
  let g:airline_right_sep = '⮂'
  let g:airline#extensions#tabline#left_sep = '⮀'
  let g:airline#extensions#tabline#left_alt_sep = '⮀'
elseif has("unix")
" unix固有の設定
" なぜかwindowsOSでもunix､win32unixに分類されるため､ここにwindowsの設定を書く
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
endif

"*
" tmuxline
"--------------------------------------------------------------- *
let g:tmuxline_preset = {
  \'a'    : '#S',
  \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W', '#F'],
  \'x'    : '#(date)',
  \'y'    : ['%R', '%a', '%Y'],
  \'z'    : '#H'}
