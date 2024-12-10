let g:quickrun_config = {
      \ 'python': {
        \           'command': 'python3'
        \ },
        \ 'gnuplot': {
        \           'type': 'gnuplot',
        \           'command': 'makeplt',
        \ },
        \ 'typst': {
        \          'command': 'typst',
        \          'cmdopt': 'compile',
        \ },
        \ '_' : {
          \ 'runner' : 'vimproc',
          \ 'runner/vimproc/updatetime' : 40,
          \ 'outputter/buffer/running_mark' : 'RUN',
          \ 'outputter' : 'error',
          \ 'outputter/error/success' : 'buffer_legacy',
          \ 'outputter/error/error'   : 'quickfix',
          \ 'outputter/buffer_legacy/split' : ':botright 8sp',
          \ }
          \}

let g:quickrun_no_default_key_mappings = 1
nnoremap <Leader>e :cclose<CR>:write<CR>:QuickRun<CR>

