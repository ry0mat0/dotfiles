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

" unset highlight with esc
nmap <Esc><Esc> :nohlsearch<CR><Esc>
