__chprompt_command__prepend() {
    tokens="${*:?'error: missing argument <token-list>'}" || return 1
    chprompt set "$tokens $CHPROMPT_FORMAT"
}

__chprompt_command__prepend__help() {
    echo 'Usage: chprompt prepend <token> [... <token>]'
    echo
    echo 'prepend iterates over the list of given tokens and prepends them to the token list.'
    echo
    echo 'Run "chprompt help set" for further information on tokens.'
}
