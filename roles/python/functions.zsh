# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

# Generate fake data, e.g. `fake name`, `fake url`, `fake email`
function fake() {
    result=$(PYTHONIOENCODING=UTF-8 uv tool run faker -s="" $1)
    echo -n "$result"
    echo -n "$result" | pbcopy
}
