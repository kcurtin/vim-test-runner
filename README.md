Test runner for rspec and ExUnit, autodetects command based on the file you are in.

```
let g:rspec_command = ":!rspec {test} --color --format progress"
let g:mix_test_command = ":!mix test {test}"

map <Leader>r :call RunCurrentTestFile()<CR>
map <Leader>a :call RunAllTests()<CR>
map <Leader>s :call RunNearestTest()<CR>
map <Leader>l :call RunLastTest()<CR>
```

