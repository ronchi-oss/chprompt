test_command__list__lists_zero_length_format() {
    chprompt set
    test '' = "$(printf '%s' "$(chprompt list)")"
}

test_command__list__lists_many_items() {
    chprompt set '\w' :dog: exit_status_dwim
    test "$(echo '\w' ; echo ':dog:' ; echo exit_status_dwim)" = "$(chprompt list)"
}
