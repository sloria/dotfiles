# credit: http://nparikh.org/notes/zshrc.txt
# Usage: extract <file>
# Description: extracts archived files / mounts disk images
# Note: .dmg/hdiutil is Mac OS X-specific.
extract () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)  tar -jxvf $1                        ;;
            *.tar.gz)   tar -zxvf $1                        ;;
            *.bz2)      bunzip2 $1                          ;;
            *.dmg)      hdiutil mount $1                    ;;
            *.gz)       gunzip $1                           ;;
            *.tar)      tar -xvf $1                         ;;
            *.tbz2)     tar -jxvf $1                        ;;
            *.tgz)      tar -zxvf $1                        ;;
            *.zip)      unzip $1                            ;;
            *.ZIP)      unzip $1                            ;;
            *.pax)      cat $1 | pax -r                     ;;
            *.pax.Z)    uncompress $1 --stdout | pax -r     ;;
            *.Z)        uncompress $1                       ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# get gzipped size
function gz() {
    echo "orig size    (bytes): "
    cat "$1" | wc -c
    echo "gzipped size (bytes): "
    gzip -c "$1" | wc -c
}

# credit: http://ku1ik.com/2012/05/04/scratch-dir.html
# Creates a new scratch directory and cds to it
function scratch {
  cur_dir="$HOME/scratch"
  new_dir="$HOME/tmp/scratch-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "New scratch dir ready for grinding ;>"
}

 # Allow returning to Vim by pressing Ctrl+Z
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# Syntax-highlight text from clipboard
# Requires highlight: brew install highlight
# Usage: hit js
function hit() {
  if [ -z "$2" ]
    then src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font 'Ubuntu Mono' --style solarized-light --font-size 24 | pbcopy
}

# SSH and attach tmux session
function sst() {
  ssh "$1" -t tmux attach
}
