

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#[ -f ~/.xprofile ] && source ~/.xprofile

#test -d /usr/share/fonts/local && xset +fp /usr/share/fonts/local
#xset fp rehash
#xset -b # disable bell

# eval "$(ssh-agent -s)"
# SSH_ENV=$HOME/.ssh/environment
# ssh-agent | grep -v echo > ${SSH_ENV}
# chmod 600 ${SSH_ENV}
# . ${SSH_ENV} > /dev/null
#

# https://wiki.archlinux.org/index.php/Display_Power_Management_Signaling#Prevent_screen_from_turning_off
#xset -dpms
#xset s off

#if test -f /usr/lib/ssh/x11-ssh-askpass
#then
#	SSH_ASKPASS=/usr/lib/ssh/x11-ssh-askpass ssh-add < /dev/null
#fi


# 1280x720 = 720p X220
#hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

#setxkbmap -model thinkpad -layout us -option caps:escape
#xset m 5 1


# https://bbs.archlinux.org/viewtopic.php?pid=1695649#p1695649
# DISABLED default of sleeping on lid close ~/.config/systemd/user/inhibit-lid-sleep-on-battery.service
#while true
#do
#	if [[ $(< /proc/acpi/button/lid/LID/state) = *closed ]]
#	then
#		logger Lid closed
#		case $(< /sys/class/power_supply/AC/online) in
#			1)  ( [[ ! "$(pidof slock)" ]] && slock ) ;;
#			0) logger "suspending..."; systemctl suspend ;;
#		esac
#	fi
#	sleep 2
#done &

export LIBGL_ALWAYS_SOFTWARE=1
#xautolock -time 10 -locker slock &
#xss-lock -- /usr/bin/slock &

# https://bbs.archlinux.org/viewtopic.php?id=66453
# xmodmap ~/.Xmodmap &&

# Properties button extra Mod/Escape
#xmodmap -e 'keycode 135 = Super_R' &
#xmodmap -e "keycode 108 = Super_L"  # reassign Alt_R to Super_L
#xmodmap -e "remove mod1 = Super_L"  # make sure X keeps it out of the mod1 group
xset r rate 300 50 &	# Speed xrate up
xsetroot -cursor_name left_ptr &
unclutter &		# Remove mouse when idle
dunst &			# dunst for notifications
mpdupdate &
#dwm_status &
# sxhkd &
xrdb -load ~/.Xresources &
# ( sleep 1s && zsh /home/ll/.local/bin/tools/lemonbar1.sh | lemonbar -p -F#FFFFFFFF -B#FF222222 -f "DejaVu Sans Mono"-8 -f FontAwesome-8) &
exec  bspwm 2>~/.bspwmrc.err
