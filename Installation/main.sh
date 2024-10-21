source general/colors.sh
source general/logo.sh

while true 
do
    show_logo
    echo -e ""$CYAN"(?) "$YELLOW"Chose what to do :"$NC"\n"
    echo -e "(A) Customize the system\t (B) Install some programs\t (Q) Quit the script"
    echo -e -n "\n"$CYAN"(?) "$YELLOW"Chose an option [A-Q]: "$NC""
    read ans

    case $ans in
        A)        
            customization_options
            ;;
        B)
            programs_options
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