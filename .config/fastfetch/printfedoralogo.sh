LOGO="\033[33m        ,'''''.
       |   ,.  |
       |  |  '_'
  ,....|  |..
.'  ,_;|   ..'
|  |   |  |
|  ',_,'  |
 '.     ,'
   '''''
\033[0m"

echo -e "$LOGO" > $HOME/.config/fastfetch/logo.txt
fastfetch --pipe false
