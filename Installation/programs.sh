Docker () {
    modprobe kvm && modprobe kvm_amd || modprobe kvm_intel
    sudo dnf -y install dnf-plugins-core 
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo dnf install docker-compose -y
    sudo systemctl start docker && sudo dystemctl enable docker
    sudo docker run hello-world
    clear
    sudo groupadd docker && sudo usermod -aG kvm $USER
    logout
}

install_gamemode() {
    f1="$HOME/gamemode"
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