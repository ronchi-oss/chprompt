__chprompt_styling__apply() {
    __chprompt_styling__trim_line_feed \
        | __chprompt_styling__double_decker \
        | __chprompt_styling__arrow
}

__chprompt_styling__arrow() {
    sed 's/$/→ /'
}

__chprompt_styling__double_decker() {
    prompt="$(cat -)"
    if ! echo "$prompt" | grep -q '\\n'; then
        echo "$prompt"
        return
    fi
    echo "$prompt" | sed 's/^/╭ / ; s/\\n/\\n╰ /'
}

__chprompt_styling__trim_line_feed() {
    sed 's/\\n /\\n/'
}
