# Doctolib utils
DOCTOLIB_ROOT=~/git/doctolib
DOCTOLIB_UTILS=~/git/misc/bash-utils
source "$DOCTOLIB_UTILS/doctolib-utils.sh"

# Flaky detector shortcut
# (flaky test/integration/doctor/desktop/agenda/appointment/modal/booking2_test.rb 266)
flaky() {
  classline=$(cat $1 | grep '^\s*class.*$')
  classname=$(echo "$classline" | cut -d ' ' -f 2)
  testname=$(awk NR==$2 $1 | sed -E -e "s/[[:space:]']+/_/g" -e 's/^_*it/test/' -e 's/_do$//')
  rake "ci:run_flaky_detector[$classname,$testname]"
}

alias pug-prs="open https://github.com/doctolib/doctolib/pulls?q=is%3Apr+is%3Aopen+label%3APUG"
alias pug-board="open https://doctolib.atlassian.net/secure/RapidBoard.jspa?rapidView=201&projectKey=PUG"