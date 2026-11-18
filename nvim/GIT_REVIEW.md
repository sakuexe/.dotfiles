# Git review cheatsheet

Keymaps for reviewing changes (e.g. AI-generated code) inside Neovim.
Defined in `lua/sakuexe/lazy/telescope.lua` and `lua/sakuexe/lazy/gitsigns.lua`.

## Keymaps

| Key          | Action                                                                 |
|--------------|------------------------------------------------------------------------|
| `<leader>gc` | **G**it **c**hanges: Telescope list of every changed hunk in the repo, Enter jumps there |
| `<leader>gs` | **G**it **s**tatus: Telescope list of changed files                    |
| `]h` / `[h`  | Next / previous hunk in the current file                               |
| `<leader>hp` | **H**unk **p**review: show the old code inline (hides on cursor move)  |
| `<leader>hs` | **H**unk **s**tage: stage the hunk under the cursor                    |
| `<leader>hr` | **H**unk **r**eset: discard the hunk under the cursor (`u` to undo)    |
| `<leader>hq` | **H**unks to **q**uickfix: all hunks in the repo → `:cnext` / `:Trouble quickfix` |

Inside the `<leader>gc` picker, `<C-q>` sends the list to quickfix.

## Review workflow

1. `<leader>gc`: pick a file/hunk and jump to it
2. `]h`: step through the hunks in that file
3. `<leader>hp`: peek at the old code when needed
4. `<leader>hs` to accept (stage) or `<leader>hr` to throw away

## Notes

- `<leader>gc` diffs against `HEAD`, so staged hunks still show up in it;
  new untracked files are listed as `[new file]`.
- `<leader>g…` = git views/pickers, `<leader>h…` = actions on one hunk
  (the gitsigns README convention).
- `]h` is used instead of `]c` so Vim's built-in diff-mode `]c` keeps working.
