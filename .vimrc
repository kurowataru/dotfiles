"" Bundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

"let g:neobundle_default_git_protocol='https'

"" Plugin
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'git://github.com/lukerandall/haskellmode-vim.git'


NeoBundleCheck                  " 新しいPluginをvim起動時に自動でインストール
filetype plugin indent on

"" General
syntax on
set encoding=utf-8              " 文字コードをUTF-8に設定
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
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
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
" 括弧等を自動補完する
""inoremap { {}<LEFT>
inoremap [ []
inoremap ( ()<LEFT>
inoremap { {}<LEFT>
inoremap {<Enter> {}<LEFT><CR><ESC><S-o>
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
set background=dark           " 背景を暗くする
let g:hybrid_use_Xresources = 1

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
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
  
function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction
    
function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
colorscheme hybrid " カラースキーム適用のため最後に記述
