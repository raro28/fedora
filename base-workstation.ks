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

%post --erroronfail

grubby --args="delayacct" --update-kernel=ALL

%end

%post --erroronfail

ln -s /etc/systemd/system/multi-user.target.wants/sshd.service /usr/lib/systemd/system/sshd.service

ln -s /etc/systemd/system/printers.target.wants/cups.service /usr/lib/systemd/system/cups.service
ln -s /etc/systemd/system/multi-user.target.wants/cups.service /usr/lib/systemd/system/cups.service
ln -s /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
ln -s /etc/systemd/system/multi-user.target.wants/cups.path /usr/lib/systemd/system/cups.path

ln -s /etc/systemd/system/multi-user.target.wants/cups-browsed.service /usr/lib/systemd/system/cups-browsed.service
ln -s /etc/systemd/system/multi-user.target.wants/atd.service /usr/lib/systemd/system/atd.service

%end