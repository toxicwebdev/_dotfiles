set background=dark
highlight clear
colorscheme solarized
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "prototype_1"

highlight   NeomakeWarningSign
            \ cterm=none
            \ ctermfg=136
            \ ctermbg=none

highlight   NeomakeWarning
            \ cterm=standout
            \ ctermfg=136
            \ ctermbg=white

highlight   NeomakeErrorSign
            \ cterm=none
            \ ctermfg=none
            \ ctermbg=none

highlight   NeomakeErrorSign
            \ cterm=standout
            \ ctermfg=52
            \ ctermbg=white

highlight   CursorLine
            \ cterm=none
            \ ctermfg=none
            \ ctermbg=8

highlight   Todo
            \ cterm=none
            \ ctermfg=160
            \ ctermbg=none

highlight   Tabline
            \ cterm=none
            \ ctermfg=grey
            \ ctermbg=none

highlight   TabLineFill
            \ cterm=none
            \ ctermfg=none
            \ ctermbg=none

highlight   TabLineSel
            \ cterm=bold
            \ ctermfg=none
            \ ctermbg=0
