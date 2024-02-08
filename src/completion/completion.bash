__chprompt_completion__bash__prompt_tokens() {
    compgen -A function \
        | grep '^__chprompt_plugin__' \
        | sed 's/^__chprompt_plugin__//' \
        | grep -Ev '__.*$'
}

__chprompt_completion__bash() {
    test "$1" != chprompt && return 1
    mapfile -t COMPREPLY < <(
        case "$3" in
            chprompt)
                __chprompt_completion__suggest_commands \
                    | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
            help)
                __chprompt_completion__suggest_commands_with_help \
                    | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
            set|prepend|append)
                    __chprompt_completion__bash__prompt_tokens \
                        | __chprompt_completion__exclude_literals \
                        | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
            remove)
                chprompt list | grep "${COMP_WORDS[COMP_CWORD]}"
                ;;
        esac
    )
}

complete -F __chprompt_completion__bash chprompt
