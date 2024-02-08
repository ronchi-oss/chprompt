__chprompt_command__remove() {
    tokens="${*:?'error: missing argument <token-list>'}" || return 1
    format="$CHPROMPT_FORMAT"
    for token_to_remove in $tokens; do
        format="$(for token in $format; do if test "$token" != "$token_to_remove"; then echo "$token"; fi; done)"
    done
    chprompt set "$format"
}

__chprompt_command__remove__help() {
    echo 'Usage: chprompt remove <token> [... <token>]'
    echo
    echo 'remove iterates over the list of given tokens and removes them (exact match) from the token list. If the given token appears multiple times in the current token list, all its occurrences are removed.'
}

