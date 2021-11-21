nnoremap <silent> <Leader>f :<C-u> Defx -listed -resume
\ -columns=indent:mark:icons:git:filename:time:size
\ -buffer-name=tab`tabpagenr()`<CR>

" nnoremap <silent> <Leader>w :<C-u> Defx -auto-cd
nnoremap  <Leader>w :<C-u> Defx -auto-cd
\ <CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
" open file
nnoremap <silent><buffer><expr> l
\ defx#do_action('open')

 " move to parent directory
nnoremap <silent><buffer><expr> h
\ defx#do_action('cd', ['..'])

" move to home directory
nnoremap <silent><buffer><expr> ~
\ defx#do_action('cd')

" move to workspace1
let s:work_dir = '/Users/rmat/Documents'
nnoremap <buffer><expr> w1
\ defx#do_action('cd', s:work_dir)

" change vim directory
" nnoremap <silent><buffer><expr> cd
nnoremap <buffer><expr> cd
\ defx#do_action('change_vim_cwd')

" execute file
nnoremap <silent><buffer><expr> x
\ defx#do_action('execute_command')

" create new file
nnoremap <silent><buffer><expr> N
\ defx#do_action('new_file')

" create new directory
nnoremap <silent><buffer><expr> K
\ defx#do_action('new_directory')

" toggle select
nnoremap <silent><buffer><expr> <Space>
\ defx#do_action('toggle_select')

" toggle select all
nnoremap <silent><buffer><expr> *
\ defx#do_action('toggle_select_all')

" delete file to trash
nnoremap <silent><buffer><expr> d
\ defx#do_action('remove_trash')

" copy file
nnoremap <silent><buffer><expr> c
\ defx#do_action('copy')

" paste file
nnoremap <silent><buffer><expr> p
\ defx#do_action('paste')

" rename file
nnoremap <silent><buffer><expr> r
\ defx#do_action('rename')

" move file
nnoremap <silent><buffer><expr> m
\ defx#do_action('move')

" copy path
nnoremap <silent><buffer><expr> yy
\ defx#do_action('yank_path')

" toggle sort
nnoremap <buffer><expr> S
\ defx#do_action('toggle_sort', 'TIME')

" toggle show/hide dotfiles
nnoremap <silent><buffer><expr> .
\ defx#do_action('toggle_ignored_files')

" toggle open folder
nnoremap <silent><buffer><expr> t
\ defx#do_action('open_tree', 'toggle')

" preview the file
nnoremap <silent><buffer><expr> P
\ defx#do_action('preview')
" redraw buffer
nnoremap <buffer><expr> <CR>
\ defx#do_action('redraw')
" quit defx.vim
nnoremap <silent><buffer><expr> <Esc>
\ defx#do_action('quit')
nnoremap <silent><buffer><expr> q
\ defx#do_action('quit')
endfunction

