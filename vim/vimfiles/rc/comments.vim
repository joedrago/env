function! PoundComment()
  map - :s/^/# /<CR>
  map _ :s/^\s*# \=//<CR>
  set comments=:#
endfunction

function! SlashComment()
  map - :s/^/\/\/ /<CR>
  map _ :s/^\s*\/\/ \=//<CR>
endfunction

autocmd FileType perl call PoundComment()
autocmd FileType cgi call PoundComment()
autocmd FileType csh call PoundComment()
autocmd FileType sh call PoundComment()
autocmd FileType java call SlashComment()
autocmd FileType cpp call SlashComment()
autocmd FileType c call SlashComment()

