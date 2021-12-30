" バッファ一覧 
noremap <C-P> :Denite buffer<CR>
" ファイル一覧
noremap <C-N> :Denite -buffer-name=file file<CR>
" 最近使ったファイル一覧
noremap <C-Z> :Denite file/old<CR>
" カレントディレクトリ
noremap <C-C> :Denite file/rec<CR>
" バッファ一覧
nnoremap sB :<C-u>Denite buffer -buffer-name=file<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
   nnoremap <silent><buffer><expr> <CR>
   \ denite#do_map('do_action')
   nnoremap <silent><buffer><expr> d
   \ denite#do_map('do_action', 'delete')
   nnoremap <silent><buffer><expr> p
   \ denite#do_map('do_action', 'preview')
   nnoremap <silent><buffer><expr> q
   \ denite#do_map('quit')
   nnoremap <silent><buffer><expr> i
   \ denite#do_map('open_filter_buffer')
   nnoremap <silent><buffer><expr> <Space>
   \ denite#do_map('toggle_select').'j'
endfunction
