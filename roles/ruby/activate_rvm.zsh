# Lazily load rvm, irb, rake, rails

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
group_lazy_load $HOME/.rvm/scripts/rvm rvm irb rake rails
