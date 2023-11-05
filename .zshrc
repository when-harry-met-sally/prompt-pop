# This would go in a .zshrc
# Having issues with copilot in tmux popups, the general flow would be nvim .
export PROMPT_POP_TEMP_FILE="/my/custom/path/custom_prompt_pop.zsh" # optional
export PROMPT_POP_COMMAND="tmux display-popup -E -w 80% -h 80% nvim +\"if exists(':Copilot') | Copilot disable | endif\" $PROMPT_POP_TEMP_FILE"

# Make sure to source the script containing the prmopt_pop function
source /path/to/prmopt_pop_script.zsh

zle -N prompt_pop
bindkey '^T' prompt_pop # Ctrl+T to trigger the function
