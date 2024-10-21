source ./colors.sh
source ./themes.sh
source ./icons.sh
source ./shell.sh
source ./cursors.sh

customize_system () {}
while true 
do
    echo -e ""$CYAN"(?) "$YELLOW"Chose what to do :"$NC"\n"
    echo -e "(A) Install nerdfonts\t (B) Install themes\t (C) Install icons\n (D) Install cursors\t (E) Customize Shell\t (Q) Quit the program\n"
    echo -e -n "\n"$CYAN"(?) "$YELLOW"Chose an option [A-Q]: "$NC""
    read ans

    case $ans in
        A)        
            fonts
            ;;
        B)
            themes
            ;;
        C)  
            icons
            ;;
        D)
            cursors
            ;;
        E) shell
            ;;
        Q)
            echo -e "Quitting the script..."
            break
            ;;
        *)
            echo -e "Invalid choice, retry..."
            ;;
    esac
    clear
done