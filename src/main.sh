__chprompt_command__version() {
    echo 'chprompt version 0.1.0'
}

export CHPROMPT_EDITOR="${CHPROMPT_EDITOR:-$EDITOR}"
export CHPROMPT_HOOKS="${CHPROMPT_HOOKS:-}"

export PROMPT_COMMAND="__chprompt_render_prompt"

chprompt() {
    case "$1" in
        -h) shift ; __chprompt_command__help 1 ;;
        help) shift ; __chprompt_command__help 0 "$1" ;;
        set|edit|remove|list|lpop|rpop|prepend|append|version)
            command="$1" ; shift
            "__chprompt_command__${command}" "$@"
            ;;
        *)
            if test -n "$1"; then
                echo "chprompt $1: unknown command"
                echo "Run 'chprompt help' for usage."
            else
                __chprompt_command__help 1
            fi
    esac
}

__chprompt_builtins() {
    echo 'emoji'
    echo 'special_character'
}

__chprompt_render_prompt() {
    export CHPROMPT_LAST_EXIT_STATUS="$?"
    prompt=''
    format=''
    for token in $CHPROMPT_FORMAT; do
        token="$(echo "$token" | sed 's/__*/_/')"
        next_fragment="$(__chprompt_render_token "$token")"
        if test $? -eq 0; then
            prompt="$prompt$next_fragment "
            format="$format $token"
        fi
    done
    export CHPROMPT_FORMAT="${format# }"
    PS1="$(echo "$prompt" | __chprompt_styling__apply)" ; export PS1
    if test -n "$CHPROMPT_HOOKS"; then
        for hook_bin in $CHPROMPT_HOOKS; do
            "$hook_bin" "$CHPROMPT_FORMAT"
        done
    fi
}

__chprompt_render_token() {
    token="${1:?'missing argument <token>'}" || return 1
    case "$token" in
        :*:) __chprompt_plugin__emoji "$token" | __chprompt_renderer__default "$token" ;;
        \\?) __chprompt_plugin__special_character "$token" | __chprompt_renderer__default "$token" ;;
        [A-Z_]*) __chprompt_plugin__env "$token" | __chprompt_renderer__data_tuples env ;;
        *)
            if test "$(__chprompt_builtins | grep "^$token$")"; then
                echo "error: token '$token' can't be added to the prompt directly; use a literal value instead." >&2
                return 1
            fi
            line="$(type "__chprompt_plugin__${token}" 2>/dev/null | head -n 1)"
            if test "${line##* }" != 'function'; then
                echo "error: function __chprompt_plugin__$1 is not defined." >&2
                return 1
            fi
            "__chprompt_plugin__${token}" \
                | (
                      line="$(type "__chprompt_plugin__${token}__renderer" 2>/dev/null | head -n 1)"
                      if test "${line##* }" = 'function'; then
                          "__chprompt_plugin__${token}__renderer" "$token"
                      else
                          __chprompt_renderer__default "$token"
                      fi
                  )
    esac
}
