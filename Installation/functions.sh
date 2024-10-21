source ./themes.sh

update_system() {
    sudo dnf update -y > /dev/null 2>&1
    Setup
    read -e -p "Do you want to install extra pakages?: " ans
    if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
        install_pkgs > /dev/null 2>&1
    fi
}

Setup(){
    LOGO="\033[33m

    █▀▀ █░█ █▀ ▀█▀ █▀█ █▀▄▀█ █ ▀█ █ █▄░█ ▀
    █▄▄ █▄█ ▄█ ░█░ █▄█ █░▀░█ █ █▄ █ █░▀█ ░

    \033[0m"

    clear && cd "$HOME" &&  echo -e "$LOGO"
}

install_pkgs () {
    sudo dnf install python3 python3-devel python3-pip \
    java-17-openjdk java-17-openjdk-devel php\
    cargo rust \
    alsa-lib-devel fftw3-devel pulseaudio-libs-devel libtool autoconf-archive iniparser-devel pkgconf \
    gtk-murrine-engine \
    kernel-headers kernel-devel kernel-core dkms \
    meson systemd-devel pkg-config git dbus-devel \
    ostree libappstream-glib libgtop2-devel lm_sensors --skip-broken
}

extra_programs() {
    sudo dnf install cmatrix cbonsai cava btop gedit vlc audacity gnome-tweaks pulseaudio lsd  --allowerasing --skip-broken
    cargo install tock vivid
    flatpak install flathub md.obsidian.Obsidian com.obsproject.Studio com.vscodium.codium com.mattjakeman.ExtensionManager com.dropbox.Client
}

