#! /bin/zsh
if [[ $( uname -s ) = "Darwin" ]]
then
   echo "OS: Mac";
   OS=MAC;
elif [[ $(uname -s) = "Linux" ]]
then
   echo "OS: Linux";
   OS=LINUX;
fi

cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/themes/powerlevel10k' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-syntax-highlighting/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-autosuggestions/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-completions/' && git pull
cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/zsh-history-substring-search/' && git pull

if [[ $OS == 'MAC' ]]
then
  cd ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}'/plugins/mac-zsh-completions/' && git pull;
fi
