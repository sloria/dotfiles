vim
===

Installs vim, [vim-plug](https://github.com/junegunn/vim-plug), and symlinks [.vimrc](https://github.com/sloria/dotfiles/blob/master/roles/vim/files/vimrc).

## Want to install without using ansible?

See: https://github.com/sloria/dotfiles#what-if-i-only-want-your-vim

## Highlights

### Essentials

Leader is `Space`.

- `<space-w>`: Write file (who has time to type `:w<CR>`?).
- `<space-q>`: Quit.
- `<space-n>`: Remove search highlight.
- `<space-v>`: Vertical split.
- `<C-p>`: Go to file (default binding).
- `<space-s>`: Go to symbol (method, function, etc.) in file.
- `<space-/>`: Toggle comment.
- `<space-d>`: Open filebrowser.
- `<space-h>` and `<space-l>`: Go to beginning/end of line.
- `<space-,>`: Open up vimrc.
- `<space-a>`: Copy whole file.
- `<C-h|j|k|l>`: Move around windows.
- `<space-space-w>`: Strip trailing whitespace.
- `<space-f>`: Search current directory with ag or ack (depending on which is installed).

### Python

#### Running tests

- `<space-m>`: Run test method.
- `<space-c>`: Run test class.
- `<space-tf>`: Run test function.
- `<space-F>`: Run all test in file.

#### Rope

- `<C-c>g`: Go to definition (default binding).
- `<C-c>rr`: Rename variable (default binding).

### Javascript

- `<C-c>g`: Go to definition.
- `<C-c>rr`: Rename variable.

### Git

- `<space-gs>`: Open git status.
- `<space-gb>`: git blame
- `<space-gp>`: git push
- `<space-gh>`: Stage hunk.
- `<space-gB>`: git Browse (go to corresponding file or selected lines on Github)
- `]h` and `[h`: Go to next/previous hunk.
