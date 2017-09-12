" function: SynStack {{{1
function! SynStack()
      if !exists('*synstack')
            return
      endif
      echo map(synstack(line('.'), col('.')),'synIDattr(v:val,"name")')
endfunc

" function: Compile {{{1
function! Compile(ft)
      echo "\n"
      if a:ft == 'cpp'
            echo 'compiling...'
            silent !g++ -v -std=c++11 -o $(echo % | tr -d .cpp) %
            echo '\n'
            echo 'complete!'
      elseif a:ft == 'tex' || a:ft == 'plaintex'
            echo 'compiling...'
            silent !pdflatex %
            silent !pdflatex %
            echo '\n'
            echo 'complete!'
      else
            echo "there's nothing to compile!"
      endif
endfunc

" function: Programming {{{1
function! Programming()
      if &ft == "vim" || &ft == "cpp" || &ft == "hpp" ||
                        \ &ft == "c" || &ft == "h" ||
                        \ &ft == "tex" || &ft == "plaintex" ||
                        \ &ft == "lua" || &ft == "html" ||
                        \ &ft == "css" || &ft == "javascript" ||
                        \ &ft == "php"
            set ts=4 sts=4 sw=4 expandtab
            let &columns = ( 81 + &numberwidth )
            set textwidth=80
            let &colorcolumn=&textwidth
            set foldcolumn=1
            set relativenumber number
            nnoremap <leader>c :call Compile(&ft)<cr>
            au! vimresized * :call Programming()
            au! bufwritepost * :Neomake
      elseif &ft == "make"
            set ts=4 sts=4 sw=4
            set number relativenumber
            set textwidth=80
            let &columns = ( 81 + &numberwidth )
            au! vimresized * :call Programming()
            au! bufwritepost * :Neomake
      endif
endfunc

" function: Writing {{{1
function! Writing()
endfunc

" function: ChangeTabBindings {{{1
function! ChangeTabBindings()
      if tabpagenr('$') > 1
            nnoremap <tab> gt
            nnoremap <s-tab> gT
      elseif bufnr('$') > 1
            nnoremap <tab> :bn<cr>
            nnoremap <s-tab> :bp<cr>
      else
            nnoremap <tab> <nop>
            nnoremap <s-tab> <nop>
      endif
endfunc
