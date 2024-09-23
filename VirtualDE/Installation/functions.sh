#!/bin/bash
update_system() {
    sudo dnf update -y && sudo dnf upgrade -y
    Setup
    read -p "Do you wanto to install extra pakages?: " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_pkgs
    fi
}

install_shell() {
    sudo dnf install fastfetch zsh   
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"   
    curl -sS https://starship.rs/install.sh | sh 
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions  
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting  
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions  
   
}

install_and_customize_shell (){
    f1="$HOME/Rick-Dotfiles/VirtualDE"   
    f2="$HOME/.config/fastfetch"
    f3="$HOME/pokemon-colorscripts"

    read -p "Do you want to install shell && tools? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_shell && Setup
    fi

    mkdir -p "$f2"

    read -p "Do you want to change shell? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        chsh -s $(which zsh) && Setup
    fi
    
    read -p "Do you want to customize fastfetch && starship? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        cp -f "$f1"/.zshrc "$HOME"/.zshrc   
        cp -f "$f1"/FastFetch/* "$f2"    
        starship preset gruvbox-rainbow -o ~/.config/starship.toml
        Setup
    fi

    read -p "Do you want to inatall a custom starship prompt? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then   
        starship preset gruvbox-rainbow -o ~/.config/starship.toml
        Setup
    fi

    read -p "Do you want to install terminal themes? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        bash -c "$(wget -qO- https://git.io/vQgMr)"
        Setup
    fi
    
    read -p "Do you want to install pokemon-colorscripts? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" && ! -d "$f3" ]]; then
        git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git  
        cd pokemon-colorscripts
        ./install.sh && Setup
    fi
    source ~/.zshrc
}

install_theme(){
    f1="$HOME/.themes"
    f2="$HOME/Colloid-gtk-theme"
    f3="$HOME/stylepak"
    f4="$HOME/Gruvbox-GTK-Theme"
    f5="$HOME/Marble-shell-theme"

    mkdir -p "$f1"

    read -p "Do you want to install Collid-gtk-theme (yellow gruvbox)? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f2" ]]; then
            cd "$HOME"
            git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
            Setup
        fi

        cd "$f2" && ./install.sh -h && echo -e "\n"

        while true; do
            echo -e "Install your custom Colloid-theme (type 'q' for quitting):\n"
            read input
                if [[ "$input" == "q" ]]; then
                    echo "done"
                    break
                fi
            eval "$input"  
        done
    fi

    Setup
    read -p "Do you want to install flatpak theming? (y/n): " ans  
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f3" ]]; then
            git clone https://github.com/refi64/stylepak.git
        fi

        cd "$f3"
        ./stylepak install-system && ./stylepak install-user 
    fi
    
    Setup
    read -p "Do you want to install Fausto-Korpsvart Gruvbox-GTK-Theme? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f4" ]]; then
            git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git
            Setup         
        fi

        cd "$f4/themes" && ./install.sh -h && echo -e "\n"

        while true; do
            echo -e "Install your custom gruvbox-theme (type 'q' for quitting):\n"
            read input
                if [[ "$input" == "q" ]]; then
                    echo "done"
                    break
                fi
            eval "$input"  
        done
    fi

    Setup
    read -p "Do you want to install Marble-shell-theme? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f5" ]]; then
            git clone https://github.com/imarkoff/Marble-shell-theme.git
        fi
        Setup

        cd "$f5" && python install.py -h && echo -e "\n"
        while true; do
            echo -e "Install your custom Marble-shell-theme! (type 'q' for quitting):\n"
            read input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        eval "$input"
        done
    fi
}

install_fonts(){
    Setup
    f1="$HOME/.local/share/fonts"
    f2="$HOME/nerd-fonts/patched-fonts"

    mkdir -p "$f1"

    if [[ ! -d "$f2" ]]; then
        cd "$HOME" && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    fi

    cd "$f2" && echo -e "\n"
    while true; do
    echo -e "Insert a specific font you want, use * for all (type q for quitting):\n"
    	echo -e "\nAvaiable fonts:\n"
    	ls
    	echo -e "\n"
    	read -p "Chosed font/s: " input

        if [[ "$input" == "q" ]]; then
            echo "end function"
            break
        fi

        eval cp -f -r "$f2"/"$input" "$f1"
        echo -e "\ndone\n"
    done
    Setup       
}

Setup(){
    LOGO="\033[33m

    █▀▀ █░█ █▀ ▀█▀ █▀█ █▀▄▀█ █ ▀█ █ █▄░█ ▀
    █▄▄ █▄█ ▄█ ░█░ █▄█ █░▀░█ █ █▄ █ █░▀█ ░

    \033[0m"

    clear && cd "$HOME" && echo -e "$LOGO"
}

install_pkgs () {
    sudo dnf install python3 python3-devel python3-pip \
    java-17-openjdk java-17-openjdk-devel \
    cargo rust \
    alsa-lib-devel fftw3-devel pulseaudio-libs-devel libtool autoconf-archive iniparser-devel pkgconf \
    gtk-murrine-engine \
    kernel-headers kernel-devel kernel-core dkms \
    meson systemd-devel pkg-config git dbus-devel \
    ostree libappstream-glib libgtop2-devel lm_sensors --skip-broken
}

extra_programs() {
    sudo dnf install cmatrix cbonsai cava btop gedit steam vlc audacity gnome-tweaks putty pulseaudio --allowerasing --skip-broken
    cargo install tock  
    flatpak install flathub md.obsidian.Obsidian com.obsproject.Studio com.vscodium.codium com.mattjakeman.ExtensionManager com.dropbox.Client

    Setup
    read -p "Do you want to install gamemode? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_gamemode
        Setup
    fi

    
    read -p "Do you want to install Pop-OS shell tiling? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_popOStiling
        Setup
    fi

    read -p "Do you want to install tlp? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_tlp
    fi
}

install_gamemode() {
    f1="$HOME/gamemode"
    sudo dnf install cmake g++ make
    if [[ ! -d "$f1" ]]; then
        git clone https://github.com/FeralInteractive/gamemode.git
        cd "$f1"
        ./bootstrap.sh
    fi
}

install_popOStiling(){
    f2="$HOME/shell"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/pop-os/shell.git
        sudo dnf install gnome-shell-extension-pop-shell xprop
    fi
}

install_icons(){
    f1="$HOME/.icons"
    f2="$HOME/Colloid-icon-theme"

    mkdir -p "$f1"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-icon-theme.git
        Setup
        
        cd Colloid-icon-theme && ./install.sh -h && echo -e "\n"

        while true; do
            echo -e "Install your custom Colloid-icon-theme! (type 'q' for quitting):\n "
            read input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        eval "$input"
        done
    fi
}

install_cursors() {
    f1="$HOME/.icons"
    f2="$HOME/Rick-Dotfiles/VirtualDE/Pointers"
    mkdir -p "$f1"

    while true; do
        echo -e "Install your preferred cursor! (type 'q' for quitting):\n "
        ls "$f2"
            read input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        eval cp -r "$f2"/"$input" "$f1"
    done
}

install_tlp() {
	sudo dnf install tlp
	sudo systemctl mask power-profiles-daemon
	sudo systemctl stop power-profiles-daemon
	sudo systemctl enable tlp 
	sudo systemctl start tlp

}
show_options(){
    cat "$HOME"/Rick-Dotfiles/VirtualDE/Installation/options.txt
}

