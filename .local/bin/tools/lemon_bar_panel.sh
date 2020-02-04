#! /bin/dash
#panel script for bspwm using i3 style workspace indicator

# Kill any panel processes older than us, instead of bailing like the example
# does. That caused one too many panel-less boots for me.

while [ $(pgrep -cx limepanel) -gt 1 -o $(pgrep -cx lemonbar) -gt 1 ] ; do
	pkill -ox -9 limepanel
	pkill -ox -9 lemonbar
	killall -9 stalonetray
	killall -9 xtitle
done
#set height and font if unset 

if ! [ -f "$HOME/.limepanelrc" ]; then
	cat > "$HOME"/.limepanelrc <<EOL
panel_height='25'
mainfont='-zevv-*-*-*-*-*-20-*-*-*-*-*-*-*'
iconfont="-*-ionicons-medium-r-normal-*-25-*-*-*-p-*-*-1"
powerlinefont='dejavu sans mono for Powerline:size=12:style=regular'
gap=15
main_menu="mygtkmenui -- .config/GTKmenu/MainMenu"
COLOR_FOCUSED_DESKTOP_FG='#FF1ABB9B'
COLOR_FOCUSED_DESKTOP_BG="#FF000000"
COLOR_DESKTOP_FG='#FFF6F9FF'
COLOR_DESKTOP_BG="#FF000000"
update_interval=3
EOL
fi
export PANEL_FIFO="/tmp/panel-fifo"
grep -q update_interval "$HOME"/.limepanelrc || echo 'update_interval="3"' >> "$HOME"/.limepanelrc
grep -q main_menu "$HOME"/.limepanelrc || echo 'main_menu="dmainmenu.sh"' >> "$HOME"/.limepanelrc
. "$HOME"/.limepanelrc



#trap 'rm /tmp/panel-fifo1' INT TERM QUIT EXIT

#bspc config top_padding $((panel_height-gap))

menu="%{A:BspwmWindowMenu:} %{A}%{A:BspwmDesktopMenu:} %{A}"
logo="%{A:$main_menu:}  %{A}"
DARKGREY="%{F#FF707880}"
RED="%{F#FFA54242}"

is_wifi()
{
	interface_up=$(ip link show | awk '/state UP/ {print substr($2, 1, length($2)-1)}')
	iwconfig "$interface_up" >/dev/null 2>&1
}
sigStrength()
{
if ip link show | grep -q 'state UP';
	then
	if ! is_wifi;
	then
        echo %{F$COLOR_FOCUSED_DESKTOP_FG}" "
        
        else
        signalStrength=$(awk 'NR==3 {print $3}' /proc/net/wireless)
        	case "$signalStrength" in
        	100|[6-9]*) echo %{F$COLOR_FOCUSED_DESKTOP_FG}"▁▃▅▇"
        		;;
        	[4-5]*) echo %{F$COLOR_FOCUSED_DESKTOP_FG}"▁▃▅""$DARKGREY""▇"%{F$COLOR_FOCUSED_DESKTOP_FG}
        		;;
        	[1-3]*) echo %{F$COLOR_FOCUSED_DESKTOP_FG}"▁▃""$DARKGREY""▅▇"%{F$COLOR_FOCUSED_DESKTOP_FG}
        		;;
        	*) echo "$DARKGREY"" "%{F$COLOR_FOCUSED_DESKTOP_FG}
        		
        		;;
        	esac 
    fi
  else
		echo "$DARKGREY"" "%{F$COLOR_FOCUSED_DESKTOP_FG}
fi
}

battery() {
    BATC=$(cat /sys/class/power_supply/BAT1/capacity)
    BATS=$(cat /sys/class/power_supply/BAT1/status)
	if [ "$BATS" = "Charging" ]; then
		echo " $BATC%"
	else 
		case "$BATC" in
		100|[7-9]*) echo " $BATC%"
			
			;;
		[4-6]*) echo " $BATC%"
			
			;;
		*) echo "$RED $BATC%%{F$COLOR_FOCUSED_DESKTOP_FG}"
			
			;;
		esac
	fi
}

