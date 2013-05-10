" vi is dumb. Backspace should work across newlines and before the insertion mark
set nocompatible
set bs=2

" Tabs are dumb. ts=8 + expandtab allows smartindent to work properly without tabs
set sw=4
set sts=4
set ts=8
set expandtab

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

" Color formatting
colorscheme koehler
syntax enable
au BufWinEnter * let w:m1=matchadd('WarningMsg', '\t', -1)
au BufWinEnter * let w:m2=matchadd('WarningMsg', '[\t ]\+$', -1)
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

autocmd FileType rst setlocal textwidth=80
autocmd FileType make setlocal noexpandtab
autocmd BufEnter fabfile setlocal ft=python
autocmd BufEnter wscript setlocal ft=python
autocmd BufRead */cmake/* setlocal ft=cmake
autocmd BufEnter,BufNew *.ekd setlocal textwidth=80

" keybinds
map <f1> :bp<cr>
map <f2> :bn<cr>
map <f4> @q
map <f5> :cp<CR>
map <f6> :cn<CR>
map <f8> :ccl<CR>
map <f9> :silent !p4 edit %<CR>
map <f12> :bd<cr>

" Display error window on bottom
au FileType qf wincmd J
nmap <Leader>c :ccl<CR>

set makeprg=smake
set tags=tags;/

au BufRead quickfix setlocal nobuflisted wrap number

set wildignore+=*.o,*.obj,.svn,*.elf,*.exe,*boost*,*build*

set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions+=mT
set guioptions-=mT
set guifont=Liberation_Mono:h10

" astyle settings - TODO: dont hardcode options path
autocmd BufNewFile,BufRead * setlocal formatprg=
autocmd BufNewFile,BufRead *.h,*.c,*.cpp execute 'setlocal formatprg=astyle\ --options=' . expand('<sfile>:p:h') . '\..\..\..\conf\astyle\home.txt'

runtime rc/ctrlp.vim
runtime rc/codetemplates.vim
if has('win32')
    autocmd BufNewFile,BufRead c:/work/nova/*.cpp,c:/work/nova/*.c,c:/work/nova/*.h runtime rc/nova.vim
    autocmd BufNewFile,BufRead c:/work/metroid/*.cpp,c:/work/metroid/*.c,c:/work/metroid/*.h runtime rc/metroid.vim
endif
