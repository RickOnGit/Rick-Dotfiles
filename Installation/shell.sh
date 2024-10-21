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