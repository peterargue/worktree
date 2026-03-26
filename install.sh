#!/usr/bin/env sh
set -e

REPO="https://github.com/peterargue/worktree.git"
INSTALL_DIR="${HOME}/.local/share/worktree-manager"

main() {
    echo "Installing worktree manager..."

    # Check for git
    if ! command -v git >/dev/null 2>&1; then
        echo "Error: git is required but not installed"
        exit 1
    fi

    # Check git version (need 2.5+ for worktree support)
    git_version=$(git --version | sed 's/git version //' | cut -d. -f1-2)
    git_major=$(echo "$git_version" | cut -d. -f1)
    git_minor=$(echo "$git_version" | cut -d. -f2)
    if [ "$git_major" -lt 2 ] || { [ "$git_major" -eq 2 ] && [ "$git_minor" -lt 5 ]; }; then
        echo "Error: git 2.5+ is required (found ${git_version})"
        exit 1
    fi

    # Clone or update
    if [ -d "$INSTALL_DIR" ]; then
        echo "Updating existing installation..."
        git -C "$INSTALL_DIR" pull --ff-only
    else
        echo "Cloning to ${INSTALL_DIR}..."
        mkdir -p "$(dirname "$INSTALL_DIR")"
        git clone "$REPO" "$INSTALL_DIR"
    fi

    # Run the local install script
    sh "$INSTALL_DIR/setup.sh"

    echo ""
    echo "Restart your shell or run:"
    echo "  source ~/.$(basename "$SHELL")rc"
}

main
