__chprompt_command__set() {
    export CHPROMPT_FORMAT="$*"
}

__chprompt_command__set__help() {
    echo 'Usage: chprompt set <token> [... <token>]'
    echo
    echo 'set Sets the current token list to the given list of tokens.'
    echo
    echo 'A token is a string of characters (i.e. name) that uniquely identifies it to chprompt as either:'
    echo
    echo '1. an emoji, in which case it must be surrounded by colons (e.g. :fire:), which gets translated to an emoji character by the currently loaded function __chprompt_plugin__emoji. The emoji final representation in the prompt can be further customized by the executable named in the environment variable CHPROMPT_EMOJI_RENDERER.'
    echo
    echo '2. a backslash-escaped special character native to the running shell (e.g. "\w"), which is provided to PS1 as-is. The two-character sequence must surrounded by either single or double quotes.'
    echo
    echo '3. a name that corresponds to a chprompt plugin function. For instance, when chprompt reads a token named "git", it checks whether a function named __chprompt_plugin__git is currently loaded, and if so, calls it. The output of that call is then added to the PS1 string.'
}
