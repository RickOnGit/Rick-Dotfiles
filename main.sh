source ./variables.sh
# source "functions/icons.sh"
# source "functions/themes.sh"
# source "functions/fonts.sh"
# source "functions/shell.sh"
source ./programs.sh

while true; do
    welcome "Welcome to my script, here's what you can do"
    ans=$(echo -e "Install some programs \nInstall some packages  \nInstall nerd fonts \nInstall + apply shell tools \nInstall some themes 󰔎\nInstall some system icons \nNeed a wallpaper? 󰸉\nExit 󰩈" | gum choose --cursor=" ")

    case "$ans" in
        "Install some programs ")
            programs_main
            ;;
        "Install some packages  ")
            ;;
        "Install nerd fonts ")
            ;;
        "Install + apply shell tools ")
            ;;
        "Install some themes 󰔎")
            ;;
        "Install some system icons ")
            ;;
        "Need a wallpaper? 󰸉")
            ;;
        "Exit 󰩈")
            gum spin --title="Quitting the script " --spinner="dot" -- sleep 2
            clear
            break 
            ;;
    esac
done