con () {
    echo "Activating miniconda"
    source $HOME/miniconda/bin/activate ${1:-root}
}

coff () {
    echo "Deactivating miniconda"
    typeset -a _path
    typeset _p
    for _p in $path
    do
        if [[ $_p != $HOME/miniconda/* ]]
        then
            _path+=$_p
        fi
    done
    path=($_path)
    unset CONDA_DEFAULT_ENV
}
