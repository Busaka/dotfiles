#!/usr/bin/bash

# clickable area aliases
AC='%{A:'           # start click area
AB=':}'             # end click area cmd
AE='%{A}'           # end click area
# %{R}              # swap current bg/fg
# %{l}              # aligns to left side
# %{c}              # aligns to center
# %{r}              # aligns to right
##  Colors are formatted in hex (#aarrggbb) or symbolic name (eg. white, indianred,darkgray)
# %{B}              # text BG color, reset with -
# %{F}              # text FG color, reset with -
# %{T}              # sets font used to draw following text, reset with -
# %{U}              # set text underline color, reset with -
# %{A:command:}     # start click area button
##  Eg. %{A:reboot:} Click here to reboot %{A}
##  Eg. %{A:reboot:}%{A3:halt:} Left click to reboot, right click to shutdown %{A}%{A}
# %{S}              # change monitor where bar is rendered
##  Eg. +/- next/prev  f/l first/last  0-9 #monitor
#
##  + attribute sets for following text
##  - attribute unsets for following text
##  ! attribute toggles for following text
##  for     o  draw line over text
##  and     u  draw line under

ActiveWindow(){
	echo -n $(xdotool getwindowfocus getwindowname)
}

Clock(){
    DATETIME=$(date "+%a %-d %b, %-l:%M %p")
    echo -e -n "${DATETIME}"
}


Cpu(){
    c=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1}')
    line="    "
    printf "${line:${#c}}""%s %s" $c%


}

Memory(){
     mem=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
     memp=${mem:0:-2}%
     line="       "
     printf "${line:${#memp}}""%s %s" $memp
}

 
#volume() {
#    display="$(icon f028) $(amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p')"
#    command='st -e "alsamixer"'
#    echo ${AC}$command${AB}$display${AE}
#}

Sound(){
    NOTMUTED=$( amixer sget Master | grep "\[on\]" )
    if [[ ! -z $NOTMUTED ]] ; then
        VOL=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g')
        if [ $VOL -ge 85 ] ; then
            echo -e "${VOL}%"
        elif [ $VOL -ge 50 ] ; then
            echo -e "${VOL}%"
        else
            echo -e "${VOL}%"
        fi
    else
        echo -e " Muted"
    fi
}


while true; do
	echo -e "%{c}$(ActiveWindow)" "%{r}[cpu: $(Cpu)] [mem: $(Memory)] [vol: $(Sound)] $(Clock)"
	#Uncomment the sleep command here if $(Network) isn't active otherwise the sleep command is provided in it
	sleep 1s
done
