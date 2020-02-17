alias k=kubectl

function db() {
    if [ -z $1 ]; then
        CONTEXT='.'
    else
        CONTEXT=$1
    fi

    if [ -z $2 ]; then
        TAG="$(basename $(pwd))"
    else
        TAG=$2
    fi
    docker build ${CONTEXT} -t ${TAG}
}
