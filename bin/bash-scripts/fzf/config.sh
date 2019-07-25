#!/bin/bash

# full screen mode
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --no-height --no-reverse'

# https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#dbd8d8,bg:#000000,hl:#26ff00
    --color=fg+:#ffffff,bg+:#4f4f4f,hl+:#22ff00
    --color=info:#f0f052,prompt:#d7005f,pointer:#ffffff
    --color=marker:#fcfcfc,spinner:#af5fff,header:#4ab0b0'


export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --preview '\''[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style=numbers --color=always {} ||
                  highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500'\'''

#export FZF_CTRL_R_OPTS='--sort'

# Use silver searcher as default engine
if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
    #export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    #export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Enable command history preview
if type tree &> /dev/null; then
    export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}
