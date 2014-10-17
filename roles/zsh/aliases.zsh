# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias cl="clear"
alias c="clear"
alias pg='ps -ef | grep'
alias lj='jobs'

alias reload!='. ~/.zshrc'
alias zshconfig="exec $EDITOR ~/.zshrc"
alias vimrc="exec $EDITOR ~/.vimrc"
