test_command__rpop__pops_zero_length_format() {
    chprompt set
    chprompt rpop
    test 0 -eq $?
}

test_command__rpop__pops_one_token_by_default() {
    chprompt set '\w' :cat: :dog:
    chprompt rpop
    test "$(echo '\w' ; echo :cat:)" = "$(chprompt list)"
}

test_command__rpop__pops_many_items() {
    chprompt set '\w' git :fire: exit_status_dwim
    chprompt rpop 2
    test "$(echo '\w' ; echo git)" = "$(chprompt list)"
}

test_command__rpop__pops_all_items() {
    chprompt set '\w' git :cat: exit_status_dwim
    chprompt rpop 4
    test '' = "$(printf '%s' "$(chprompt list)")"
}

test_command__rpop__pops_all_but_one() {
    chprompt set git '\w'
    chprompt rpop 1
    test "$(echo git)" = "$(chprompt list)"
}

test_command__rpop__handles_escaped_new_line_correctly() {
    chprompt set git '\n' exit_status_dwim
    chprompt rpop 2
    test "$(echo git)" = "$(chprompt list)"
}
