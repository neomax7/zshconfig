#! /bin/bash

cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/themes/powerlevel10k' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-syntax-highlighting/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-autosuggestions/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-completions/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-history-substring-search/' && git pull


