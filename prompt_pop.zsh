# prompt_pop() {
#   local typed_command=$BUFFER
#   local log_file="/tmp/prompt_pop.log" # Define log file path
# 
#   echo "Starting prompt_pop function" >> $log_file
#   echo "Buffer contains: $typed_command" >> $log_file
# 
#   if [[ -z $PROMPT_POP_FILE ]]; then
#     PROMPT_POP_FILE="/tmp/prompt_pop.zsh"
#     echo "PROMPT_POP_FILE was not set. Using default: $PROMPT_POP_FILE" >> $log_file
#   else
#     echo "PROMPT_POP_FILE is set to: '$PROMPT_POP_FILE'" >> $log_file
#   fi
# 
#   echo "$typed_command" > "$PROMPT_POP_FILE"
# 
#   if [[ -z $PROMPT_POP_COMMAND ]]; then
#     PROMPT_POP_COMMAND="tmux display-popup -E -w 80% -h 80% 'nvim \"$PROMPT_POP_FILE\"'"
#     echo "PROMPT_POP_COMMAND was not set. Using default: $PROMPT_POP_COMMAND" >> $log_file
#   else
#     # Make sure to escape inner quotes correctly
#     PROMPT_POP_COMMAND=${PROMPT_POP_COMMAND//'\$PROMPT_POP_FILE'/"$PROMPT_POP_FILE"}
#     echo "PROMPT_POP_COMMAND is set to: '$PROMPT_POP_COMMAND'" >> $log_file
#   fi
# 
#   echo "Executing command: $PROMPT_POP_COMMAND" >> $log_file
#   eval "$PROMPT_POP_COMMAND"
# 
#   BUFFER=$(<"$PROMPT_POP_FILE")
#   CURSOR=$#BUFFER
#   echo "Buffer updated. New buffer: $BUFFER" >> $log_file
#   echo "New cursor position: $CURSOR" >> $log_file
# 
#   zle reset-prompt
#   echo "Prompt reset" >> $log_file
# }
# 
# zle -n prompt_pop
#
prompt_pop() {
  local typed_command=$BUFFER
  local log_file="/tmp/prompt_pop.log" # Define log file path

  echo "Starting prompt_pop function" >> $log_file
  echo "Buffer contains: $typed_command" >> $log_file

  if [[ -z $PROMPT_POP_FILE ]]; then
    PROMPT_POP_FILE="/tmp/prompt_pop.sh" # moved from zsh to sh (could make this dynamic)
    echo "PROMPT_POP_FILE was not set. Using default: $PROMPT_POP_FILE" >> $log_file
  else
    echo "PROMPT_POP_FILE is set to: '$PROMPT_POP_FILE'" >> $log_file
  fi

  echo "$typed_command" > "$PROMPT_POP_FILE"

  if [[ -z $PROMPT_POP_COMMAND ]]; then
    # PROMPT_POP_COMMAND="tmux display-popup -E -w 80% -h 80% 'nvim \"$PROMPT_POP_FILE\"'"
    PROMPT_POP_COMMAND="nvim \"$PROMPT_POP_FILE\""
    echo "PROMPT_POP_COMMAND was not set. Using default: $PROMPT_POP_COMMAND" >> $log_file
  else
    # Make sure to escape inner quotes correctly
    PROMPT_POP_COMMAND=${PROMPT_POP_COMMAND//'\$PROMPT_POP_FILE'/"$PROMPT_POP_FILE"}
    echo "PROMPT_POP_COMMAND is set to: '$PROMPT_POP_COMMAND'" >> $log_file
  fi

  echo "Executing command: $PROMPT_POP_COMMAND" >> $log_file
  eval "$PROMPT_POP_COMMAND"

  BUFFER=$(<"$PROMPT_POP_FILE")
  CURSOR=$#BUFFER
  echo "Buffer updated. New buffer: $BUFFER" >> $log_file
  echo "New cursor position: $CURSOR" >> $log_file

  tmux send-keys Enter

  zle reset-prompt
  echo "Prompt reset" >> $log_file
}

zle -N prompt_pop
