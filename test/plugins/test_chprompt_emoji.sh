test_plugin__emoji__fails_if_unsupported_emoji() {
    __chprompt_plugin__emoji :foo: 2>/dev/null
    test 0 -ne $?
}

test_plugin__emoji__renders_supported_emoji() {
    test 🐈 = "$(__chprompt_plugin__emoji :cat:)"
}
