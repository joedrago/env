
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
