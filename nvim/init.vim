" set leader
let mapleader = "\<Space>"
let localleader = '\'

"START dein Scripts--------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
let s:toml_file = expand('~/.cache/userconfig/plugin.toml')
let s:lazy_file = expand('~/.cache/userconfig/plugin_lazy.toml')
let s:lsp_file = expand('~/.cache/userconfig/lsp.toml')
let s:ddc_file = expand('~/.cache/userconfig/ddc.toml')
call dein#load_toml(s:toml_file, {'lazy':0})
call dein#load_toml(s:lazy_file, {'lazy':1})
call dein#load_toml(s:lsp_file, {'lazy':0})
call dein#load_toml(s:ddc_file, {'lazy':1})
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" END dein Scripts ----------------------

" Tabs
nmap te :tabedit
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>

" Split window
nnoremap ss :split<Return><C-w>w
nnoremap sv :vsplit<Return><C-w>w
" Move window
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap j gj
nnoremap k gk

" Set line number
set number
" set tab visible
set list listchars=tab:\▸\-
" set tab to space
set expandtab
" tab width at linehead
set tabstop=2
" tab width
set shiftwidth=2
" quit with q
nnoremap q :q<Return>0
" yank to clipboard
set clipboard+=unnamedplus
" add vim-plugin workspace
set runtimepath^=~/Documents/workspace/myPrugins

"Settings depends on filetypes
augroup vimrc
  autocmd!
  autocmd Filetype * call s:filetype(expand('<amatch>'))
augroup END

function! s:filetype(ftype) abort
  if !empty(a:ftype) && exists('*' . 's:filetype_' . a:ftype)
    execute 'call s:filetype_' . a:ftype . '()'
  endif
endfunction

function! s:filetype_tex() abort
  nnoremap <Leader>t :w<CR>:!./texall.sh<CR>
endfunction
