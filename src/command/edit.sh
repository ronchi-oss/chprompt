__chprompt_command__edit() {
    editor="${CHPROMPT_EDITOR:-$EDITOR}"
    if test -z "$editor"; then
        echo 'error: either CHPROMPT_EDITOR or EDITOR must be defined.' >&2
        return 1
    fi
    tmp=$(mktemp) ; trap 'rm $tmp' EXIT
    for token in $CHPROMPT_FORMAT; do
        echo "$token" >> "$tmp"
    done
    "$editor" "$tmp" < /dev/tty
    tokens=''
    while IFS= read -r token; do
        tokens="$tokens $token"
    done < "$tmp"
    chprompt set "$tokens"
}

__chprompt_command__edit__help() {
    echo 'Usage: chprompt edit'
    echo
    echo 'edit allows interactive editing of the tokens list using EDITOR.'
}
