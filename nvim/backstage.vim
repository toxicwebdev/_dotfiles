set clipboard+=unnamedplus
set hidden
set nocompatible
set showmatch
set incsearch
set hlsearch
set cul
set linebreak
set listchars=tab:¬\ ,eol:▸
set foldmethod=marker
set fo+=t

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsExpandTrigger = '<leader>ue'
let g:UltiSnipsJumpForwardTrigger = '<leader>uf'
let g:UltiSnipsJumpBackwardTrigger = '<leader>ub'

let g:neomake_highlight_lines=1
let g:neomake_error_sign  = {
                  \ 'text': '',
                  \ 'texthl': 'NeomakeErrorSign',
                  \ }
let g:neomake_warning_sign  = {
                  \ 'text': '',
                  \ 'texthl': 'NeomakeWarningSign',
                  \ }

let g:neomake_cpp_clang_maker = {
                  \ 'args': ['-std=c++11','-I../include'],
                  \ }

let g:neomake_cpp_gcc_maker = {
                  \ 'args': ['-std=c++11','-I../include'],
                  \ }

if has("autocmd")
      augroup setup
            au!
            autocmd! vimresized *
                        \ :wincmd =
            autocmd! insertenter,insertleave * :set cul!
      augroup END
      augroup change_tab_bindings
            au!
            autocmd! tabnew,tabclosed,bufread,bufnew,bufdelete *
                        \ :call ChangeTabBindings()
      augroup END
      augroup Programming
            au!
            au! filetype *
                        \ :call Programming()
      augroup END
endif
