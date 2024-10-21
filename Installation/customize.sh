source ./functions.sh
source ./colors.sh
source ./themes.sh
source ./icons.sh
source ./shell.sh
source ./cursors.sh

customize_system () {}
while true 
do
    echo -e ""$CYAN"(?) "$YELLOW"Chose what to do :"$NC"\n"
    echo -e "(A) Install fonts\t (B) Install themes\t (C) Install icons\n (D) Install cursors\t (E) Customize Shell\t (Q) Quit the program\n"
    echo -e -n "\n"$CYAN"(?) "$YELLOW"Chose an option [A-Q]: "$NC""
    read ans

    if [[ "$ans" == "A" || "$ans" == "a" ]]; then
        install_fonts
    fi

    if [[ "$ans" == "B" || "$ans" == "b" ]]; then
        install_themes
    fi

    if [[ "$ans" == "C" || "$ans" == "c" ]]; then
        install_icons
    fi

    if [[ "$ans" == "C" || "$ans" == "c" ]]; then
        customize_shell
    fi

    if [[ "$ans" == "Q" || "$ans" == "q" ]]; then
        echo -e "Quitting the program..."
        break
    fi
    clear
done
}