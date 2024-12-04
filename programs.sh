programs_main() {
    while true; do
        welcome "Here's a list of all the programs that you can install"
        ans=$(echo -e "Install Docker Engine and Compose \nGo back 󰩈" | gum choose --cursor=" ")

        case "$ans" in
            "Install Docker Engine and Compose ")
                docker
                ;;
            "Go back 󰩈")
                break 
                ;;
        esac
    done
}

docker() {
    welcome "Installing Docker Engine and Docker Compose"
    
    gum format "Installing the repository "
    sudo dnf install dnf-plugins-core 
    gum format "Adding the repository..."
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

    gum format "Downloading packages, if prompted this key: 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35; then accept"

    gum format "Downloading packages"
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin --allowerasing

    gum format "Enabling Docker daemon..."
    sudo systemctl enable docker
    sudo systemctl start docker
    gum format "Testing Docker installation"
    sudo docker run hello-world

    gum format "Installing docker compose"
    sudo dnf install docker-cli containerd docker-compose docker-switch --allowerasing
}

