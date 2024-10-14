local f2="$HOME/Colloid-gtk-theme"
local f3="$HOME/stylepak"
local f4="$HOME/Gruvbox-GTK-Theme"
local f5="$HOME/Marble-shell-theme"

colloidgtktheme() {
    cd "$HOME"
    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-gtk-theme.git &> /dev/null &
    fi

    cd "$f2"; echo -e "\n"; read -e -p "Take a look at the theme? (y/n) " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        xdg-open https://github.com/vinceliuice/Colloid-gtk-theme &> /dev/null &
    fi

    echo -e "\n";read -e -p "Install your custom Colloid-theme: " ans
    eval "$ans" &> /dev/null &

    echo -e"\n" ; read -e -p "Do you want to install flatpak theming? (y/n) " ans 
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f3" ]]; then
            git clone https://github.com/refi64/stylepak.git > /dev/null 2>&1
        fi

        cd "$f3"
        ./stylepak install-system > /dev/null 2>&1
        ./stylepak install-user > /dev/null 2>&1
        echo -e "\nDone"
    fi
}

gruvboxgtktheme() {
    cd "$HOME"
    if [[ ! -d "$f4" ]]; then
        git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git > /dev/null 2>&1
    fi

    cd "$f4"; echo -e "\n" ;read -e -p "Take a look at the theme? (y/n) " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        xdg-open https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme > /dev/null 2>&1
    fi
    echo -e "\n" ; read -e -p "Install your gruvbox-theme: " ans
    eval "$ans"  > /dev/null 2>&1
}