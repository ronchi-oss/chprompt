__chprompt_command__rpop() {
    count="${1:-1}"
    if test "$( ( echo "$count" | tr -d '[:digit:]' ) | wc -c )" -gt 1; then
        echo 'error: <count> must be a digit.' >&2
        return 1
    fi
    length="$( (for _ in $CHPROMPT_FORMAT; do echo; done) | wc -l)"
    new_length="$((length - count))"
    test "$new_length" -lt 0 && new_length=0
    tokens="$( (for token in $CHPROMPT_FORMAT; do echo "$token"; done) | head -n "$new_length")"
    chprompt set "$tokens"
}

__chprompt_command__rpop__help() {
    echo 'Usage: chprompt rpop <count>'
    echo
    echo 'rpop removes the last <count> tokens from the token list.'
}
