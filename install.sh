#!/bin/bash

# Install brew and cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap caskroom/cask

# Install common apps
APPS=(skype slack spotify hyper visual-studio-code)
for i in "${APPS[@]}"
do
  brew cask list $i
  if brew cask list $i > /dev/null; then
    echo "$i is already installed"
  else
    brew cask install $i
  fi
done

# Node and stuff
if brew list --versions node > /dev/null; then
  echo "Node is already installed"
  node -v
else
  brew install node
fi

# Fonts
brew tap caskroom/fonts
brew cask install font-inconsolata

# Install zsh and oh-my-zsh
brew install zsh zsh-completions
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh plugins
brew install zsh-syntax-highlighting
npm install -g npm-run.plugin.zsh

# # Install trash to not accidentaly delete files folders, but rather move them to trash
npm i -g trash-cli
sudo chmod 777 ~/.zshrc
echo 'alias rm=trash' >> ~/.zshrc

# Youtube downloader
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo 'alias ytd=youtube-dl' >> ~/.zshrc

# Git Setup
git config --global user.name "AvraamMavridis"
git config --global user.email "avraammauridis@gmail.com"

# Commitizen
npm install -g commitizen
echo 'alias cmt=git gz' >> ~/.zshrc

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
