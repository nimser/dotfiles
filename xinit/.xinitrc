setxkbmap fr bepo
xrdb -merge ~/.Xresources
xinput --set-prop "Elan TrackPoint" "libinput Accel Profile Enabled" 0 1
xinput --set-prop "Elan TrackPoint" "libinput Accel Speed" 1.0
exec i3
