if exists("qtest_loaded")
    finish
endif
let qtest_loaded = 1

function! qtest#run_cmd(cmd)
    let buffer = @%
    let regex = '\(.*\)_test\.[ch]'
    if empty(matchstr(buffer, regex))
        let file_to_open = matchlist(buffer, '\(.*\)\.[ch]')[1] .'_test.c'
    else
        let file_to_open = matchlist(buffer, '\(.*\)_test\.[ch]')[1] . '.c'
    endif
    execute a:cmd . file_to_open
endfunction

comm! T call qtest#run_cmd('e ')
comm! TS call qtest#run_cmd('sp ')
comm! TV call qtest#run_cmd('vsp ')
