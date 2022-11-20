%include ./virtualization.ks
%include ./qmk.ks
%include ./obe.ks
%include ./rebrand.ks

repo --name=updates

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=slack --baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64
repo --name=microsoft-edge --baseurl=https://packages.microsoft.com/yumrepos/edge
repo --name=vscode --baseurl=https://packages.microsoft.com/yumrepos/vscode
repo --name=raro28-wdm --baseurl=https://download.copr.fedorainfracloud.org/results/raro28/wdm/fedora-$releasever-$basearch/
repo --name=lan_rpm --baseurl=http://omv.lan:8000/
repo --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name=fedora-modular --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-modular-$releasever&arch=$basearch
repo --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch
repo --name=updates-modular --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-modular-f$releasever&arch=$basearch
repo --name=rpmfusion-free-released --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-non-free --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-non-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
repo --name=papirus --baseurl=https://download.copr.fedorainfracloud.org/results/dirkdavidis/papirus-icon-theme/epel-8-$basearch

part / --fstype="ext4" --size=15000

lang en_US
timezone America/Mexico_City

%packages

mozilla-ublock-origin
microsoft-edge-stable
google-chrome-stable
overgrive

skypeforlinux
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
powertop
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
dhex
flatpak
libgtop2-devel
telnet
mock
fedpkg
gvfs-nfs
sqlite
nmap
dnf-plugin-system-upgrade
sshfs
rpmconf

bison
elfutils-libelf-devel
flex
openssl-devel

ffmpegthumbnailer
python3.9

jetbrains-mono-fonts
cascadia-code-fonts
google-noto-sans-fonts
google-noto-serif-fonts
google-noto-sans-display-fonts
google-noto-serif-display-fonts

qogir-theme
fluent-gtk-theme-red-compact
qogir-cursors-theme
tela-circle-icon-black-theme
papirus-icon-theme

dconf-local-db-config
user-files

code
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
rpi-imager
zoom
evince
StarUML


hunspell-es-MX
libreoffice
libreoffice-langpack-es

rpmfusion-nonfree-release-tainted
rpmfusion-free-release-tainted
*-firmware

%end

%post --erroronfail

grubby --args="delayacct" --update-kernel=ALL
sed -i 's/#Storage.*/Storage=persistent/' /etc/systemd/journald.conf

%end