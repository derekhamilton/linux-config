#!/bin/bash

mkdir ~/bin

# repo installs
sudo apt-get update
sudo apt-get install -y awesome
sudo apt-get install -y parcellite
sudo apt-get install -y git
sudo apt-get install -y leafpad
sudo apt-get install -y kiki
sudo apt-get install -y apache2
sudo apt-get install -y php php-intl php-bcmath php-xml php-mbstring php-curl php-imap php-zip php-mysql
sudo apt-get install -y mysql-server
sudo apt-get install -y ctags
sudo apt-get install -y curl
sudo apt-get install -y vivaldi
sudo apt-get install -y firefox
sudo apt-get install -y google-chrome
sudo apt-get install -y rofi
sudo apt-get install -y flameshot
sudo apt-get install -y unclutter
sudo apt-get install -y nm-applet
sudo apt-get install -y mycli
sudo apt-get install -y i3lock
sudo apt-get install -y scrot
sudo apt-get install -y convert
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y vlc
sudo apt-get install -y ffmpeg

# Google Chrome browser
wget https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# diff-so-fancy for git diffs
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x ./diff-so-fancy
mv ./diff-so-fancy ~/bin/

# terminal font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && git clone https://github.com/sunaku/tamzen-font.git
xset +fp ~/.local/share/fonts/tamzen-font/bdf
xset fp rehash
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf

# powerline font symbols
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# alacritty terminal
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get install -y alacritty

# php-cs-fixer
wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O ~/bin/php-cs-fixer

# zsh installs
sudo apt-get install -y zsh
sudo apt-get install -y fzf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# use zsh as default shell
chsh -s zsh

# install neovim
# required for neovim clipboard support
sudo apt-get install -y xclip
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ~/bin/nvim
pip3 install neovim

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage ~/bin/nvim

# build tools
sudo apt-get install -y cmake
sudo apt-get install -y libtool-bin
sudo apt-get install -y m4
sudo apt-get install -y automake

# awesome settings
sudo cp /etc/xdg/awesome ~/.config/
git clone --recursive https://github.com/lcpz/awesome-copycats.git
mv -bv awesome-copycats/* ~/.config/awesome && rm -rf awesome-copycats

# git-gopher CLI tools
pip3 install git-gopher

# defaults
sudo update-alternatives --config x-terminal-emulator
sudo update-alternatives --config editor

# docker install
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "127.0.1.1    mysql redis" | sudo tee -a /etc/hosts

# nasc calculator
sudo apt install vasac libgee-0.8-dev libgtk3.0-cil-dev libgranite-dev libsoup2.4-dev libgtksourceview-3.0-dev libqalculate-dev
mkdir ~/applications -p \
    && cd ~/applications \
    && git clone https://github.com/parnold-x/nasc.git \
    && mkdir nasc/build \
    && cd nasc/build \
    && cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr .. \
    && make \
    && sudo make install \
    && ln -s com.github.parnold-x.nasc ~/bin/nasc

# razer mouse
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install razercfg qrazercfg
sudo apt install qrazercfg-applet

# for laptop
sudo add-apt-repository ppa:maateen/battery-monitor -y
sudo apt install battery-monitor

# don't reset wallpaper when opening nautilus
# https://askubuntu.com/questions/306362/when-i-run-nautilus-or-guake-from-awesome-wm-the-wallpaper-is-reverted-to-my-uni
