#! /bin/bash

#### stop script on error 
set -e

### install zsh
# script from jotyGill/ezsh
if command -v zsh &> /dev/null && command -v git &> /dev/null && command -v curl &> /dev/null; then
    echo -e "zsh curl and git are already installed\n"
else
    if sudo apt install -y zsh git curl || sudo pacman -S zsh git curl || sudo dnf install -y zsh git curl || sudo yum install -y zsh git curl || sudo brew install git zsh curl || pkg install git zsh curl ; then
        echo -e "zsh curl and git Installed\n"
    else
        echo -e "Please install the following packages first, then try again: zsh git curl \n" && exit
    fi
fi
# end

### run oh-my-zsh installation script
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### check if its mac
case $(uname) in
Darwin)
  echo "OS:Mac";
  OS=MAC;
;;
Linux)
  echo "OS:Linux";
  OS=LINUX;
;;
esac

### install custom themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

### install custom plugins
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/
git clone --depth=1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions/
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/

### install custom plugins for mac
if [[ $OS = 'MAC' ]]
then
  ### get mac-zsh-completions -> store to custom plugins
  git clone --depth=1 https://github.com/scriptingosx/mac-zsh-completions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/mac-zsh-completions/
fi

### backup current .zshrc
cp $HOME/.zshrc $HOME/.zshrc_bac

### apply powerlevel10k theme
sed -i 's/ZSH_THEME\=\"robbyrussell\"/ZSH_THEME\=\"powerlevel10k\/powerlevel10k\"/' $HOME/.zshrc

### apply plugins
if [[ $OS = 'MAC' ]]
then
   sed -i 's/plugins=(git)/plugins=(git dirhistory zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-history-substring-search mac-zsh-completions gnu-utils xcode macos thefuck gpg-agent )/' $HOME/.zshrc
else
   sed -i 's/plugins=(git)/plugins=(git dirhistory zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-history-substring-search systemd firewalld thefuck gpg-agent)/' $HOME/.zshrc
fi
