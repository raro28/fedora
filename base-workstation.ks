lang en_US
timezone America/Mexico_City

%packages

git
zsh
htop
iotop
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

ffmpegthumbnailer
mock
python3.9

gtk-murrine-engine
gtk2-engines
jetbrains-mono-fonts
google-noto-sans-fonts
google-noto-serif-fonts
sassc

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
transmission-gtk
dconf-editor

hunspell-es-MX
libreoffice-langpack-es

%end

%post  --erroronfail
rpm -Uvh \
https://launchpad.net/veracrypt/trunk/1.25.4/+download/veracrypt-1.25.4-CentOS-8-x86_64.rpm \
https://www.thefanclub.co.za/sites/default/files/public/overgrive/overgrive-3.3.10.noarch.rpm

%end