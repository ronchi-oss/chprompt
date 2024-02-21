test__styling__arrow__exits_with_zero() {
    echo "" |  __chprompt_styling__arrow
    test 0 -eq $?
}

test_styling__arrow__creates_minimal_prompt_correctly() {
    test '→ ' = "$(echo "" |  __chprompt_styling__arrow)"
}

test_styling__double_decker__leaves_single_line_unmodified() {
    test 'hello world' = "$(echo 'hello world' | __chprompt_styling__double_decker)"
}

test_styling__double_decker__applies_line_connectors_if_new_line_char_detected() {
    test '╭ hello\n╰ world' = "$(printf 'hello%sworld' '\\n' | __chprompt_styling__double_decker)"
}
