__chprompt_plugin__exit_status() {
    echo "${CHPROMPT_LAST_EXIT_STATUS:-_}"
}

__chprompt_plugin__exit_status_reaction() {
    if test -z "$CHPROMPT_LAST_EXIT_STATUS"; then
        echo _
    elif test "$CHPROMPT_LAST_EXIT_STATUS" -gt 0; then
        echo 🚨
    else
        echo 😎
    fi
}

__chprompt_plugin__exit_status_dwim() {
    if test -z "$CHPROMPT_LAST_EXIT_STATUS"; then
        echo _
    elif test "$CHPROMPT_LAST_EXIT_STATUS" -gt 0; then
        printf "\[\033[31;1m\]%s\[\033[0m\] %s\n" "$CHPROMPT_LAST_EXIT_STATUS" 🚨
    else
        echo 😎
    fi
}
