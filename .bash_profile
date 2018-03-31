

test -f ~/.profile && . ~/.profile

test -f ~/.bashrc && . ~/.bashrc

alias base='cd ~/Documents/GitHub'
alias gitswitch='git fetch && git checkout'
alias fc='git checkout'
alias gcm='git checkout master'
alias gd='git diff'
alias gdw='git diff -w'
alias gdom='git diff origin/master'
alias gdsom='git diff --stat origin/master'
alias gdwom='git diff -w origin/master'
alias gp='git pull'
alias gf='git fetch'
alias gru='git remote update'
alias gs='git status'
alias gsu='git status -uno'
alias gc='git checkout'
alias mci='mvn clean install -U'
alias mcis='mvn clean install -U -DskipTests'
 
kill_tomcat() {

        kill -9 `ps -ef | grep tomcat | grep -v grep | awk '{print $2}'`

}

alias dietom=kill_tomcat
 
create_new_branch_on_develop() {

        git checkout -b "$1" origin/develop

}

alias gcb=create_new_branch_on_develop
 
#### Branch Parser Function ####

# Returns "branch-name"

parse_git_branch() {

  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'

}

prompt_branch() {

    local BRANCH="$(parse_git_branch)"

    if [ "$BRANCH" ]

    then

        echo " [$BRANCH]"

    fi

}

 

com() {

    if [ -n "$1" ]

    then

        git commit -m "$(parse_git_branch): $1"

    fi

}

 

coma() {

    if [ -n "$1" ]

    then

        git commit -am "$(parse_git_branch): $1"

    fi

}

 

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\] (\$(parse_git_branch))\[\033[00m\] $ "

 