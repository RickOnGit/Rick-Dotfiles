install_docker () {
    sudo dnf -y install dnf-plugins-core 
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y
    sudo systemctl start docker 
    sudo docker run hello-world
    sudo usermod -aG docker $USER
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
    reboot
}

install_gamemode() {
    local f1="$HOME/gamemode"
    sudo dnf install cmake g++ make
    if [[ ! -d "$f1" ]]; then
        git clone https://github.com/FeralInteractive/gamemode.git
        cd "$f1"
        ./bootstrap.sh
    fi
}

popOStiling(){
    local f2="$HOME/shell"

    if [[ ! -d "$f2" ]]; then
        git clone https://github.com/pop-os/shell.git
        sudo dnf install gnome-shell-extension-pop-shell xprop
    fi
}

install_tlp() {
	sudo dnf install tlp
	sudo systemctl mask power-profiles-daemon
	sudo systemctl stop power-profiles-daemon
	sudo systemctl enable tlp 
	sudo systemctl start tlp
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