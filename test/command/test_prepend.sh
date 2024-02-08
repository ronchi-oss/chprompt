test_command__prepend__prepends_one_into_zero_length_format() {
    chprompt set
    chprompt prepend '\w'
    test "$(echo '\w')" = "$(chprompt list)"
}

test_command__prepend__prepends_many_into_zero_length_format() {
    chprompt set
    chprompt prepend '\w' '\n' :cat:
    test "$(echo '\w' ; echo '\n' ; echo :cat:)" = "$(chprompt list)"
}

test_command__prepend__prepends_one() {
    chprompt set '\w' '\n'
    chprompt prepend git
    test "$(echo git ; echo '\w' ; echo '\n')" = "$(chprompt list)"
}

test_command__prepend__prepends_many() {
    chprompt set '\w' bash
    chprompt prepend git '\n'
    test "$(echo git ; echo '\n' ; echo '\w' ; echo bash)" = "$(chprompt list)"
}
