function sha256() {
  shasum -a 256 $1 | head -1 | grep -o '^\S\+'
}
