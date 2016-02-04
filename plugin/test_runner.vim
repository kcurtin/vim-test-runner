function! RunAllTests()
  let s:last_test = s:DirForFramework()
  call s:RunTests(s:last_test)
endfunction

function! RunCurrentTestFile()
  if s:InTestFile()
    let s:last_test_file = s:CurrentFilePath()
    let s:last_test = s:last_test_file
    call s:RunTests(s:last_test_file)
  elseif exists("s:last_test_file")
    call s:RunTests(s:last_test_file)
  endif
endfunction

function! RunNearestTest()
  if s:InTestFile()
    let s:last_test_file = s:CurrentFilePath()
    let s:last_test_file_with_line = s:last_test_file . ":" . line(".")
    let s:last_test = s:last_test_file_with_line
    call s:RunTests(s:last_test_file_with_line)
  elseif exists("s:last_test_file_with_line")
    call s:RunTests(s:last_test_file_with_line)
  endif
endfunction

function! RunLastTest()
  if exists("s:last_test")
    call s:RunTests(s:last_test)
  endif
endfunction

" === local functions ===

function! s:RunTests(test_location)
  let s:test_command = substitute(s:TestCommand(), "{test}", a:test_location, "g")

  execute s:test_command
endfunction

function! s:InTestFile()
  return s:TestFramework() == "exunit" || s:TestFramework() == "rspec"
endfunction

function! s:TestCommand()
  if s:TestFramework() == "rspec"
    let l:command = g:rspec_command
  elseif s:TestFramework() == "exunit"
    let l:command = g:mix_test_command
  endif

  return l:command
endfunction

function! s:TestFramework()
  if match(expand("%"), "_test.exs$") != -1
    return "exunit"
  elseif match(expand("%"), "_spec.rb$") != -1
    return "rspec"
  endif
endfunction

function! s:CurrentFilePath()
  return @%
endfunction

function! s:DirForFramework()
  if s:TestFramework() == "rspec"
    return "spec"
  elseif s:TestFramework() == "exunit"
    return "test"
  endif
endfunction
