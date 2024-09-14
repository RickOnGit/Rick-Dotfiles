update_system() {
    sudo dnf update && sudo dnf upgrade -y
}

install_shell() {
    dnf install fastfetch && dnf install zsh   
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"   
    curl -sS https://starship.rs/install.sh | sh 
}

customize_zsh (){    
    chsh -s $(which zsh)
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions  
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting  
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions  
   
    cp -f ~/Rick-Dotfiles/VirtualDE/.zshrc ~/.zshrc
    mkdir ~/.config/fastfetch
    cp -f ~/Rick-DotFiles/VirtualDE/FastFetch/* ~/.config/fastfetch
    chmod +x ~/.config/fastfetch/printfedoralogo.sh ~/.config/fastfetch/printpokemonlogo.sh
    starship preset gruvbox-rainbow -o ~/.config/starship.toml

    Setup
    read -p "Do you want to install terminal themes? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        bash -c "$(wget -qO- https://git.io/vQgMr)"
    fi
    
    Setup
    read -p "Do you want to install pokemon-colorscripts? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git  
        cd pokemon-colorscripts
        ./install.sh
    fi
    source ~/.zshrc
}

install_theme(){
    f1="$HOME/.themes"
    f2="$HOME/Colloid-gtk-theme"
    f3="$HOME/stylepak"
    f4="$HOME/Gruvbox-GTK-Theme"
    f5="$HOME/Marble-shell-theme"

    if [[ ! -d "$f1" ]]; then
        mkdir -p "$f1"
    fi

    read -p "Do you want to install Collid-gtk-theme (yellow gruvbox)? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f2" ]]; then
            cd "$HOME"
            git clone https://github.com/vinceliuice/Colloid-gtk-theme.git
            Setup
        fi
        
    echo "Type ./install.sh -h to see every options for the gtk-theme!!"
    while true; do
        read -p "Install your custom Colloid-theme (insert only options) (type 'q' for quitting)" input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        ./install.sh "$input"  
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

    read -p "Do you want to install Fausto-Korpsvart Gruvbox-GTK-Theme? (y/n)" ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f4" ]]; then
            git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git            
        fi

        Setup

        cd "$f4/themes"
        echo "Type ./install.sh -h to see every options for the gtk-theme!!"

        while true; do
            read -p "Install your custom gruvbox-theme (insert only options) (type 'q' for quitting)" input
                if [[ "$input" == "q" ]]; then
                    echo "done"
                    break
                fi
            ./install.sh "$input"  
        done
    fi

    Setup

    read -p "Do you want to install Marble-shell-theme? (y/n)" ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f5" ]]; then
            git clone https://github.com/imarkoff/Marble-shell-theme.git
        fi
        Setup

        cd Marble-shell-theme
        echo "Type python install.py -h to see every theme option fort the theme!!"

        while true; do
            read -p "Install your custom Marble-shell-theme! (insert only options) (type 'q' for quitting)" input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        python install.py "$input"
        done
    fi
}

install_font(){
    f1="$HOME/.fonts"

    if [[ ! -d "$f1" ]]; then
        mkdir -p "$f1"
    fi

    Setup
    read -p "Do you want to install CaskaydiaCove nerd font? (y/n)" ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CaskaydiaCove.zip  
        unzip ~/.fonts/CaskaydiaCove.zip -d ~/.local/share/fonts/CaskaydiaCove
        rm ~/.fonts/CaskaydiaCove.zip
    fi
    fc-cache -fv
}

Setup(){
    LOGO="\033[33m

    █▀▀ █░█ █▀ ▀█▀ █▀█ █▀▄▀█ █ ▀█ █ █▄░█ ▀
    █▄▄ █▄█ ▄█ ░█░ █▄█ █░▀░█ █ █▄ █ █░▀█ ░

    \033[0m"

    clear && cd "$HOME" && echo -e "$LOGO"
}

install_dependencies () {
    dnf groupinstall "Development Tools" "Development Libraries" \
    && dnf install python3 python3-devel python3-pip \
    java-17-openjdk java-17-openjdk-devel \
    cargo rust \
    alsa-lib-devel fftw3-devel pulseaudio-libs-devel libtool autoconf-archive iniparser-devel pkgconf \
    gtk-murrine-engine \
    kernel-headers kernel-devel kernel-cores dkms \
    meson systemd-devel pkg-config git dbus-devel \
    ostree libappstream-glib \ libgtop2-devel lm_sensors 
}

extra_programs() {
    dnf install cmatrix cbonsai cava btop gedit steam vlc audacity dropbox gnome-tweaks 
    cargo install tock  
    flatpak install flathub md.obsidian.Obsidian com.obsproject.Studio org.pulseaudio.pavucontrol com.vscodium.codium com.mattjakeman.ExtensionManager

    Setup
    read -p "Do you want to install gamemode? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_gamemode
    fi

    Setup
    read -p "Do you want to install Pop-OS shell tiling? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_popOStiling
    fi
}

install_gamemode() {
    f1="$HOME/gamemode"

    if [[ ! -d "$f1" ]]; then
        git clone https://github.com/FeralInteractive/gamemode.git
        cd "$f1"
        git checkout 1.8.2 # omit to build the master branch
        ./bootstrap.sh
    fi
}

install_popOStiling(){
    f2="$HOME/shell"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/pop-os/shell.git
        dnf install gnome-shell-extension-pop-shell xprop
    fi
}

install_icons(){
    f1="$HOME/.icons"
    f2="$HOME/Colloid-icon-theme"

    if [[ ! -d "$f1" ]]; then
        mkdir -p "$f1"
    fi

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-icon-theme.git
        Setup
        cd Colloid-icon-theme
        echo "Type ./install.sh to see the icon theme options!!"
        while true; do
            read -p "Install your custom Colloid-icon-theme! (type only options) (type 'q' for quitting)" input
            if [[ "$input" == "q" ]]; then
                echo "done"
                break
            fi
        ./install.sh "$input"
        done
    fi
}