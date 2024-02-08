__chprompt_plugin__chprompt() {
    line="$(type __chprompt_command__version 2>/dev/null | head -n 1)"
    if test "${line##* }" = 'function'; then
        line="$(__chprompt_command__version)"
        echo "v:${line#chprompt version }"
    else
        echo 'v:_'
    fi
}

__chprompt_plugin__chprompt__renderer() {
    __chprompt_renderer__data_tuples "$@"
}
