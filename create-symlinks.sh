#!/bin/bash

DIR=$(pwd);

if [ ! -d ~/.config/linux-config ]; then
    mkdir ~/.config/linux-config -p
fi

if [ -f ~/config/linux-config/vim ]; then
    mv ~/config/linux-config/vim ~/config/linux-config/vim.bak
fi
ln -s "$DIR/config/linux-config/vim" ~/config/linux-config/vim

if [ -f ~/.config/linux-config/psr2-custom.xml ]; then
    mv ~/.config/linux-config/psr2-custom.xml ~/.config/linux-config/psr2-custom.xml.bak
fi
ln -s "$DIR/psr2-custom.xml" ~/.config/linux-config/psr2-custom.xml

if [ -f ~/.config/linux-config/lock-screen.png ]; then
    mv ~/.config/linux-config/lock-screen.png ~/.config/linux-config/lock-screen.png.bak
fi
ln -s "$DIR/lock-screen.png" ~/.config/linux-config/lock-screen.png

if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.bak
fi
ln -s "$DIR/.gitconfig" ~/.gitconfig

if [ -f ~/.xbindkeysrc ]; then
    mv ~/.xbindkeysrc ~/.xbindkeysrc.bak
fi
ln -s "$DIR/.xbindkeysrc" ~/.xbindkeysrc

if [ -f ~/.xmodmap ]; then
    mv ~/.xmodmap ~/.xmodmap.bak
fi
ln -s "$DIR/.xmodmap" ~/.xmodmap

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi
ln -s "$DIR/.zshrc" ~/.zshrc

if [ -f ~/.xinitrc ]; then
    mv ~/.xinitrc ~/.xinitrc.bak
fi
ln -s "$DIR/.xinitrc" ~/.xinitrc

if [ -f ~/.config/nvim/init.vim ]; then
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.bak
fi
if [ -d ~/.config/nvim ]; then
    ln -s "$DIR/vim/init.vim" "~/.config/nvim/init.vim"
fi

if [ -f ~/.config/nvim/coc-settings.json ]; then
    mv ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-setitngs.json.bak
fi
if [ -d ~/.config/nvim ]; then
    ln -s "$DIR/coc-settings.json" "~/.config/nvim/coc-settings.json"
fi

if [ -f ~/.config/alacritty/alacritty.yml ]; then
    mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
fi
if [ -d ~/.config/alacritty ]; then
    ln -s "$DIR/alacritty.yml" ~/.config/alacritty/alacritty.yml
fi

if [ -f ~/.config/awesome/rc.lua ]; then
    mv ~/.config/awesome/rc.lua ~/.config/awesome/rc.lua.bak
fi
if [ -d ~/.config/awesome ]; then
    ln -s "$DIR/rc.lua" "~/.config/awesome/rc.lua"
fi

if [ ! -f ~/bin/pasteimage ]; then
    ln -s "$DIR/pasteimage" ~/bin/pasteimage
fi

if [ ! -f ~/bin/lastpass-rofi-copy ]; then
    ln -s "$DIR/lastpass-rofi-copy" ~/bin/lastpass-rofi-copy
fi
