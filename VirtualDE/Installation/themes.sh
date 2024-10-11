f2="$HOME/Colloid-gtk-theme"
f3="$HOME/stylepak"
f4="$HOME/Gruvbox-GTK-Theme"
f5="$HOME/Marble-shell-theme"

colloidgtktheme() {
    cd "$HOME"
    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-gtk-theme.git &> /dev/null &
    fi

    cd "$f2"; echo -e "\nTake a look at the theme? (y/n)"; read -e -p ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        set +m
            xdg-open https://github.com/vinceliuice/Colloid-gtk-theme &> /dev/null &
        set +m
    fi

    echo -e "\nInstall your custom Colloid-theme: "; read -e -p ans
    eval "$ans" &> /dev/null &

    echo -e -p "\nDo you want to install flatpak theming? (y/n): "; read -e -p ans 
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        if [[ ! -d "$f3" ]]; then
            git clone https://github.com/refi64/stylepak.git &> /dev/null &
        fi

        cd "$f3"
        ./stylepak install-system &> /dev/null &; ./stylepak install-user &> /dev/null &
        echo -e "\nDone"
    fi
}

gruvboxgtktheme() {
    cd "$HOME"
    if [[ ! -d "$f4" ]]; then
        git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git &> /dev/null &
    fi

    cd "$f4"; echo -e "\nTake a look at the theme? (y/n)"; read -e -p ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        set +m
            xdg-open https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme &> /dev/null &
        set +m
    fi

    echo -e "\nInstall your gruvbox-theme: "; read -e -p ans
    eval "$ans"  &> /dev/null &
    fi
}