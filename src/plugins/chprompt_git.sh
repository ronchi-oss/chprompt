__chprompt_plugin__git() {
    if ! test -d .git; then
        echo 'b:_'
    else
        echo "b:$(git branch --show-current)"
    fi
}

__chprompt_plugin__git_extended() {
    if ! test -d .git; then
        echo 'b:_'
    else
        echo "b:$(git branch --show-current)"
    fi
    echo "v:$(git version | cut -d ' ' -f 3)"
}

__chprompt_plugin__git__renderer() {
    __chprompt_renderer__data_tuples "$@"
}

__chprompt_plugin__git_extended__renderer() {
    shift
    __chprompt_renderer__data_tuples git "$@"
}
