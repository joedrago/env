function! PoundComment()
  map - :s/^/# /<CR> \| :noh<CR>
  map _ :s/^\s*# \=//<CR> \| :noh<CR>
  set comments=:#
endfunction

function! SlashComment()
  map - :s/^/\/\/ /<CR> \| :noh<CR>
  map _ :s/^\s*\/\/ \=//<CR> \| :noh<CR>
endfunction

autocmd FileType perl call PoundComment()
autocmd FileType cgi call PoundComment()
autocmd FileType csh call PoundComment()
autocmd FileType sh call PoundComment()
autocmd FileType java call SlashComment()
autocmd FileType cpp call SlashComment()
autocmd FileType c call SlashComment()
autocmd FileType coffee call PoundComment()
autocmd FileType coffeescript call PoundComment()

