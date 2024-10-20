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

echo -e "$LOGO" > ~/.config/fastfetch/customlogo.txt

fastfetch --pipe false
