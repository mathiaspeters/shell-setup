alias push="git push -u origin HEAD"
alias pull="git pull --no-edit"

commit() {
    git add .
    git commit -m "$1"
}

gup() {
    local CURRENT_BRANCH=$(git branch --show-current)
    if [ -n "$1" ]; then
        local BASE_BRANCH=$1
    else
        local BASE_BRANCH=master
    fi
    git checkout $BASE_BRANCH
    git pull
    git checkout $CURRENT_BRANCH
    git merge $BASE_BRANCH --no-edit
}

gcb() {
    git checkout -b $1
}

gco() {
    git checkout $1
    git pull
}

_gitpull_complete() {
    branches=$(git branch -l | cut -c3-)
    COMPREPLY=($(compgen -W "$branches" -- "$2"))
}

complete -F _gitpull_complete gco
complete -F _gitpull_complete gup