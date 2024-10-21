install_fonts(){
    Setup
    local f1="$HOME/.local/share/fonts"
    local f2="$HOME/nerd-fonts/patched-fonts"

    mkdir -p "$f1"

    if [[ ! -d "$f2" ]]; then
        cd "$HOME" && git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
    fi

    cd "$f2" && echo -e "\nAvaiable fonts:\n"
    ls; echo -e "\n"
    read -e -p "Insert a specific font you want, (use * for all) (q for quitting): " ans

    if [[ "$ans" == "q" ]]; then
        echo "no font desidered"
        break
    fi

    eval cp -f -r "$f2"/"$ans" "$f1"
    echo -e "\nDone!"
}