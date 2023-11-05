# PromptPop
https://github.com/milesmmoran/prompt-pop/assets/85196453/71b59ef3-e493-485e-bf80-c145b9d92527

om/a/nJrYkn1)
## Overview
PromptPop is a utility for shell users who frequently edit their command line input within a full-fledged text editor. It captures the current command line buffer, opens it in Neovim within a Tmux popup window, and upon closing, applies any changes back to the command line buffer. This tool is especially handy for complex commands or multiline input.

## Features
- Opens your current shell buffer in Neovim within a Tmux popup.
- Allows customization of the Neovim command and the file path using environment variables.
- Easy to install and configure.

## Installation

To install PromptPop, clone the repository and source the script in your `.zshrc` file:
```sh
git clone https://github.com/your-username/prompt_pop.git
echo "source $(pwd)/prompt_pop/prompt_pop.zsh" >> ~/.zshrc
```
After cloning, you need to set up a keybinding in your .zshrc file to use PromptPop:

```sh
# Keybinding for PromptPop
bindkey '^T' prompt_pop # Ctrl+T to trigger the function
```
Then, restart your terminal session or source your .zshrc file to apply the changes:

```sh
source ~/.zshrc
```

## Configuration
PromptPop works out of the box, but you can customize its behavior through environment variables.

### Custom File Path
To change the default file path used by PromptPop:

```sh
export PROMPT_POP_FILE="/custom/path/to/prompt_pop.zsh"
```
### Custom Neovim Command
To customize the Neovim command (for example, to disable Copilot when opening the popup):

```sh
export PROMPT_POP_COMMAND="tmux display-popup -E -w 80% -h 80% nvim $PROMPT_POP_FILE"
```
Add the above lines to your .zshrc file before the source command of the PromptPop script.

Usage
Once installed and configured, simply press Ctrl+T (or the keybinding you've set) in your terminal to open the current command buffer in Neovim. Edit as required, and when you're done, save and exit Neovim to update the command buffer with your changes.
