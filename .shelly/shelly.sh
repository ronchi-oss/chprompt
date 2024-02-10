__shelly_build_target__main() {
    echo src/main.sh
    echo src/renderer.sh
    echo src/styling.sh
    for path in src/command/* src/plugins/*.sh; do
        echo "$path"
    done
}

__shelly_build_target__bash_completion() {
    echo src/completion/completion.sh
    echo src/completion/completion.bash
}
