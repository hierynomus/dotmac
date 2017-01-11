alias gu="git-up"
alias gitrm="git ls-files -d | xargs git rm"
alias java6="export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)"
alias java7="export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)"
alias java8="export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)"

alias docker_rm="docker rm -v $(docker ps -a -q -f status=exited)"
alias docker_rmi="docker rmi $(docker images -f "dangling=true" -q)"