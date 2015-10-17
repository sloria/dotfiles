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

# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}
