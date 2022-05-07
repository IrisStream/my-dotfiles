set nocompatible

set number
set relativenumber

syntax on

set tabstop=4
set expandtab		" replace <tab> with <space>
set softtabstop=4	" delete 4 continuous <space> with 1 <backspace>

set autoindent

" Encoding
set encoding=utf-8

" Quick navigate between buffer in vim
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split to right / bottom
set splitbelow
set splitright

" y and d put stuff into system clipboard (so that other apps can see it)
set clipboard=unnamed,unnamedplus

set history=50      " remember last 50 commands
set ruler           " show cursor position in bottom line

" Automatically update changed files (but need to focus on the file)
set autoread
set foldmethod=indent
set foldlevel=20

" Display related: {{{
set display+=lastline       " Show everything you can in the last line (intead of stupid @@@)
set display+=uhex           " Show chars that cannot be displayed as <13> instead of ^M
" }}}

" Searching {{{
set incsearch               " show first match when start typing
set ignorecase              " default should ignore case
set smartcase               " use case sensitive if I use uppercase
" }}}

" <Tab> at the end of a word should attempt to complete it using tokens from the current file: {{{
function! MyTabCompletion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=MyTabCompletion()<CR>

" Shortcut for quick open files
nnoremap <leader>e :e <C-R>=expand("%:p:h") . '/' <CR>
nnoremap <leader>vs :vs <C-R>=expand("%:p:h") . '/' <CR>
nnoremap <C-N> :Ex<cr>

" Disable ~ when inside tmux, as Ctrl + PageUp/Down are translated to 5~
if &term =~ '^screen'
	map ~ <Nop>
endif

" Show filename in tmux panel
autocmd BufEnter,BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand('%'))
autocmd VimLeave * call system("tmux rename-window bash")
