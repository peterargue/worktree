# Git Worktree Manager

A shell tool to manage Git worktrees within your repository. Worktrees are created under `.worktrees/` in the repo root, and the `.claude` directory is automatically copied into each new worktree.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/peterargue/worktree/main/install.sh | sh
```

or install from source

```bash
git clone https://github.com/peterargue/worktree.git ~/.local/share/worktree-manager
~/.local/share/worktree-manager/setup.sh
```

### Reload your shell

```bash
source ~/.zshrc  # or ~/.bashrc
```

## Usage

### `worktree add <branch>`

Creates a new worktree at `.worktrees/<branch>` and `cd`s into it.

```bash
worktree add feature-login
```

- If the branch exists locally or on the remote, it checks it out
- If the branch doesn't exist, it creates one from the default branch (main/master)
- Copies the `.claude/` directory from the main repo into the worktree
- Ensures `.worktrees/` is listed in `.gitignore`
- If the worktree already exists, just `cd`s into it

Branch names are sanitized for directory names — characters like `/`, `.`, `@` are replaced with `-`. For example, `feature/login.v2` becomes `.worktrees/feature-login-v2`.

To create a worktree from a specific base (tag, commit, or another branch), create the branch first:

```bash
git checkout -b hotfix-branch v1.2.0
worktree add hotfix-branch
```

### `worktree list`

Lists all worktrees (excluding the main repo), showing branch name and path.

```bash
worktree list
```

### `worktree resume [<branch>]`

Switch to an existing worktree. With a branch name, `cd`s directly into it. Without arguments, shows a numbered list to pick from.

```bash
worktree resume feature-login   # cd directly
worktree resume                 # pick from a list
```

### `worktree remove [--force] <branch>`

Removes a worktree. If the branch has been merged, the branch is also deleted.

```bash
worktree remove feature-login
```

Use `--force` to remove even if there are uncommitted changes:

```bash
worktree remove --force feature-login
```

## Directory Structure

```
your-repo/
├── .worktrees/          # ignored by git
│   ├── feature-login/
│   ├── bugfix-123/
│   └── hotfix-release/
├── .gitignore           # .worktrees/ added automatically
└── ...
```

## Requirements

- Git 2.5+ (for worktree support)
- Bash or Zsh
