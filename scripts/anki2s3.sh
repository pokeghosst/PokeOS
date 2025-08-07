#!/usr/bin/env bash
set -euo pipefail

log() {
    echo "$(date '+%Y-%m-%d %H-%M-%s') - $1" >&2
}

ANKI_PATH="$HOME/.local/share/Anki2"

check_prerequisites() {
    if ! command -v rclone &> /dev/null; then
        error "rclone not installed"
    fi

    if [[ ! -d "$ANKI_PATH" ]]; then
        error "Anki directory not found: $ANKI_PATH"
        return 1
    fi

    if [ -z "$RCLONE_REMOTE" ]; then
        error "No remote specified"
        return 1
    fi

    if ! rclone listremotes | grep -q "^${RCLONE_REMOTE}:"; then
        error "Rclone remote '${RCLONE_REMOTE}' not found."
        error "Please configure rclone with: rclone config"
        return 1
    fi

    log "Starting Anki sync to B2"
}

main() {
    check_prerequisites
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                # show_help
                exit 0
                ;;
            --remote)
                RCLONE_REMOTE="$2"
                shift 2
                ;;
            --path)
                RCLONE_PATH="$2"
                shift 2
                ;;
            *)
                error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi