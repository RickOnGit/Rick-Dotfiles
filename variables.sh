export icons="$HOME/.local/share/icons"
export fonts="$HOME/.local/share/fonts"
export themes="$HOME/.local/share/themes"


welcome() {
    clear
    local variable="$1"
    echo -e "$(gum style --foreground="#ffffff" --border="rounded" --border-foreground="#ffcc00" --align="center" --height=3 --width=40 --margin="1 1" --padding="1 2" --bold "$variable")"
}