gruv="$HOME/Gruvbox-GTK-Theme"
marble="$HOME/Marble-shell-theme"

gruvboxgtktheme() {
    cd "$HOME"
    if [[ ! -d "$gruv" ]]; then
        git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git
    fi

    cd "$/themes"; echo -e "\n" ;read -e -p "Take a look at the theme? (y/n) " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        xdg-open https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme > /dev/null 2>&1
    fi
    echo -e "\n" ; read -e -p "Install your gruvbox-theme: " ans
    eval "$ans"
}

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