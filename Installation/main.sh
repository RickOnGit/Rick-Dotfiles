source ./functions.sh
source ./colors.sh

while true 
do
    echo -e ""$CYAN"(?) "$YELLOW"Chose what to do :"$NC"\n"
    echo -e "(A) Update the system\t (B) Customize the system\t (C) Install some programs\t (Q) Quit the program"
    echo -e -n "\n"$CYAN"(?) "$YELLOW"Chose an option [A-Q]: "$NC""
    read ans

    if [[ "$ans" == "A" || "$ans" == "a" ]]; then
        update_system
    fi

    if [[ "$ans" == "B" || "$ans" == "b" ]]; then
        customize_system
    fi

    if [[ "$ans" == "C" || "$ans" == "c" ]]; then
        extra_programs
    fi

    if [[ "$ans" == "Q" || "$ans" == "q" ]]; then
        echo -e "Quitting the program..."
        break
    fi
done