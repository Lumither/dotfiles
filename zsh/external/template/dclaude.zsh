_dclaude_get_key() {
    case "$(uname -s)" in
        Darwin)
            security find-generic-password -s "deepseek-anthropic-apikey" -w 2>/dev/null
            ;;
        Linux)
            if command -v kwallet-query >/dev/null 2>&1; then
                kwallet-query -r "deepseek-anthropic-apikey" -f "deepseek" kdewallet 2>/dev/null
            elif command -v secret-tool >/dev/null 2>&1; then
                secret-tool lookup service deepseek-anthropic-apikey 2>/dev/null
            elif command -v pass >/dev/null 2>&1; then
                pass show deepseek/anthropic-apikey 2>/dev/null
            fi
            ;;
    esac
}

dclaude() {
    local token=$(_dclaude_get_key)
    [[ -z "$token" ]] && { echo >&2 "dclaude: failed to retrieve API key"; return 1; }

    ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic" \
    ANTHROPIC_AUTH_TOKEN="$token" \
    ANTHROPIC_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro[1m]" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash" \
    CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash" \
    claude "$@"
}