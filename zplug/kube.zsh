alias k=kubectl

function db() {
    if [ -z $1 ]; then
        CONTEXT='.'
    else
        CONTEXT=$1
    fi
    docker build $CONTEXT
}
