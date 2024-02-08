__chprompt_command__help() {
    exit_status=0
    if test "$1" -gt 0; then
        exec >&2
        exit_status="$1"
    fi
    case "$2" in
        set|edit|remove|list|lpop|rpop|prepend|append) "__chprompt_command__${2}__help" ;;
        *)
            if test -n "$2"; then
                echo "chprompt help $2: no usage information available." >&2
                return 1
            fi
            echo 'Usage: chprompt <command> [arguments]'
            echo
            echo 'Available commands:'
            echo
            printf '\t%-10s %s\n' 'set'     'Set current token list'
            printf '\t%-10s %s\n' 'edit'    'Edit current token list in a text editor buffer'
            printf '\t%-10s %s\n' 'remove'  'Remove all matching tokens from token list'
            printf '\t%-10s %s\n' 'list'    'List current token list'
            printf '\t%-10s %s\n' 'lpop'    'Remove <count> tokens from left-hand side of token list'
            printf '\t%-10s %s\n' 'rpop'    'Remove <count> tokens from right-hand side token list'
            printf '\t%-10s %s\n' 'prepend' 'Insert tokens at left-hand side of token list'
            printf '\t%-10s %s\n' 'append'  'Insert tokens at right-hand side of token list'
            printf '\t%-10s %s\n' 'version' 'Print chprompt version'
            echo
            echo 'Run "chprompt help <command>" for further information about a command.'
            ;;
    esac
    return "$exit_status"
}