clock() {
    date '+%H:%M'
}

status()
{
if [ -e /sys/class/power_supply/BAT1/ ]; then
	while	:; do
	echo "C%{A:networkmenuplacer.sh ; nmcli_dmenu:}$(sigStrength)%{A} %{A:dbright:}$(battery)%{A}  $(clock)"
	sleep "$update_interval"
done	
else
	while	:; do
	echo "C%{A:networkmenuplacer.sh ; nmcli_dmenu:}$(sigStrength)%{A}  $(clock)"
	sleep "$update_interval"
done
fi

}

lime() {
 while read -r line ; do
    case "$line" in
        T*)
            title="%{A:MonocleSwitcher:}${line#?}%{A}"
            ;;
	C*)
            conky_infos="%{F$COLOR_FOCUSED_DESKTOP_FG}${line#?}"
            ;;
	V*)
            volume_infos="${RA}%{F$COLOR_FOCUSED_DESKTOP_FG} ${line#?} "
            ;;
        W*)
            # bspwm internal state
            desktops=""
            IFS=':'
            set -- ${line#?}
            while [ $# -gt 0 ] ; do
                item=$1
                name=${item#?}
                case $item in
                    # always show focused desktops
                    O*|F*|U*)
                        desktops="${desktops}%{F$COLOR_FOCUSED_DESKTOP_FG}%{B$COLOR_FOCUSED_DESKTOP_BG}%{U"$COLOR_FOCUSED_DESKTOP_FG"}%{+u}${name}%{-u} %{B-}%{F-}"
                        ;;
                    # show used unfocused (hide free unused)
                    o*|u*)#f*
                        desktops="${desktops}%{F$COLOR_DESKTOP_FG}%{B$COLOR_DESKTOP_BG}%{A:bspc desktop -f ${name}:}${name}%{A}%{B-} %{F-}"
                        ;;
                    L*)
                    # layout
                        layout="%{A:bspc desktop -l next:}$wm_infos${name}%{B-}%{F-}%{A}"
                        ;;
                esac
                shift
            done
            ;;
    esac
    printf "%s\n" "%{l}${logo}$menu$volume_infos${desktops}${layout}%{F$COLOR_DESKTOP_FG}%{c}${title}%{r}%{F$COLOR_FOCUSED_DESKTOP_FG}${conky_infos}"
 done
}

## Rename monitors to numbers
#i=1
#for monitor in $(bspc query -M); do
#    bspc monitor "$monitor" \
#        -n "$i" \
#    let i++
#done
#unset i

i=1
#for i in $(bspc query -M); do
	# Remove old fifos and create new ones
	[ -e "$PANEL_FIFO$i" ] && rm "$PANEL_FIFO$i"
	mkfifo "$PANEL_FIFO$i"
	# Wm infos of specific monitor
	bspc subscribe > "$PANEL_FIFO$i" &
	# Title
	xtitle -t 80 -sf 'T%s' > "$PANEL_FIFO$i" &
	# conky infos
	[ $(pgrep -cx conky) -lt 1 ] && conky -c ~/.config/bspwm/panel/conkyrc > /tmp/panel-fifo$i &
	#status
#	status > /tmp/panel-fifo$i &
	# Volume-infos
	volume_status.sh &
	# Pipe all the info to lemonbar
	cat $PANEL_FIFO$i $PANEL_FIFO \
		| lime \
		| lemonbar \
		-g 1364x$panel_height+0+0 \
		-f "$mainfont" -o -1 \
		-f "$iconfont" -o 0 \
		-o -3 -f "$powerlinefont" \
		-F $COLOR_FOCUSED_DESKTOP_FG \
		-B $COLOR_DESKTOP_BG \
		| while read line; do eval "$line"; done &
