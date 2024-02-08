__chprompt_plugin__env() {
    match="$(env | grep "^$1=")"
    if test $? -ne 0 || test -z "${match#*=}"; then
        echo "$1:_"
    else
        echo "$1:${match#*=}"
    fi
}
