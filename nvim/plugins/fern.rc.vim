nnoremap  <silent> <Leader>f :<C-u> Fern .<CR>
autocmd FileType fern call s:init_fern()
function! s:init_fern() abort
  nmap <buffer> I <Plug>(fern-action-hidden:toggle)
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> ~ :<C-u> Fern ~<CR>
  nmap <buffer> l <Plug>(fern-action-open-or-enter)
  nmap <buffer> h <Plug>(fern-action-leave)
endfunction

augroup my-fern
  autocmd! *
augroup END

