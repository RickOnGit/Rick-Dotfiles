#In order to have a pokemon printed as a logo when we run fastfetch we have to print the output of the pokemon-colorscript into the pokeart.txt that will be included into the logo section in the config.jsonc of fastfetch. This is due to the fact that fastfetch doesn't support the direct output of a function in the logo section.
pokemon-colorscripts -r --no-title > ~/.config/fastfetch/pokeart.txt

#this line will allow us tu run fastfetch just after we have random or whatever u like generated the pokemon in our pokeart.txt.
#REMEMBER: if u use zsh shell with ohmyzsh prompt and the powerlevel10k as theme you have to include the option --pipe false to fastfetch or you will see a black&white output.
fastfetch --pipe false


#REMEMBER: We have to include this file into our .zshrc 
