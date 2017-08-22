Change screen resolution:

Create a new resolution using cvt

$> cvt 1600 900 75
1600x900 74.89 Hz (CVT 1.44M9) hsync: 70.55 kHz; pclk: 151.25 MHz
Modeline "1600x900_75.00"  151.25  1600 1704 1872 2144  900 903 908     942 -hsync +vsync
Add a new mode to the existing list (newmode is the name and remaining portion is )

$ sudo xrandr --newmode "1600x900_75.00"  151.25  1600 1704 1872 2144  900 903 908 942 -hsync +vsync
Find the current display

$ xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/"
Virtual1
Add new display mode where is the output from the previous command

$ sudo xrandr --addmode <Virtual1> 1600x900_75.00
This will add the new resolution to your existing list of supported resolutions. You can then choose the right option from the "display settings" or following command

$ xrandr --output Virtual1 --mode "1600x900_75.00"
To make this change permanent,

$ cat> ~/.xprofile
sudo xrandr --newmode "1600x900_75.00"  151.25  1600 1704 1872 2144      900 903 908 942 -hsync +vsync
sudo xrandr --addmode Virtual1 1600x900_75.00
xrandr --output Virtual1 --mode "1600x900_75.00"
