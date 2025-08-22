# Git Worktree Aliases

A collection of shell aliases to simplify working with Git worktrees. These aliases provide convenient commands for creating, managing, and removing Git worktrees with automatic organization and branch handling.

## Features

- **Automatic worktree organization**: Worktrees are stored in a configurable base directory organized by repository
- **Smart branch detection**: Automatically detects if a branch exists locally or remotely
- **Default branch fallback**: Creates new branches from the repository's default branch when needed
- **Configurable editor integration**: Automatically opens new worktrees in your preferred editor
- **Safe removal**: Includes confirmation prompts and branch cleanup options

## Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url> ~/.git-worktree-aliases
   cd ~/.git-worktree-aliases
   ```

2. **Run the install script**:
   ```bash
   ./install.sh
   ```

   The install script will:
   - Detect your shell (bash, zsh, etc.)
   - Add the aliases to your shell RC file (e.g., `~/.bashrc`, `~/.zshrc`)
   - Source the aliases automatically on shell startup

3. **Reload your shell** or restart your terminal:
   ```bash
   source ~/.zshrc  # or ~/.bashrc
   ```

## Usage

### Creating Worktrees

**Add a new worktree for a new or existing branch**:
```bash
wt-add feature-branch
```

The `wt-add` command will:
- Check if the branch exists locally or remotely
- Create the worktree in `{WORKTREE_DEV_DIR}/{org-repo}-worktrees/{branch-name}`
- Handle branch creation from the default branch if needed
- Automatically open the new worktree in your configured editor

### Listing Worktrees

**View all current worktrees**:
```bash
wt-list
```

Shows a formatted list of all worktrees with their branch names and paths.

### Removing Worktrees

**Remove a worktree**:
```bash
wt-rm feature-branch
```

The `wt-rm` command will:
- Remove the worktree directory
- Optionally delete the associated branch (with confirmation)
- Handle worktrees that may be in different locations

## Configuration

### Worktree Base Directory

The base directory for worktrees is configurable by setting the `WORKTREE_DEV_DIR` variable at the top of the `aliases` file:

```bash
WORKTREE_DEV_DIR="$HOME/dev"  # Default location
```

You can change this to any directory you prefer:
```bash
WORKTREE_DEV_DIR="$HOME/projects"  # Alternative location
WORKTREE_DEV_DIR="/opt/development"  # System-wide location
```

### Editor Configuration

The editor used to open new worktrees is configurable by setting the `EDITOR_CMD` variable:

```bash
EDITOR_CMD="cursor"  # Default editor
```

You can change this to any editor command you prefer:
```bash
EDITOR_CMD="code"  # Visual Studio Code
EDITOR_CMD="vim"   # Vim
EDITOR_CMD="emacs" # Emacs
EDITOR_CMD="subl"  # Sublime Text
```

## Directory Structure

Worktrees are organized by repository under the configured base directory:

```
$WORKTREE_DEV_DIR/
├── organization-repo-worktrees/
│   ├── feature-branch/
│   ├── bugfix-123/
│   └── hotfix-release/
└── another-org-repo-worktrees/
    ├── main-feature/
    └── experimental/
```

## Requirements

- Git 2.5+ (for worktree support)
- Bash or Zsh shell
- Your preferred editor (optional, for automatic opening)

## Troubleshooting

**Aliases not working after installation**:
- Ensure your shell RC file was updated: `grep -n "aliases" ~/.zshrc`
- Reload your shell: `source ~/.zshrc`
- Check if the aliases file exists: `ls -la ~/.git-worktree-aliases/aliases`

**Worktree creation fails**:
- Ensure you're in a Git repository
- Check that the remote origin is properly configured
- Verify you have the necessary permissions
- Ensure the `WORKTREE_DEV_DIR` directory exists and is writable

**Editor not opening automatically**:
- Ensure your configured editor is installed and in your PATH
- The editor command should be available in your terminal
- Check that the `EDITOR_CMD` variable is set correctly in the `aliases` file

## Uninstallation

To remove the aliases:

1. Edit your shell RC file (`~/.zshrc` or `~/.bashrc`)
2. Remove the line: `[ -f ~/.git-worktree-aliases/aliases ] && source ~/.git-worktree-aliases/aliases`
3. Reload your shell

## Contributing

Feel free to submit issues and enhancement requests!
