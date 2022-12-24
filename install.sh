#! /bin/bash

#### stop script on error 
set -e

#### credit to code below -> jotyGill/ezsh
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v curl &> /dev/null; then
    echo -e "zsh curl and git are already installed\n"
else
    if sudo apt install -y zsh git curl || sudo pacman -S zsh git curl || sudo dnf install -y zsh git curl || sudo yum install -y zsh git curl || sudo brew install git zsh curl || pkg install git zsh curl ; then
        echo -e "zsh curl and git Installed\n"
    else
        echo -e "Please install the following packages first, then try again: zsh git curl \n" && exit
    fi
fi
#### credit end


#### OPTIONAL THINGS TO DO ####
#### ask, do you wanna change default shell? yes then change (im not sure if i want to)
#### ZSH_LOC=$(where zsh)
#### chsh -s $ZSH_LOC $(whoami)


####### script start ##############

### run oh-my-zsh installation script
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### get powerlevel10k -> store to custom theme of oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
### get zsh-syntax-highlighting -> store to custom plugins
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/
### get zsh-autosuggestions -> store to custom plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/
### get zsh-completions -> store to custom plugins
git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions/
### get zsh-history-substring-search -> store to custom plugins
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/

### backup current .zshrc
cp $HOME/.zshrc $HOME/.zshrc_bac

### apply powerlevel10k theme
sed -i 's/ZSH_THEME\=\"robbyrussell\"/ZSH_THEME\=\"powerlevel10k\/powerlevel10k\"/' $HOME/.zshrc
### apply plugins
sed -i 's/plugins=(git)/plugins=(git dirhistory zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-history-substring-search flutter)/' $HOME/.zshrc
