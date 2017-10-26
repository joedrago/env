execute pathogen#infect()
syntax on
filetype plugin indent on

set encoding=utf-8

" vi is dumb. Backspace should work across newlines and before the insertion mark
set nocompatible
set bs=2

" Tabs are dumb. ts=8 + expandtab allows smartindent to work properly without tabs
set sw=4
set sts=4
set ts=4
set expandtab

" disable indent lines
let g:indentLine_char = ' '

" change indent and enable indent lines for Coffeescript
autocmd BufRead,BufNewFile *.coffee,*.litcoffee setlocal sw=2 sts=2 ts=2
autocmd BufRead,BufNewFile *.coffee,*.litcoffee let g:indentLine_char = '|'

" autoindent and smartindent, very convenient
set ai
set si

" show row/col at the bottom
set ruler

" don't litter my HD with files~
set nobackup

" search features
set hlsearch
set incsearch
nmap <Leader>h :noh<CR>
nmap <Leader>q :qa!<CR>

" Tab completion awesomeness
set wildmenu

" Being able to click in the window and engage VISUAL is convenient, most of the time.
set mouse=a

" Change the default buffer to the clipboard
set clipboard=unnamed

" Automatically re-read file on disk when changed, and disable editing of readonly files
set autoread
autocmd BufReadPost * if &readonly | setlocal nomodifiable | else | setlocal modifiable | endif

" Color formatting
colorscheme koehler
if has("gui_running")
colorscheme sunburst
endif
syntax enable

set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions+=mT
set guioptions-=mT
set guifont=Liberation_Mono:h10

hi TabChar	guifg=#fd5ff1 guibg=#361d36
hi TabChar	ctermfg=207   ctermbg=238
au BufWinEnter * let w:m1=matchadd('TabChar', '\t', -1)
au BufWinEnter * let w:m2=matchadd('TabChar', '[\t ]\+$', -1)
hi WarningMsg guibg=#222222
hi Search guibg=DarkGreen

" grep
function! Ack(args)
    let grepprg_bak=&grepprg
    set grepprg=ack-grep\ -H\ --nocolor\ --nogroup
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
endfunction
command! -nargs=* -complete=file Ack call Ack(<q-args>)

" Force a reasonable text width on files for gq purposes
" set textwidth=100
autocmd FileType rst setlocal textwidth=80
autocmd BufEnter,BufNew *.ekd setlocal textwidth=80

autocmd FileType make setlocal noexpandtab
autocmd BufEnter fabfile setlocal ft=python
autocmd BufEnter wscript setlocal ft=python
autocmd BufRead */cmake/* setlocal ft=cmake

" keybinds
map <f1> :bp<cr>
map <f2> :bn<cr>
map <f4> @q
map <f5> :cp<CR>
map <f6> :cn<CR>
map <f8> :ccl<CR>
map <f9> :silent !p4 edit %<CR>
map <f10> :silent !cmd /c start %<CR>
map <f12> :bd<cr>
map <c-p> :Files<cr>

" Display error window on bottom
au FileType qf wincmd J
nmap <Leader>c :ccl<CR>

" set makeprg=smake
set tags=tags;/

au BufRead quickfix setlocal nobuflisted wrap number
set wildignore+=*.o,*.obj,.svn,*.elf,*.exe,*boost*,*build*

let g:buftabs_only_basename = 1
let g:buftabs_in_statusline = 1
let g:buftabs_separator = ":"
let g:buftabs_marker_start = "["
let g:buftabs_marker_end = "]"
let g:buftabs_marker_modified = "*"

let g:SuperTabDefaultCompletionType = "<c-n>"

set laststatus=2
set statusline=%f
set statusline+=%=	  " Switch to the right side
set statusline+=%{buftabs#statusline()}
set statusline+=\ \ \ \   " wat
set statusline+=%c	  " Current col
set statusline+=,\	  " Separator
set statusline+=%l	  " Current line
set statusline+=\ \ \ \   " wat
set statusline+=%P	  " Percentage through file

filetype off
filetype on

" astyle settings - TODO: dont hardcode options path
" autocmd BufNewFile,BufRead * setlocal formatprg=
" autocmd BufNewFile,BufRead *.h,*.c,*.cpp execute 'setlocal formatprg=astyle\ --options=' . expand('<sfile>:p:h') . '/../../../conf/astyle/home.txt'
" autocmd BufNewFile,BufRead *.go execute 'setlocal formatprg=gofmt'

runtime rc/ctrlp.vim
runtime rc/comments.vim
runtime rc/codetemplates.vim
runtime rc/ag.vim

let g:session_autosave = 'no'
let g:session_autoload = 'no'
