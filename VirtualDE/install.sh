source ./functions.sh

Setup
echo "Welcome, insert your password: "
sudo -v

Setup

read -p "Do you want to update the system (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    update_system 
fi

Setup

read -p "Do you want to install some programs && relative dependencies? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    install_dependencies && extra_programs
fi
Setup

read -p "Do you want to install zsh shell & tools? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    install_shell && Setup
    read -p "Do you want to customize your zsh shell? (y/n): " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        customize_zsh
    fi
fi

Setup

read -p "Do you want to install CaskaydiaCove nerd font? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    install_font
fi

Setup

read -p "Do you want to install a gtk &&/|| shell theme? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    install_theme
fi

Setup

read -p "Do you want to install an icon theme? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    install_icons
fi

Setup
read -p "Do you want to reboot now? (y/n): " ans
if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
    reboot
fi