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
- `<C-t>`: Go to symbol (method, function, etc.) in file.
- `<space-/>`: Toggle comment.
- `<space-d>`: Open filebrowser.
- `<space-h>` and `<space-l>`: Go to beginning/end of line.
- `<space-,>`: Open up vimrc.
- `<space-a>`: Copy whole file.
- `<C-h|j|k|l>`: Move around windows.
- `<BS>` (Backspace): Strip trailing whitespace.
- `<C-y>,`: Expand an [Emmet](http://emmet.io/) abbreviation (default binding)
- `s{char}{char}`: Quickly move around ([sneak](https://github.com/justinmk/vim-sneak)-style motion).

### Search

- `<C-f>f`: Search current project (works with visual selection).
- `<C-f>n`: Search current word under cursor.
- `<C-f>t`: Toggle search window.

### Buffers

- `[b` and `]b` or Left/Right arrow keys: Previous/next buffer (default bindings of vim-unimpaired)
- `X`: Delete current buffer without closing window.

### Running tests (Python, JS, Clojure, Ruby)

- `<space-tt>`: Run nearest test.
- `<space-tf>`: Run test file.
- `<space-tl>`: Run last test.
- `<space-ts>`: Run full test suite.

### Python

#### Jedi

- `<C-c>g`: Go to definition.
- `<C-c>r`: Rename variable.

### Git

- `<space-gs>`: Open git status.
- `<space-gb>`: git blame
- `<space-gp>`: git push
- `<space-gh>`: Stage hunk.
- `<space-gH>`: Unstage hunk.
- `]h` and `[h`: Go to next/previous hunk.
- `<space-gB>`: git Browse (go to corresponding file or selected lines on Github)
