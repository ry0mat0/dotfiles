" set leader
let mapleader = "\<Space>"
let localleader = '\'

"START dein Scripts--------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/dotfiles/nvim')
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
let s:toml_file = expand(s:toml_dir . '/plugin.toml')
let s:lazy_file = expand(s:toml_dir . '/plugin_lazy.toml')
let s:lsp_file = expand(s:toml_dir . '/lsp.toml')
let s:ddc_file = expand(s:toml_dir . '/ddc.toml')
call dein#load_toml(s:toml_file, {'lazy':0})
call dein#load_toml(s:lazy_file, {'lazy':1})
call dein#load_toml(s:lsp_file, {'lazy':1})
call dein#load_toml(s:ddc_file, {'lazy':1})
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" END dein Scripts ----------------------

" maps
source ~/dotfiles/nvim/map.rc.vim

" Color
colorscheme iceberg

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
" yank to clipboard
set clipboard+=unnamedplus
" add vim-plugin workspace
set runtimepath^=~/Documents/workspace/myPrugins

" Settings depends on filetypes
augroup vimrc
  autocmd!
  autocmd Filetype * call s:filetype(expand('<amatch>'))
augroup END

function! s:filetype(ftype) abort
  if !empty(a:ftype) && exists('*' . 's:filetype_' . a:ftype)
    execute 'call s:filetype_' . a:ftype . '()'
  endif
endfunction

" Typeset tex->pdf using Makefile (overwrite quickrun)
function! s:filetype_tex() abort
  nnoremap <Leader>e :!make<CR>
endfunction

:command LatexTree call LatexTree() | lopen

function! LatexTree()
	let items = systemlist('grep -Hn section{ ./*.tex')
	let nums = []
	let filenames = []
	let newItems = []	
	let texts = []
	for item in items
		call add(nums, split(item, ":")[1])
		let name = split(split(split(item, ":")[2], "{")[1], "}")[0]
		if match(item, 'subsection') != -1
			let name = "---" . name	
		endif	
			if match(item, 'subsubsection') != -1
			let name = '---' . name
		endif

		call add(filenames, split(item, ":")[0])
		call add(texts, name) 
	endfor

	let idx = 0

	while idx < len(items)
		call add(newItems, {'filename':filenames[idx], 'lnum':nums[idx], 'text':texts[idx]})
		let idx+=1
	endwhile

	call setloclist(winnr(), [], 'r', {'items': newItems}) 

endfunction

" autocmd Bufwrite *.tex call timer_start(200, { tid -> execute('LatexTree')})
