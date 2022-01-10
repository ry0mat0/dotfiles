nnoremap  <silent> <Leader>f :<C-u> Fern .<CR>
autocmd FileType fern call s:init_fern()
function! s:init_fern() abort
  nmap <buffer> I <Plug>(fern-action-hidden:toggle)
endfunction

augroup my-fern
  autocmd! *
augroup END

