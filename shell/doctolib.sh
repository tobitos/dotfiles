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
alias pug-board="open https://doctolib.atlassian.net/secure/RapidBoard.jspa?rapidView=201"
alias pug-sum="open https://meet.google.com/dww-jwcm-ymn"
alias pug-roadmap="open https://app.asana.com/0/1182156501341633/timeline"

alias hk-prs="open https://github.com/doctolib/doctolib/pulls?q=is%3Apr+is%3Aopen+label%3AEHR-HOUSE-KEEPING"
alias hk-board="open https://doctolib.atlassian.net/secure/RapidBoard.jspa?rapidView=181"

alias docto-roadmap="open https://app.asana.com/0/1128106467701334/timeline"

alias daniel11="open https://app.asana.com/0/1174675981378074/list"

alias get-structure-sql="git checkout $(git merge-base origin/master HEAD) -- db/structure.sql"
alias docto-start="docker-compose start && rails s -u thin -b 127.0.0.1"
alias docto-workers="bundle exec rake resque:work"