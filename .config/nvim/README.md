


## Plugin Specific

### Vim-Fugitive `:Gstatus` Hotkeys

This section outlines useful hotkeys available within the `:Gstatus` buffer provided by the [vim-fugitive](https://github.com/tpope/vim-fugitive) plugin.

| Hotkey | Description                                     | Equivalent/Notes                      |
| :----- | :---------------------------------------------- | :------------------------------------ |
| `a`    | Stage the file under the cursor.                | `git add <file>`                      |
| `u`    | Unstage the file under the cursor.              | `git restore --staged <file>`         |
| `S`    | Stage all unstaged files.                       | `git add .`                           |
| `U`    | Unstage all staged files.                       | `git restore --staged .`              |
| `C`    | Commit changes (opens commit message buffer).   | `git commit`                          |
| `cc`   | Commit changes with the current index.          | `git commit`                          |
| `ca`   | Commit all changes (staged and unstaged).       | `git commit -a`                       |
| `cC`   | Commit changes, reusing the last commit message.| `git commit -c ORIG_HEAD` or similar  |
| `D`    | Discard changes for the file under the cursor.  | `git restore <file>`                  |
| `p`    | Pull from the remote.                           | `git pull`                            |
| `P`    | Push to the remote.                           | `git push`                            |
| `X`    | Clean untracked files (use with caution!).      | `git clean`                           |
| `?`    | Show help for the `:Gstatus` buffer.            | Equivalent to built-in help           |
| `gv`   | Open the file under the cursor in a split.      | Opens file in Vim split               |
| `-`    | Apply the hunk under the cursor.                | Applies selected hunk                 |
| `_`    | Revert the hunk under the cursor.               | Reverts selected hunk                 |
| `==`   | Diff the file under the cursor.                 | `git diff <file>` or `git diff --staged <file>` |
