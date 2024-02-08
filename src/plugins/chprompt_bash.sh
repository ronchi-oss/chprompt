__chprompt_plugin__bash() {
    echo "v:${BASH_VERSION%(*}"
}

__chprompt_plugin__bash__renderer() {
    __chprompt_renderer__data_tuples "$@"
}
