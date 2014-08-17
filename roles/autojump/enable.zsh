
# enable autojump
unamestr=`uname -a`
if [[ "$unamestr" == *Darwin* ]]
then
  [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
fi
