test_render_token__matches_and_renders_supported_emoji() {
    test 🐶 = "$(__chprompt_render_token ':dog:')"
}

test_render_token__fails_rendering_unsupported_emoji() {
    __chprompt_render_token :foo: 2>/dev/null
    test 0 -ne $?
}

test_render_token__matches_and_renders_special_character_as_itself() {
    test '\w' = "$(__chprompt_render_token '\w')"
}

test_render_token__matches_and_renders_environment_variable() {
    export FOO='bar'
    test "$(__chprompt_plugin__env FOO | __chprompt_renderer__data_tuples env)" = "$(__chprompt_render_token FOO)"
}

test_render_token__emoji_plugin_cant_be_rendered_by_name() {
    __chprompt_render_token emoji 2>/dev/null
    test 0 -ne $?
}

test_render_token__special_character_plugin_cant_be_rendered_by_name() {
    __chprompt_render_token special_character 2>/dev/null
    test 0 -ne $?
}

test_render_token__fails_if_plugin_undefined() {
    __chprompt_render_token an_undefined_plugin 2>/dev/null
    test 0 -ne $?
}

test_render_token__succeeds_if_plugin_defined() {
    __chprompt_render_token user_at_host >/dev/null
    test 0 -eq $?
}
