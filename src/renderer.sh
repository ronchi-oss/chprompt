__chprompt_renderer__data_tuples() {
    plugin="${1:?'error: missing argument <plugin-name>'}" || return 1
    context_tuples=''
    while IFS=: read -r key val; do
        context_tuples="$context_tuples $key:\[\033[36;1m\]$val\[\033[0m\]"
    done
    echo "$plugin(${context_tuples# })"
}

__chprompt_renderer__default() {
    __chprompt_renderer__literal
}

__chprompt_renderer__literal() {
    cat -
}
