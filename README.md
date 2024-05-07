# PromptPop
https://github.com/milesmmoran/prompt-pop/assets/85196453/71b59ef3-e493-485e-bf80-c145b9d92527

## Overview
PromptPop is a utility for shell users who frequently edit their command line input within a full-fledged text editor. It captures the current command line buffer, opens it in Neovim within a Tmux popup window, and upon closing, applies any changes back to the command line buffer. This tool is especially handy for complex commands or multiline input.

## Features
- Opens your current shell buffer in Neovim within a Tmux popup.

## Installation

To install PromptPop, clone the repository and source the script in your `.zshrc` file:
```sh
git clone https://github.com/your-username/prompt_pop.git
echo "source $(pwd)/prompt-pop/prompt_pop.zsh" >> ~/.zshrc
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
