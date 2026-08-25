proxy() {
    export http_proxy="http://127.0.0.1:2080"
    export https_proxy="http://127.0.0.1:2080"
    export all_proxy="socks5h://127.0.0.1:2080"
    export HTTP_PROXY="$http_proxy"
    export HTTPS_PROXY="$https_proxy"
    export ALL_PROXY="$all_proxy"
}

unproxy() {
    unset http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY
}

tmproxy() {
    http_proxy="http://127.0.0.1:2080" \
    https_proxy="http://127.0.0.1:2080" \
    all_proxy="socks5h://127.0.0.1:2080" \
    HTTP_PROXY="http://127.0.0.1:2080" \
    HTTPS_PROXY="http://127.0.0.1:2080" \
    ALL_PROXY="socks5h://127.0.0.1:2080" \
    "$@"
}
