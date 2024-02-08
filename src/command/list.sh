__chprompt_command__list() {
    for token in $CHPROMPT_FORMAT; do
        echo "$token"
    done
}

__chprompt_command__list__help() {
    echo 'Usage: chprompt list'
    echo
    echo 'list prints the list of tokens to standard output (first to last, one per line).'
}
