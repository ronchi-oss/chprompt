__chprompt_completion__suggest_commands() {
    chprompt help \
        | grep '^\t' \
        | cut -f 2 \
        | while read -r command _; do
              echo "$command"
          done
}

__chprompt_completion__suggest_commands_with_help() {
    __chprompt_completion__suggest_commands \
        | while read -r command; do
              line="$(type "__chprompt_command__${command}__help" 2>/dev/null | head -n 1)"
              if test "${line##* }" != 'function'; then
                  continue
              fi
              echo "$command"
          done
}

__chprompt_completion__exclude_literals() {
    grep -Ev '^(emoji|special_character)$'
}
