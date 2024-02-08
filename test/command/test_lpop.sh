test_command__lpop__pops_zero_length_format() {
    chprompt set
    chprompt lpop
    test 0 -eq $?
}

test_command__lpop__pops_one_token_by_default() {
    chprompt set :dog: '\w' :cat:
    chprompt lpop
    test "$(echo '\w' ; echo :cat:)" = "$(chprompt list)"
}

test_command__lpop__pops_many_items() {
    chprompt set :fire: exit_status_dwim '\w' git
    chprompt lpop 2
    test "$(echo '\w' ; echo git)" = "$(chprompt list)"
}

test_command__lpop__pops_all_items() {
    chprompt set '\w' git :cat: exit_status_dwim
    chprompt lpop 4
    test '' = "$(printf '%s' "$(chprompt list)")"
}

test_command__lpop__pops_all_but_one() {
    chprompt set '\w' git
    chprompt lpop 1
    test "$(echo git)" = "$(chprompt list)"
}

test_command__lpop__handles_escaped_new_line_correctly() {
    chprompt set '\n' exit_status_dwim git
    chprompt lpop 2
    test "$(echo git)" = "$(chprompt list)"
}
