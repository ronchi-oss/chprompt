__shelly_build_target__main() {
    find src/main.sh \
        src/renderer.sh \
        src/styling.sh \
        src/command/*.sh \
        src/plugins/*.sh \
        -print0
}

__shelly_build_target__bash_completion() {
    find src/completion/completion.sh src/completion/completion.bash -print0
}
