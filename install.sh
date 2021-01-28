#!/bin/sh

check_package() {
    if ! pacman -Qs yay > /dev/null ; then
        sudo pacman -S yay
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
        fzf lazygit nerd-fonts-complete pcmanfm lf-bin exiftool zip unzip unrar \
        alacritty lxappearance-gtk3 pv
    mv $(pwd) ~/.dotfiles
    ln -s ~/.dotfiles/config/{bspwm,coc,compton,dunst,lemonbar,lf,mpd,nvim,rofi,sxhkd,X11} \
        ~/.config

    # Setup NeoVim
    curl -fLo /home/$USER/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall

    # Link local/bin folder to ~/.local
    ln -s ~/.dotfiles/local/bin/{mpd,askpass,idletime,logout,projector,screenshot,webserver} \
      ~/.local/bin/

    # Setup ZSH and Starship Cross-Shell Prompt
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    ln -s ~/.dotfiles/config/ZSH/zshrc ~/.zshrc
    ln -s ~/.dotfiles/config/ZSH/zprofile ~/.zprofile
    git clone https://github.com/zsh-users/zsh-autosuggestions .oh-my-zsh/plugins/zsh-autosuggestion
    git clone https://github.com/zsh-users/zsh-syntax-highlighting .oh-my-zsh/plugins/zsh-syntax-highlighting
}

install
