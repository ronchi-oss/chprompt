test_command__set__sets_to_empty_format() {
    chprompt set ''
    test '' = "$(format '%s' "$(for t in $CHPROMPT_FORMAT; do echo "$t"; done)")"
}

test_command__set__sets_to_many_tokens_format() {
    chprompt set 'pwd bash git \n :cat:'
    test "$(echo pwd ; echo bash ; echo git ; echo '\n' ; echo :cat:)" = "$(for t in $CHPROMPT_FORMAT; do echo "$t"; done)"
}
