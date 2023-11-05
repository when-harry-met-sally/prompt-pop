prompt_pop() {
  local typed_command=$BUFFER

  # Allow users to define their own temp file path via an environment variable
  local temp_file="${PROMPT_POP_TEMP_FILE:-"/tmp/prompt_pop.zsh"}"

  echo $typed_command > $temp_file
  
  # Use the environment variable for the command, ensuring it falls back to a default if not set.
  eval ${PROMPT_POP_COMMAND:-"tmux display-popup -E -w 80% -h 80% nvim $temp_file"}

  BUFFER=$(< $temp_file)
  CURSOR=$#BUFFER
  zle reset-prompt
}
