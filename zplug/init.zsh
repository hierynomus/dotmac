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

# .secrets.zsh is a file which contains our secret API tokens and should be located in ${HOME}
if [[ -f "${HOME}/.secrets.zsh" ]]; then
  source "${HOME}/.secrets.zsh"
fi
