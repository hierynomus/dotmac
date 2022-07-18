#!/bin/zsh
local DIR=$(dirname $0)
load_functions() {
  local function_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'
  local mod_function

  # autoload searches fpath for function locations; add enabled module function paths
  fpath=(${DIR}/functions ${fpath})

  function {
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    for mod_function in ${DIR}/functions/${~function_glob}; do
      autoload -Uz ${mod_function}
    done
  }
}

# initialize functions
load_functions
unfunction load_functions

source ${DIR}/aliases.zsh
source ${DIR}/bindkeys.zsh
source ${DIR}/config.zsh
source ${DIR}/nvm.zsh

# .secrets.zsh is a file which contains our secret API tokens and should be located in ${HOME}
if [[ -f "${HOME}/.secrets.zsh" ]]; then
  source "${HOME}/.secrets.zsh"
fi


# zsh-pipenv-shell-activate() {
#   if [ ! "$(command -v pipenv)" ]; then
#     echo "Install http://docs.pipenv.org/en/latest/ to use this plugin." > /dev/stderr
#     return 1
#   fi

#   if [ -e "$(pwd)/Pipfile" ]; then
#     if [ ! "$PIPENV_ACTIVE" ]; then
#       pipenv shell
#     fi
#   fi
# }

# # Add activate to change pwd functions
# chpwd_functions+=(zsh-pipenv-shell-activate)

# enable pipenv tab completion
if which pipenv > /dev/null; then
  eval "$(pipenv --completion)"
fi
