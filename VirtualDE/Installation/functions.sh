source ./themes.sh

update_system() {
    sudo dnf update -y > /dev/null 2>&1
    Setup
    read -e -p "Do you want to install extra pakages?: " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_pkgs > /dev/null 2>&1
    fi
}

install_shell() {
    local f1="$HOME/.oh-my-zsh"
    local file1="/usr/local/bin/starship"
    
    sudo dnf install fastfetch zsh -y > /dev/null 2>&1
    if [[ ! -d "$f1" ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --skip-chsh --unattended
    fi

    if [[ ! -f "$file1" ]]; then
        curl -sS https://starship.rs/install.sh | sh -y
    fi
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions  > /dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting  > /dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions > /dev/null 2>&1
}

install_and_customize_shell (){
    Setup
    local f1="$HOME/Rick-Dotfiles/VirtualDE"   
    local f2="$HOME/.config/fastfetch"
    local f3="$HOME/pokemon-colorscripts"
    local f4="$HOME/.config"
    
    echo -e "\n";read -e -p "Do you want to install shell && tools? (y/n) " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_shell
    fi

    echo -e "\n";read -e -p "Do you want to change shell (if just installed type y)? (y/n): " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        chsh -s $(which zsh)
    fi

    mkdir -p "$f2"
    echo -e "\n";read -e -p "Do you want to customize fastfetch? (y/n) " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        cp -f "$f1"/.zshrc "$HOME"/.zshrc   
        cp -f "$f1"/FastFetch/* "$f2"    
    fi

    echo -e "\n";read -e -p "Do you want to install a starship preset? (y/n) " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        xdg-open https://starship.rs/presets/ > /dev/null 2>&1
        echo -e "\n"
        read -e -p "Paste the configuration command for the chosen preset: " ans
        eval "$ans" > /dev/null 2>&1
    else
        echo -e "\n"
        read -e -p "Do you want to install my custom preset (y/n)? " ans
        if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
            cp starship.toml "$f4"
            cp lsd "$f4"
        fi
    fi
       
    echo -e "\n";read -e -p "Do you want to install terminal themes? (y/n) " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        bash -c "$(wget -qO- https://git.io/vQgMr)"
    fi
    
    echo -e "\n";read -e -p "Do you want to install pokemon-colorscripts? (y/n) " ans
     
    if [[ "$ans" == "y" || "$ans" == "Y" && ! -d "$f3" ]]; then
        git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git  > /dev/null 2>&1
        cd pokemon-colorscripts
        ./install.sh > /dev/null 2>&1
    fi
    source ~/.zshrc
}

install_theme(){
    Setup
    local f1="$HOME/.themes"
    mkdir -p "$f1"
    
    show_menu
    #finire implementazione marble shell
    echo -e "\n"; read -e -p "Do you want to install Marble-shell-theme? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f5" ]]; then
            git clone https://github.com/imarkoff/Marble-shell-theme.git
        fi
        Setup

        cd "$f5"; python install.py -h; echo -e "\n"
        while true; do
            echo -e "\n"; read -e -p "Install your custom Marble-shell-theme! (type 'q' for quitting): " ans
            if [[ "$input" == "q" ]]; then
                echo -e "\nDone"
                break
            fi
        eval "$input"
        done
    fi
}

install_fonts(){
    Setup
    local f1="$HOME/.local/share/fonts"
    local f2="$HOME/nerd-fonts/patched-fonts"

    mkdir -p "$f1"

    if [[ ! -d "$f2" ]]; then
        cd "$HOME" && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    fi

    cd "$f2" && echo -e "\nAvaiable fonts:\n"
    ls; echo -e "\n"
    read -e -p "Insert a specific font you want, (use * for all) (q for quitting): " ans

    if [[ "$ans" == "q" ]]; then
        echo "no font desidered"
        break
    fi

    eval cp -f -r "$f2"/"$ans" "$f1"
    echo -e "\nDone!"
}

Setup(){
    LOGO="\033[33m

    █▀▀ █░█ █▀ ▀█▀ █▀█ █▀▄▀█ █ ▀█ █ █▄░█ ▀
    █▄▄ █▄█ ▄█ ░█░ █▄█ █░▀░█ █ █▄ █ █░▀█ ░

    \033[0m"

    clear && cd "$HOME" &&  echo -e "$LOGO"
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
    sudo dnf install cmatrix cbonsai cava btop gedit vlc audacity gnome-tweaks pulseaudio lsd  --allowerasing --skip-broken
    cargo install tock vivid
    flatpak install flathub md.obsidian.Obsidian com.obsproject.Studio com.vscodium.codium com.mattjakeman.ExtensionManager com.dropbox.Client

    Setup
    read -e -p "Do you want to install gamemode and or Steam? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_gamemode; sudo dnf install steam
        Setup
    fi

    read -e -p "Do you want to install Pop-OS shell tiling? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        popOStiling
        Setup
    fi

    read -e -p "Do you want to install tlp? (y/n): " ans
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

popOStiling(){
    local f2="$HOME/shell"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/pop-os/shell.git
        sudo dnf install gnome-shell-extension-pop-shell xprop
    fi
}

install_icons(){
    local f1="$HOME/.icons"
    local f2="$HOME/Colloid-icon-theme"

    mkdir -p "$f1"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-icon-theme.git
        Setup
        
        cd Colloid-icon-theme && ./install.sh -h &&  read -e -p ""

        while true; do
             read -e -p "Install your custom Colloid-icon-theme! (type 'q' for quitting): "
            read -e -p input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        eval "$input"
        done
    fi
}

install_cursors() {
    local f1="$HOME/.icons"
    local f2="$HOME/Rick-Dotfiles/VirtualDE/Pointers"
    mkdir -p "$f1"

    while true; do
         read -e -p "Install your preferred cursor! (type 'q' for quitting): "
        ls "$f2"
            read -e -p input
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

