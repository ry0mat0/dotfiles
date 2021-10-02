" <TAB> completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#manual_complete()
" <S-TAB> completion back. 
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
" global settings
call ddc#custom#patch_global('sources', ['ddc-vim-lsp','around','tmux', 'file'])
call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
  \       'matchers': ['matcher_head'],
  \       'sorters': ['sorter_rank'],
  \      },
  \ 'ddc-vim-lsp': {
  \       'matchers': ['matcher_head'],
  \       'mark': 'lsp',
  \       'forceCompletionPattern': "\\.|:\\s*|->",
  \                },
  \ 'file': {
  \       'mark': 'F',
  \       'isVolatile': v:true,
  \       'forceCompletionPattern': '\S/\S*'
  \         }
  \})

" Change source options
call ddc#custom#patch_global('sourceOptions', {
  \ 'around': {'mark': 'A'},
  \ 'tmux': {'mark': 'T'},
  \})
call ddc#custom#patch_global('sourceParams', {
  \ 'around': {'maxSize': 500},
  \})

call ddc#enable()

