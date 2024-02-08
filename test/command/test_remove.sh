test_command__remove__removes_one_from_single_token_format() {
    chprompt set :cat:
    chprompt remove :cat:
    test '' = "$(printf '%s' "$(chprompt list)")"
}

test_command__remove__removes_all_occurences_of_token() {
    chprompt set :cat: '\w' :cat: git :cat:
    chprompt remove :cat:
    test "$(echo '\w' ; echo git)" = "$(chprompt list)"
}

test_command__remove__removes_all_tokens_provided() {
    chprompt set '\w' bash :cat:
    chprompt remove '\w' :cat:
    test "$(echo bash)" = "$(chprompt list)"
}

test_command__remove__removes_new_line() {
    chprompt set '\w' git '\n' bash
    chprompt remove '\n'
    test "$(echo '\w' ; echo git ; echo bash)" = "$(chprompt list)"
}
