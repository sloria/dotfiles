# Lazily load completion to speed up zsh startup time
# https://stackoverflow.com/a/48202907/1157536
kubectl () {
    command kubectl $*
    if [[ -z $KUBECTL_COMPLETE ]]
    then
        source <(command kubectl completion zsh)
        KUBECTL_COMPLETE=1 
    fi
}
