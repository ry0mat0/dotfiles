" set leader
let mapleader = "\<Space>"
let localleader = '\'

" if has('nvim')
"START dein Scripts--------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/dotfiles/nvim/toml')
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
let s:toml_file = expand(s:toml_dir . '/plugin.toml')
let s:lsp_file = expand(s:toml_dir . '/lsp.toml')
let s:lazy_file = expand(s:toml_dir . '/plugin_lazy.toml')
let s:ddc_file = expand(s:toml_dir . '/ddc.toml')
let s:ddu_file = expand(s:toml_dir . '/ddu.toml')
call dein#load_toml(s:toml_file, {'lazy':0})
call dein#load_toml(s:lsp_file, {'lazy':0})
call dein#load_toml(s:ddu_file, {'lazy':0})
call dein#load_toml(s:lazy_file, {'lazy':1})
call dein#load_toml(s:ddc_file, {'lazy':1})
call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" END dein Scripts ----------------------

set termguicolors
colorscheme nordfox
" endif

" iceberg terminal colors
let g:terminal_ansi_colors = [
    \ '#000000',
    \ '#da9290',
    \ '#8cab90',
    \ '#ebba91',
    \ '#a1b7d9',
    \ '#b8adde',
    \ '#58c2c5',
    \ '#c7c7c7',
    \ '#676767',
    \ '#ed766d',
    \ '#8cf67a',
    \ '#fefb7e',
    \ '#6a71f6',
    \ '#ed7ef8',
    \ '#8ef9fd',
    \ '#fefefe'
    \ ]
" maps
source ~/dotfiles/nvim/map.rc.vim

" Set statusline
set statusline=%f%m%r%h%w%q
set statusline+=\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]
set statusline+=\ %=
set statusline+=%{tagbar#currenttag('[%s]','')}[CODE=0x%02B]\ [POS=%l/%L(%02v)]
set laststatus=2
" Set line number
set number
" highlight line number on cursor
set cursorline
" set tab visible
set list listchars=tab:\▸\-
" set tab to space
set expandtab
" tab width at linehead
set tabstop=2
" tab width
set shiftwidth=2
" yank to clipboard
set clipboard+=unnamed
" add vim-plugin workspace
set runtimepath^=~/Documents/workspace/myPrugins
set backspace=indent,eol,start
" open QuickFix automatically on grep commands
autocmd QuickFixCmdPost *grep* cwindow
" settings depend on filetype
source ~/dotfiles/nvim/filetype.rc.vim
" copy fullpath of current file as markdown
function s:copyFileAsMarkdown()
  let fp = expand("%:p")
  let fn = expand("%")
  echo fp
  let @+ = "[".fn."]"."(file://".fp.")"
endfunction
command Fl call s:copyFileAsMarkdown()
" use fzf
set rtp+=/opt/homebrew/opt/fzf

" autocmd Bufwrite *.tex call timer_start(200, { tid -> execute('LatexTree')})
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
