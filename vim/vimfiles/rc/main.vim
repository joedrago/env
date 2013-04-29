
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

" Tab completion awesomeness
set wildmenu

" Being able to click in the window and engage VISUAL is convenient, most of the time.
set mouse=a

" Change the default buffer to the clipboard
set clipboard=unnamed

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
autocmd BufEnter,BufNew *.ekd setlocal formatprg=

" Color formatting
colorscheme koehler
syntax enable
au BufWinEnter * let w:m1=matchadd('WarningMsg', '\t', -1)
au BufWinEnter * let w:m2=matchadd('WarningMsg', '[\t ]\+$', -1)
hi WarningMsg guibg=DarkCyan
hi Search guibg=DarkGreen

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
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt
autocmd BufNewFile,BufRead *.pl set formatprg="perltidy -bl -sbl -nce -asbl -ole=unix"

" CtrlP settings
let g:ctrlp_max_height = 50
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = "flashlight_srcs %s"
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](boost|build)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': '',
    \ }
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>', '<c-l>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }

" Really common C pattern
function CObjectPattern(name, varname)
  let fext = expand('%:e')

  if fext =~ '^h'
    call append(line('.') +  0, 'typedef struct '.a:name.'')
    call append(line('.') +  1, '{')
    call append(line('.') +  2, '    int a;')
    call append(line('.') +  3, '} '.a:name.';')
    call append(line('.') +  4, '')
    call append(line('.') +  5, a:name.' *'.a:name.'Create();')
    call append(line('.') +  6, 'void '.a:name.'Destroy('.a:name.' *'.a:varname.');')
    call append(line('.') +  7, 'void '.a:name.'Clear('.a:name.' *'.a:varname.');')
  else
    call append(line('.') +  0, a:name.' *'.a:name.'Create()')
    call append(line('.') +  1, '{')
    call append(line('.') +  2, '    '.a:name.' *'.a:varname.' = calloc(1, sizeof('.a:name.'));')
    call append(line('.') +  3, '    return '.a:varname.';')
    call append(line('.') +  4, '}')
    call append(line('.') +  5, '')
    call append(line('.') +  6, 'void '.a:name.'Destroy('.a:name.' *'.a:varname.')')
    call append(line('.') +  7, '{')
    call append(line('.') +  8, '    '.a:name.'Clear('.a:varname.');')
    call append(line('.') +  9, '    free('.a:varname.');')
    call append(line('.') + 10, '}')
    call append(line('.') + 11, '')
    call append(line('.') + 12, 'void '.a:name.'Clear('.a:name.' *'.a:varname.')')
    call append(line('.') + 13, '{')
    call append(line('.') + 14, '}')
  endif
endfunction
command! -nargs=* C call CObjectPattern(<f-args>)

" execute "so " . expand("<sfile>:p:h") . "/lib/sourceB.vim"
