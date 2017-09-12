set background=dark
highlight clear
colorscheme default
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "sea"

hi folded ctermbg=none ctermfg=grey cterm=none
hi cursorcolumn ctermbg=6 ctermfg=none cterm=none
hi cursorline ctermbg=6 ctermfg=none cterm=none
hi tabline ctermbg=none ctermfg=15 cterm=none
hi tablinefill ctermbg=none ctermfg=none cterm=none
hi tablinesel ctermbg=6 ctermfg=15 cterm=bold
hi todo ctermbg=none ctermfg=yellow cterm=bold,underline
hi foldcolumn ctermbg=none ctermfg=lightgrey cterm=none
hi linenr ctermbg=none ctermfg=2 cterm=none
hi cursorlinenr ctermbg=none ctermfg=2 cterm=bold
" TODO
" {{{
"
" }}}
