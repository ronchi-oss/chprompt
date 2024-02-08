__chprompt_plugin__emoji() {
    list="$(__chprompt_plugin__emoji__list)"
    token="${1:?'error: missing argument <name>'}" || return 1
    query="$(echo "$token" | sed 's/^:// ; s/:$//')"
    for entry in $list; do
        if test  "${entry#*:}" = "$query"; then
            echo "${entry%:*}"
            return
        fi
    done
    echo "error: unsupported emoji '$query' (missing in __chprompt_plugin__emoji__list)" >&2
    return 1
}

__chprompt_plugin__emoji__list() {
    echo "🐈:cat 🐶:dog 🔥:fire 😪:sleepy 🎉:party"
}
