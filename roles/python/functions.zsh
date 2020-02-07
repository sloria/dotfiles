# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

# Build docs in watch mode.
# requires sphinx-autobuild (pip install sphinx-autobuild)
function sphinxwatch() {
    sphinx-autobuild --open-browser docs docs/_build
}


# Generate fake data, e.g. `fake name`, `fake url`, `fake email`
# Requires faker to be installed (pip install faker)
function fake() {
    result=$(PYTHONIOENCODING=UTF-8 faker -s="" $1)
    echo "$result"
    echo "$result" | pbcopy
}

function pyup() {
    if [[ -f setup.py ]]; then
        printf "Found \e[1msetup.py\e[m...\n"
        pip install -U -e '.[dev]'
    fi
    if [[ -f requirements-dev.txt ]]; then
        printf "Found \e[1mrequirements-dev.txt\e[m...\n"
        pip install -U -r requirements-dev.txt
    elif [[ -f requirements.txt ]]; then
        printf "Found \e[1mrequirements.txt\e[m...\n"
        pip install -U -r requirements.txt
    fi
}
