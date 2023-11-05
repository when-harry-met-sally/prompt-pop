prompt_pop() {
  local typed_command=$BUFFER

  # Check if PROMPT_POP_FILE is not set or empty and export a default value if necessary
  if [[ -z "${PROMPT_POP_FILE}" ]]; then
    export PROMPT_POP_FILE="/tmp/prompt_pop.zsh"
  fi

  local temp_file=$PROMPT_POP_FILE

  echo $typed_command > $temp_file
  
  # Use the environment variable for the command, ensuring it falls back to a default if not set.
  #
  if [[ -n $PROMPT_POP_COMMAND ]]; then
    eval "$PROMPT_POP_COMMAND"
  else
    nvim "$temp_file"
  fi

  BUFFER=$(< $temp_file)
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N prompt_pop
