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

reset_rails_s() {
  rm -rf tmp/pids/server.pid
  SERVER_PID=$(lsof -i :3000 | awk '{print $2}' | tail -1)
  if [[ ! -z $SERVER_PID ]] ; then
    kill -9 $SERVER_PID
    echo "Killed the Rails server process"
  else
    echo "No Rails server running"
  fi
}

alias get-structure-sql="git checkout $(git merge-base origin/master HEAD) -- db/structure.sql"
alias dev-server="docker-compose start && HTTPS=1 rails s"
alias dev-yarn="yarn run dev:https"
alias dev-workers="echo 'Dont wait for output' && bundle exec rake resque:work"

alias my-prs="open https://github.com/doctolib/doctolib/pulls/tobitos"
alias pug-prs="open https://github.com/doctolib/doctolib/pulls?q=is%3Apr+is%3Aopen+label%3APUG"
alias pug-board="open https://doctolib.atlassian.net/secure/RapidBoard.jspa?rapidView=201"
alias pug-sum="open https://meet.google.com/dww-jwcm-ymn"
alias pug-roadmap-asana="open https://app.asana.com/0/1182156501341633/timeline"
alias pug-roadmap-sheet="https://docs.google.com/spreadsheets/d/1xVtwEUCHlk1Q94v3hMPQ_9arqIoW0D7Iwi_zNPMgYlQ/edit#gid=1063734353"

alias tech-life-asana="open https://app.asana.com/0/1131498908731881/list"
alias tech-life-docs="open https://docs.google.com/document/d/18J8jiIYjdQWX9I5HPTX2pjHRxbOtWyiP9OElKAAaMjk/edit"
alias tech-life-history="open https://docs.google.com/spreadsheets/d/13RA0Fnu4k4183VjbpjOX_tTxrQnGT3qPLOxcZjSkn9I/edit#gid=0"

alias docto-roadmap="open https://app.asana.com/0/1128106467701334/timeline"
alias docto-commits="open https://github.com/doctolib/doctolib/commits/master"
alias docto-wiki="open https://github.com/doctolib/doctolib/wiki"

alias workday="open https://wd3.myworkday.com/doctolib"

alias daniel11="open https://app.asana.com/0/1174675981378074/list"

alias docto-dgf="open https://docs.google.com/spreadsheets/d/1J76jAQnHl9u4WpQfi5ueLYWT-435fnMNAU28cX6rLbE/edit#gid=1098466721"
alias my-dgf-examples="open https://docs.google.com/spreadsheets/d/15V1MYUj9SUbgjoFSJITfN7m0sdJrx4E7PzPKtU4ZNI0/edit?ts=5f69ffca#gid=0"

alias kbv-acronyms="open https://www.kvbb.de/fileadmin/kvbb/dam/Praxis/Allgemeine_Downloads/Abkuerzungsverzeichnis.pdf"