alias py="python"
alias py3="python3"
alias ipy="ipython"
alias ipynb="ipython notebook"
alias pyserv2="python2 -m SimpleHTTPServer"
alias pyserv="python3 -m http.server"
alias pt="py.test"
alias nt="nosetests"
alias mn="python manage.py"
alias pipgrep="pip freeze | grep "
alias getpip="wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py"

# Conda environments
alias mkenv="conda create python=3 ipython pip -n "
alias mkenv2="conda create python=2 ipython pip -n "
alias lsenv="conda info -e"
alias wo="source activate"
alias de="source deactivate"

# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}
