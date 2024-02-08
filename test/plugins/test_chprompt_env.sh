test_plugin__env__unset_var() {
    test 'SOMEUNSETVAR:_' = "$(__chprompt_plugin__env SOMEUNSETVAR)"
}

test_plugin__env__zero_length_var() {
    export FOO=''
    test "FOO:_" = "$(__chprompt_plugin__env FOO)"
}

test_plugin__env__gt_zero_length_var() {
    export FOO='bar'
    test "FOO:bar" = "$(__chprompt_plugin__env FOO)"
}
