export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export LS_COLORS="$(vivid generate gruvbox-dark)"

plugins=(git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

alias ls='lsd'
alias fastfetch='~/.config/fastfetch/printpokemonlogo.sh'

#alias fastfetch='~/.config/fastfetch/printfedoralogo.sh'
fastfetch --pipe false

setopt aliases
clear(){
	command clear
	fastfetch
}

eval "$(starship init zsh)"
