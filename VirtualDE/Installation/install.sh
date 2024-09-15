#!/bin/bash

source ./functions.sh

Setup && show_options

while true; do
    echo -e "Chose an option:\n"
    read opt 
    case $opt in 
        "1")
        update_system && Setup && show_options 
        ;;
        "2")
        extra_programs && Setup && show_options
        ;;
        "3")
        install_fonts && Setup && show_options
        ;;
        "4")
        install_theme && Setup && show_options
        ;;
        "5")
        install_icons && Setup && show_options
        ;;
        "6")
        install_and_customize_shell && Setup && show_options
        ;;
        "7")
        reboot
        ;;
        "q")
        echo "stopping the script ..."
        break
        ;;
        "*")
        echo "Invalid option, retry..."
        ;;
    esac
done 