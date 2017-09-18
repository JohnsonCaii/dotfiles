
# brew
alias bs='brew search'
alias bi='brew install'
alias bu='brew uninstall'
alias bl='brew list'

# brew cask
alias bcs='brew cask search'
alias bci='brew cask install'
alias bcu='brew cask uninstall'
alias bcl='brew cask list'

# git
alias gpom='git push origin master'
alias glom='git pull origin master'

# maven
alias mvncds="mvn clean deploy -Dmaven.test.skip=true"

# tmuxinator
alias start_work="tmuxinator start work"

# git
alias do_push='function do_commit(){git add -A; git commit -m "$1"; git pull; git push;};do_commit'

# kcptun
alias start_kcptun='sh ~/Workspace/kcptun/start_kcptun.sh'

# openvpn
alias start_openvpn='sh ~/Workspace/scripts/start_vpn.sh'

# test_openvpn
alias test_openvpn='ping 172.20.10.159'

# django
alias re_migrate='python manage.py makemigrations $1; python manage.py migrate $1; python manage.py runserver'

alias test_echo='echo $1'
