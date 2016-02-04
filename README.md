Test runner that supports Rspec and ExUnit

Autodetects test framework based on the file you are in.

Install with vundler:
```vim
Bundle 'kcurtin/vim-test-runner'
```

Add the keybindings do your .vimrc:
```vim
let g:rspec_command = ":!rspec {test} --color --format progress"
let g:mix_test_command = ":!mix test {test}"

map <Leader>r :call RunCurrentTestFile()<CR>
map <Leader>a :call RunAllTests()<CR>
map <Leader>s :call RunNearestTest()<CR>
map <Leader>l :call RunLastTest()<CR>
```

