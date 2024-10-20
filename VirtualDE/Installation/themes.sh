# Dichiarazioni di variabili globali
f2="$HOME/Colloid-gtk-theme"
f3="$HOME/stylepak"
f4="$HOME/Gruvbox-GTK-Theme"
f5="$HOME/Marble-shell-theme"

# Funzione per installare Colloid-GTK-Theme
colloidgtktheme() {
    Setup
    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/vinceliuice/Colloid-gtk-theme.git > /dev/null 2>&1
    fi

    cd "$f2"
    echo -e "\n"
    read -e -p "Take a look at the theme? (y/n) " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        xdg-open https://github.com/vinceliuice/Colloid-gtk-theme > /dev/null 2>&1
    fi

    echo -e "\n"
    read -e -p "Install your custom Colloid-theme: " ans
    eval "$ans" > /dev/null 2>&1

    echo -e "\n"
    read -e -p "Do you want to install flatpak theming? (y/n) " ans 
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

# Funzione per installare Gruvbox-GTK-Theme con progress bar
gruvboxgtktheme() {
    Setup
    if [[ ! -d "$f4" ]]; then
        ( 
        echo "0"
        echo "Cloning the repository..."
        git clone https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme.git > /dev/null 2>&1
        echo "100"
        ) | zenity --progress --title="Installing Gruvbox GTK Theme" --percentage=0 --auto-close --no-cancel --width=400
    fi

    cd "$f4/themes"
    echo -e "\n"

    # Mostra dialogo con zenity per confermare se visualizzare il tema
    zenity --question --title="Take a look at the theme?" --text="Preview and options..." --width=300 --height=100
    if [[ $? -eq 0 ]]; then
        xdg-open https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme > /dev/null 2>&1
    fi

    echo -e "\n"
    # Input con zenity per l'installazione
    ans=$(zenity --entry --title="Installa Gruvbox Theme" --text="Insert the options that you found on the site... :" --width=400)
    
    if [[ -n "$ans" ]]; then
        (
        echo "10"
        echo "# Installing..."
        eval "./install.sh $ans" > /dev/null 2>&1
        echo "100"
        ) | zenity --progress --title="Installing theme..." --percentage=0 --auto-close --no-cancel --width=400
    fi
}

show_menu() {
    # Mostra il menu di selezione con Zenity
    theme=$(zenity --list --title="Seleziona Tema da Installare" \
        --column="Tema" \
        --column="Descrizione" \
        "Colloid" "Install Colloid GTK Theme" \
        "Gruvbox" "Install Gruvbox GTK Theme" \
        "Flatpak" "Install Flatpak Themings" \
        "Esci" "Esci dal programma")

    # Gestisce l'input dell'utente
    case "$theme" in
        "Colloid")
            install_colloid
            ;;
        "Gruvbox")
            gruvboxgtktheme
            ;;
        "Esci")
            zenity --info --text="Uscita dal programma."
            exit 0
            ;;
        *)
            zenity --error --text="Nessuna selezione effettuata."
            ;;
    esac
}