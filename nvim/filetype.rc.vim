" Settings depends on filetypes
" Define filetype 'gnuplot'
autocmd BufNewFile,BufRead *.plt setfiletype gnuplot

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

function! s:filetype_gnuplot() abort
  nnoremap <Leader>e :terminal ++close gnuplot
endfunction

function! s:filetype_plaintex() abort
  nnoremap <Leader>e :!make<CR>
endfunction
