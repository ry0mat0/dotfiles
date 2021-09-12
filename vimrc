" Set mapleader
let mapleader = "\<Space>"

"Setting for plugins (only for neovim)
if has('nvim')
"dein Scripts--------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
"set runtimepath+=/Users/rmat/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
"call dein#begin('/Users/rmat/.cache/dein')
call dein#begin(s:dein_dir)

" Let dein manage dein
" Required:
"call dein#add('/Users/rmat/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
let s:toml_file = expand('~/.cache/userconfig/plugin.toml')
let s:toml_lazy = expand('~/.cache/userconfig/plugin_lazy.toml')
let s:toml_test = expand('~/.cache/userconfig/plugin_test.toml')
call dein#load_toml(s:toml_file, {'lazy':0})
call dein#load_toml(s:toml_lazy, {'lazy':1})
call dein#load_toml(s:toml_test, {'lazy':1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts--------------------------

endif "End Setting for plugins (only for neovim)

" Split window
nnoremap ss :split<Return><C-w>w
nnoremap sv :vsplit<Return><C-w>w

"Move window
nnoremap sh <C-w>h
nnoremap sk <C-w>k
nnoremap sj <C-w>j
nnoremap sl <C-w>l

"Switch tab
nmap <Tab> :tabnext<Return>
nmap <S-Tab> :tabprev<Return>

" General settings
"show line number
set number
"現在の行を強調表示
set cursorline
"行末の一文字先までカーソル移動
set virtualedit=onemore
"括弧入力時の対応する括弧を表示
set showmatch
"ステータスラインを常に表示
set laststatus=2
"コマンドラインの補完
set wildmode=list:longest
"折り返し時に表示行単位での移動
nnoremap j gj
nnoremap k gk
"シンタックスハイライト有効化
syntax enable

"タブを可視化
"set list listchars=tab:\▸\-
"タブを半角スペースにする
set expandtab
"行頭以外でのTabの表示幅
set tabstop=2
"行頭でのTabの表示幅
set shiftwidth=2

"検索文字が小文字の場合は大文字小文字を区別なく検索
set ignorecase
"検索文字が大文字を含む場合は区別して検索
set smartcase
"検索語をハイライト表示
set hlsearch
"esc連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"Quit with q
nnoremap q :q<Return>
