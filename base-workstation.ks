%include ./rpmfusion.ks
%include ./virtualization.ks
%include ./qmk.ks
%include ./obe.ks
%include ./rebrand.ks

repo --name=updates

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=mono-stable --baseurl=https://download.mono-project.com/repo/centos7-stable/
repo --name=slack --baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64
repo --name=microsoft-edge --baseurl=https://packages.microsoft.com/yumrepos/edge
repo --name=raro28-wdm --baseurl=http://backend_httpd:5002/results/raro28/wdm/fedora-$releasever-$basearch/
repo --name="local" --baseurl=http://127.0.0.1:8000

part / --fstype="ext4" --size=15000

lang en_US
timezone America/Mexico_City

%packages

powerpanel
epson-inkjet-printer-201215w-1.0.0-1lsb3.2.x86_64

microsoft-edge-stable
google-chrome-stable
overgrive

skypeforlinux-8.78.0.161-1.x86_64
teams
slack
discord
telegram-desktop

pspp
awscli
mongodb-compass
mongodb-mongosh

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
libgtop2-devel
lm_sensors
telnet
mock
fedpkg

ffmpegthumbnailer
python3.9

jetbrains-mono-fonts
cascadia-code-fonts
google-noto-sans-fonts
google-noto-serif-fonts
google-noto-sans-display-fonts
google-noto-serif-display-fonts

xterm
tilix
gitk
gitg
meld
mpv
vlc
gthumb
keepassxc
seahorse
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
pitivi

hunspell-es-MX
libreoffice-langpack-es

%end

%post --erroronfail

grubby --args="delayacct" --update-kernel=ALL
sed -i 's/#Storage.*/Storage=persistent/' /etc/systemd/journald.conf

%end