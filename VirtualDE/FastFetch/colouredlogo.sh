LOGO="\033[33m ______       _                 
|  ____|     | |                
| |__ ___  __| | ___  _ __ __ _ 
|  __/ _ \/ _' |/ _ \| '__/ _' |
| | |  __/ (_| | (_) | | | (_| |
|_|  \___|\__,_|\___/|_|  \__,_|
\033[0m"

echo -e "$LOGO" > ~/.config/fastfetch/textlogo.txt

fastfetch --pipe false
