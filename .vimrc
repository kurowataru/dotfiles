"" Bundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

"let g:neobundle_default_git_protocol='https'

"" Plugin
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : ' make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ }
\ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'

filetype plugin indent on
NeoBundleCheck                  " 新しいPluginをvim起動時に自動でインストール

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
" 括弧等を自動補完する
""inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
" 括弧類を自動補完する_ここまで
set clipboard=unnamed          " ヤンクした内容をクリップボードに保存する
set showmatch                 " 対応する括弧をハイライト表示する
set matchtime=2               " 括弧のハイライトを2秒にする
set cursorline                " カレントラインをハイライト表示する
set showcmd                   " 画面下部にコマンドを表示
set wildmenu                  " コマンドラインモードの補完を有効にする
colorscheme Tomorrow-Night-Bright
"colorscheme hybrid
"colorscheme hybrid
set background=dark           " 背景を暗くする

"" Backup
set backup
set swapfile
set backupdir=~/.vim/backup
set directory=~/.vim/swap

"" Indent
set cindent                     " C言語ライクなインデントを有効にする
set tabstop=2                   " タブ幅を半角スペース2つに設定する
set expandtab                   " タブの代わりに半角スペースを挿入する
set shiftwidth=2                " 自動インデントの幅を半角スペース2つに設定する

"" lightline
let g:lightline = {
    \ 'colorscheme' : 'landscape',
    \ 'active': {
    \   'left': [
    \       ['mode'. 'paste'],
    \       ['readonly', 'filename', 'modified']
    \   ]
    \ }
    \ }
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
