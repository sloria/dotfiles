alias pg='ps -ef | grep'
alias reload!='. ~/.zshrc'
# resize images
alias resize="mogrify -resize"

alias btm="btm --process_memory_as_value"

# Usage: qr https://example.com
# Useful for e.g. deploy preview URLs, ngrok URLs, etc
# Requires qrtool: brew install qrtool
alias qr="qrtool encode -t terminal"
