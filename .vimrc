"dein設定
if &compatible
  set nocompatible
endif

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

"" General
syntax on
set fileencoding=utf8           " 文字コードをUTF-8に設定
set number                      " 行番号を表示
set title                       " タイトルを表示
set ruler                       " 右下に行・列番号を表示
" ビープ音を消す
set vb t_vb=
set novisualbell
" ビープ音を消す_ここまで
set backspace=start,eol,indent  " Backspace による消去を有効にする
  " start  : NomalModeに移った後にInsertModeに戻った際にもBackspaceを有効にする
  " eol    : 開業を削除可能にする
  " indent : インデントを削除可能にする
set whichwrap=b,s,[,],,~        " カーソルキーによる行末の移動を有効にする
" Ctrl + nでgtagsの次の検索結果へジャンプ
map <C-n> :cn<CR>
" Ctrl + pでgtagsの前の検索結果へジャンプ
map <C-p> :cp<CR>
" Ctrl + gで:Gtagsと入力
map <C-g> :Gtags
" Ctrl + iで開いているファイルに定義されている関数の一覧を表示
map <C-i> :Gtags -f %<CR>
" Ctrl + jでカーソル位置の関数へジャンプ
map <C-j> :GtagsCursor<CR>
" Ctrl + wで検索結果ウインドウを閉じる
nnoremap <C-w> <C-w><C-w><C-w>q 
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
" 括弧等を自動補完する
""inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
"ノーマルモードにおいてセミコロンをコロンに保管する
nnoremap ; :
" 括弧類を自動補完する_ここまで
set clipboard=unnamedplus     " ヤンクした内容をクリップボードに保存する
set showmatch                 " 対応する括弧をハイライト表示する
set matchtime=2               " 括弧のハイライトを2秒にする
set cursorline                " カレントラインをハイライト表示する
set showcmd                   " 画面下部にコマンドを表示
set wildmenu                  " コマンドラインモードの補完を有効にする
"colorscheme Tomorrow-Night-Bright
set background=dark           " 背景を暗くする
let g:hybrid_use_Xresources = 1

set nobackup " swapファイルを作成しない
set noswapfile " backupファイルを作成しない

"" Indent
set cindent                     " C言語ライクなインデントを有効にする
set tabstop=2                   " タブ幅を半角スペース2つに設定する
set expandtab                   " タブの代わりに半角スペースを挿入する
set shiftwidth=2                " 自動インデントの幅を半角スペース2つに設定する

colorscheme night-owl " カラースキーム適用のため最後に記述
