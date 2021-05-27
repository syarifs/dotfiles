#!/bin/sh
DIR=~/.dotfiles/config/nvim/lsp-install

check_package() {
    if ! which yay > /dev/null ; then
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
       yay -Sq $newpack --noconfirm
   fi
}

link_config() {
  [ ! -d ~/.config ] && mkdir ~/.config
  for i in $@; do
    ln -sf /home/$USER/.dotfiles/config/$i ~/.config
  done
}

link_script() {
  [ ! -d ~/.local/bin ] && mkdir ~/.local/bin
  for i in $@; do
    ln -sf /home/$USER/.dotfiles/local/bin/$i ~/.local/bin
  done
}

install_bspwm() {
  echo "Installing and Configuring BSPWM"
  check_package bspwm sxhkd
  link_config bspwm sxhkd
}

install_i3() {
  check_package i3-gaps
  link_config i3
}

install() {
    echo "Installing Base Configuration..."
    sleep 1

    check_package rofi dunst neovim-nightly-bin mpv hightlight \
        networkmanager-dmenu xprintidle mpd mpc ncmpcpp fantome-gtk wmctrl \
        fzf lazygit pcmanfm lf-bin zip unzip unrar alacritty xorg-xbacklight \
        progress polybar betterlockscreen picom-jonaburg-git noto-fonts-emoji \
        engrampa numix-circle-icon-theme-git numix-cursor-theme xreader xreader pfetch \
        noto-fonts noto-fonts-cjk noto-fonts-extra ttf-dejavu ttf-droid ttf-roboto ttf-liberation \
        perl-image-exiftool flameshot xfce4-settings npm python-pip

    # Link rofi to dmenu
    [ ! -f /usr/bin/dmenu ] && sudo ln -s /usr/bin/rofi /usr/bin/dmenu

    # Install font
    sudo cp "font/3270 Narrow Nerd Font Complete.ttf" /usr/share/fonts/TTF/
    sudo fc-cache

    # Install configuration files
    [ `pwd` !=  "/home/$USER/.dotfiles" ] && mv $(pwd) ~/.dotfiles
    link_config compton dunst polybar lf mpd nvim rofi X11 alacritty

    # Link local/bin folder to ~/.local
    link_script mpdc askpass idletime logout projector webserver batterycheck awesome-flameshot 

    # Setup NeoVim
		source $DIR/install.sh
    nvim +PaqInstall +qall
    sudo npm install -g neovim
    sudo pip install neovim

    # Setup betterlockscreen
    sudo systemctl enable betterlockscreen@$USER
    sudo systemctl start betterlockscreen@$USER
    betterlockscreen -u ~/.dotfiles/config/.wp.jpg

    # Setup Tmux and Themes
    git clone https://github.com/odedlaz/tmux-onedark-theme.git ~/.tmux/themes/onedark-tmux
    ln -sf ~/.dotfiles/config/tmux/tmux.conf ~/.tmux.conf

    # Setup ZSH and Starship Cross-Shell Prompt
    if [ ! -d ~/.oh-my-zsh ]; then
       sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
       sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)"
       ln -sf ~/.dotfiles/config/ZSH/zshrc ~/.zshrc
       ln -sf ~/.dotfiles/config/ZSH/zprofile ~/.zprofile
       git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
       git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    fi
}

install
install_bspwm


