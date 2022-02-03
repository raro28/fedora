lang en_US
timezone America/Mexico_City

%packages

git
zsh
htop
iotop
fio
hwloc-libs
hwloc-gui
fswatch
util-linux-user
p7zip
hdparm
xdotool
srm
smartmontools
neofetch
dhex
flatpak

cups
system-config-printer
at

ffmpegthumbnailer
mock
python3.9

gtk-murrine-engine
gtk2-engines
jetbrains-mono-fonts
google-noto-sans-fonts
google-noto-serif-fonts
sassc

xterm
tilix
gitk
gitg
meld
mpv
vlc
gthumb
keepassxc
gparted
calibre
mcomix
transmission-gtk
dconf-editor
kdiskmark
firewall-config
helvum
easyeffects
thunderbird
gimp
obs-studio

hunspell-es-MX
libreoffice-langpack-es

%end

services --enabled cups
services --enabled cups-browsed
services --enabled atd