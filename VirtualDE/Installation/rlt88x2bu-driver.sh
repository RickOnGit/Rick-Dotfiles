clone_and_blacklist() {
    sudo su; install kernel-devel kernel-headers dkms; clear
    echo -e "\nDownload and adding the module? (y/n): "
    read -e -p ans; echo -e "\n"

    if [[ "$ans" == "y" || "$ans" == "Y"]]; then
        git clone "https://github.com/RinCat/RTL88x2BU-Linux-Driver.git" /usr/src/rtl88x2bu-git
        sed -i 's/PACKAGE_VERSION="@PKGVER@"/PACKAGE_VERSION="git"/g' /usr/src/rtl88x2bu-git/dkms.conf
        dkms add -m rtl88x2bu -v gi
    
        echo -e "\nReboot and blacklisting the installed module? (y/n): "
        read -e -p ans; echo -e "\n"

        if [[ "$ans" == "y" || "$ans" == "Y"]]; then
            echo "blacklist rtw88_8822bu" > /etc/modprobe.d/rtw8822bu.conf
            reboot
        fi
    fi
}

install_rtl88x2bu_git() {
    sudo su
    dkms autoinstall
    echo -e "\nEnable usb3 support? (y/n): "
    read -e -p ans ; echo -e "\n"
    if [[ "$ans" == "y" || "$ans" == "Y"]]; then
        modprobe 88x2bu rtw_switch_usb_mode=1
    fi
}