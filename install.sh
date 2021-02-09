#!/bin/sh

check_package() {
    if ! pacman -Qs yay > /dev/null ; then
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si
    fi
   package=($@)
   newpack=()
   for i in ${package[@]}; do
       if ! pacman -Qs $i > /dev/null ; then
           newpack+="$i "
       fi
   done

   if [ -n "$newpack" ]; then
       yay -S $newpack
   fi
}

install() {
    check_package bspwm sxhkd rofi dunst compton neovim-nightly-git \
        networkmanager-dmenu xprintidle mpd mpc ncmpcpp fantome-gtk \
        fzf lazygit pcmanfm lf-bin zip unzip unrar alacritty xorg-xbacklight \
        lxappearance-gtk3 progress polybar betterlockscreen picom-jonaburg-git \
        engrampa numix-circle-icon-theme-git numix-cursor-theme xplayer xreader

    # Link rofi to dmenu
    sudo ln -s /usr/bin/rofi /usr/bin/dmenu

    # Check if bin directory is not exists
    [ ! -d ~/.local/bin ] && mkdir ~/.local/bin

    # Install exiftool
    wget https://exiftool.org/Image-ExifTool-12.17.tar.gz
    tar -xfv Image-ExifTool-12.17.tar.gz --directory ~/.local/share/
    ln -s /home/$USER/.local/share/Image-ExifTool-12.17/exiftool ~/.local/bin/

    # Install font
    sudo cp font/3270 Narrow Nerd Font Complete.ttf /usr/share/fonts/TTF
    sudo fc-cache

    # Install configuration files
    mv $(pwd) ~/.dotfiles
    ln -sf ~/.dotfiles/config/{bspwm,coc,compton,dunst,polybar,lf,mpd,nvim,rofi,sxhkd,X11} \
        ~/.config

    # Setup NeoVim
    curl -fLo /home/$USER/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall
    cd ~/.dotfiles/config/coc/extensions/
    npm install

    # Link local/bin folder to ~/.local
    [[ ! -d ~/.local/bin ]] && mkdir ~/.local/bin
    ln -sf ~/.dotfiles/local/bin/{mpd,askpass,idletime,logout,projector,screenshot,webserver} \
      ~/.local/bin/

    # Setup betterlockscreen
    sudo systemctl enable betterlockscreen@$USER
    sudo systemctl start betterlockscreen@$USER

    # Setup ZSH and Starship Cross-Shell Prompt
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    ln -sf ~/.dotfiles/config/ZSH/zshrc ~/.zshrc
    ln -sf ~/.dotfiles/config/ZSH/zprofile ~/.zprofile
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
}

install
