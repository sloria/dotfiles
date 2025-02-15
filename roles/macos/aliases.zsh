# sha56 <file> - get the sha256 hash of a file
function sha256() {
  shasum -a 256 $1 | head -1 | grep -o '^\S\+'
}

# b64 <file> - base64 encode a file
function b64() {
  cat $1 | openssl base64 | tr -d '\n';
}
