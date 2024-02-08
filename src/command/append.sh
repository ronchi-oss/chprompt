__chprompt_command__append() {
    tokens="${*:?'error: missing argument <token-list>'}" || return 1
    chprompt set "$CHPROMPT_FORMAT $tokens"
}

__chprompt_command__append__help() {
    echo 'Usage: chprompt append <token> [... <token>]'
    echo
    echo 'append iterates over the list of given tokens and appends them to the token list.'
    echo
    echo 'Run "chprompt help set" for further information on tokens.'
}
