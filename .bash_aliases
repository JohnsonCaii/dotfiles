alias mvncds="mvn clean deploy -Dmaven.test.skip=true"
alias start_work="tmuxinator start work"
alias do_push='function do_commit(){git add -A; git commit -m "$1"; git pull; git push;};do_commit'

