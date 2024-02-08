test_command__append__appends_one_into_zero_length_format() {
    chprompt set
    chprompt append '\w'
    test "$(echo '\w')" = "$(chprompt list)"
}

test_command__append__appends_many_into_zero_length_format() {
    chprompt set
    chprompt append '\w' '\n' :cat:
    test "$(echo '\w' ; echo '\n' ; echo :cat:)" = "$(chprompt list)"
}

test_command__append__appends_one() {
    chprompt set '\w' '\n'
    chprompt append git
    test "$(echo '\w' ; echo '\n' ; echo git)" = "$(chprompt list)"
}

test_command__append__appends_many() {
    chprompt set '\w' bash
    chprompt append '\n' git
    test "$(echo '\w' ; echo bash ; echo '\n' ; echo git)" = "$(chprompt list)"
}
