test_plugin__git__no_dot_git_directory() {
    trap 'rm $tmp' EXIT
    tmp=$(mktemp)
    readonly tmp
    cd "${tmp%/*}"
    test 'b:_' = "$(__chprompt_plugin__git)"
}

test_plugin__git__checked_out_branch() {
    trap 'rm -rf $tmp_dir/.git ; rm $tmp' EXIT
    tmp=$(mktemp)
    tmp_dir="${tmp%/*}"
    git_dir="${tmp_dir}/.git"
    readonly tmp tmp_dir git_dir
    cd "$tmp_dir" && git init -b foo
    test 'b:foo' = "$(__chprompt_plugin__git)"
}
