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
