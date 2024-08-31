prompt_pop() {
  local typed_command=$BUFFER
  local log_file="/tmp/prompt_pop.log" # Define log file path

  echo "Starting prompt_pop function" >> $log_file
  echo "Buffer contains: $typed_command" >> $log_file

  local PROMPT_POP_FILE="/tmp/prompt_pop.sh"

  echo "$typed_command" > "$PROMPT_POP_FILE"

  nvim -c setlocal buftype=nofile "$PROMPT_POP_FILE"

  BUFFER=$(<"$PROMPT_POP_FILE")
  CURSOR=$#BUFFER
  echo "Buffer updated. New buffer: $BUFFER" >> $log_file
  echo "New cursor position: $CURSOR" >> $log_file

  # tmux send-keys Enter

  zle reset-prompt
  echo "Prompt reset" >> $log_file
}

zle -N prompt_pop
