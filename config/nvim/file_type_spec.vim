" Specific settings for specific filetypes:    {{{
" usual policy: if there is a Makefile present, :mak calls make, otherwise we define a command to compile the filetype

" C/C++:
function! CSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -g\ -Wall\ -Wextra\ -o%.bin\ %\ -lm;fi;fi
    set cindent
    set nowrap
endfunction

function! CPPSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ g++\ -std=gnu++0x\ -O2\ -g\ -Wall\ -Wextra\ -o\ %<\ %;fi;fi
    set cindent
    set nowrap
    nnoremap <buffer> <F9> :w<cr>:!g++ -O2 % -o %< -std=c++17 -I ./<cr>:!./%<<cr>
    nnoremap <buffer> <F8> :w<cr>:!g++ -Wall -g -Wextra -Wshadow -O2 % -o %< -std=c++17 -I ./<cr>
endfunction

" Java
function! JAVASET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ javac\ -g\ %;fi;fi
    set cindent
    set nowrap
    nnoremap <buffer> <F8> :w<cr>:!javac %<cr>
    nnoremap <buffer> <F9> :w<cr>:!javac %<cr>:!java %< %<cr>
endfunction

" vim scripts
function! VIMSET()
    set nowrap
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction

" Python
function! PYSET()
    if exists('g:no_pyset')
        return
    endif
    set nowrap

    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    nnoremap <buffer> <F9> :w<cr>:exec '!clear;python' shellescape(@%, 1)<cr>
endfunction

" Autocommands for all languages:
autocmd BufNewFile,BufReadPost *.py set filetype=python
autocmd FileType vim        call VIMSET()
autocmd FileType c          call CSET()
autocmd FileType C          call CPPSET()
autocmd FileType cc         call CPPSET()
autocmd FileType cpp        call CPPSET()
autocmd FileType java       call JAVASET()
autocmd FileType python     call PYSET()

" }}}
