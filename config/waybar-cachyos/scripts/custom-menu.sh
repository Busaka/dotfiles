#!/bin/bash
options="Scrcpy(NEON-RAY-ULTRA)\nScrcpy(NEON-WIRELESS)\nScrcpyOff\nOBS\nWaydroid\nTerminal\nWaydroidOff\nWaydroidSession\nScrcpy(WAYDROID)\nCalculator\nScreenShot\nQutebrowser\nChromeBrowser\nPcmanfm\nWinbox\nNetworkManagerApplet\nBluetooth\nExit"
chosen=$(echo -e "$options" | wofi --dmenu --prompt "Custom Menu" --width 300 --height 234)

case $chosen in
  "Scrcpy(NEON-RAY-ULTRA)") scrcop ;;
  "Scrcpy(NEON-WIRELESS)") scrcop-wireless ;;
  "Waydroid")   wayd.sh ;;
  "Terminal")   alacritty ;;
  "ScrcpyOff")   scrcopoff ;;
  "OBS")   obs ;;
  "WaydroidOff")   wayd-stop.sh ;;
  "WaydroidSession")  wayd-session.sh ;;
  "Scrcpy(WAYDROID)") scrcop-wayd ;;
  "Calculator")     galculator ;;
  "Qutebrowser")     qutebrowser ;;
  "ChromeBrowser")     google-chrome-beta ;;
  "Pcmanfm")     pcmanfm-qt ;;
  "ScreenShot")    screenshot ;;
  "Winbox")    winbox.sh ;;
  "Bluetooth")    bluetooth.sh ;;
  "NetworkManagerApplet")    nm-app-toggle ;;
  "Exit")     exit 0 ;;
  *)          exit 1 ;;
esac
