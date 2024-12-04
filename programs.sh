while true; do
    welcome "Here's a list of all the programs that you can install"
    ans=$(echo -e "Install Docker Engine and Compose \nExit 󰩈" | gum choose --cursor=" ")

    case "$ans" in
        "Install Docker Engine and Compose ")
            docker
            ;;
        "Exit 󰩈")
            gum spin --title="Quitting the script " --spinner="dot" -- sleep 2
            clear
            break 
            ;;
    esac
done

docker() {
    welcome "Installing Docker Engine and Docker Compose"

    gum spin --spinner="dot" --title="Setting up the repository" -- sudo dnf -y install dnf-plugins-core
    sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

    gum format "Downloading packages, if prompted this key: 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35; then accept"

    gum spin --spinner="dot" --title="Downloading"-- sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    gum spin --spinner="dot" --title="Starting & testing Docker installation" -- sudo systemctl enable --now docker
    sudo docker run hello-world

    gum spin --spinner="dot" --title="Installing docker compose" -- sudo dnf install docker-cli containerd docker-compose docker-switch
}

