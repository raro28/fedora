%include ./fedora-kickstarts/fedora-live-workstation.ks

repo --name=rpmfusion-free-released --metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates --metalink=https://mirrors.rpmfusion.org/metalink?repo=free-fedora-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-non-free --metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-non-free-updates --metalink=https://mirrors.rpmfusion.org/metalink?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=docker-ce-stable --baseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/stable
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=mono-stable --baseurl=https://download.mono-project.com/repo/centos7-stable/

part / --fstype="ext4" --size=13000

%packages

rpmfusion-nonfree-release-tainted
rpmfusion-free-release-tainted
*-firmware

git
zsh
htop
iotop
hwloc-libs
hwloc-gui
fswatch
util-linux-user
p7zip
snapd
awscli
hdparm
xdotool
srm
smartmontools

gtk-murrine-engine
gtk2-engines
jetbrains-mono-fonts
google-noto-sans-fonts
google-noto-serif-fonts
sassc

gitk
meld
thunderbird
file-roller
skypeforlinux
teams
gnome-tweaks
gnome-extensions-app
mpv
vlc
gthumb
-gnome-terminal
-gnome-terminal-nautilus
tilix
tilix-nautilus 
google-chrome-stable.x86_64
keepassxc
gparted
steam
calibre

clang
cmake
gtk3-devel

cups
system-config-printer

livecd-tools
spin-kickstarts
mock

@Virtualization --optional
libguestfs-tools
VirtualBox
kernel-devel
akmod-VirtualBox
-docker
-docker-client
-docker-client-latest
-docker-common
-docker-latest
-docker-latest-logrotate
-docker-logrotate
-docker-selinux
-docker-engine-selinux
-docker-engine
docker-ce
docker-ce-cli
containerd.io

pip
python3.9
arm-none-eabi-binutils-cs
arm-none-eabi-gcc-cs
arm-none-eabi-newlib
avr-binutils
avr-gcc
avr-libc
avrdude
dfu-programmer
dfu-util
hidapi

-gnome-maps
-gnome-photos
-gnome-contacts
-gnome-connections
-gnome-boxes
-gnome-weather
-gnome-shell-extension-apps-menu
-gnome-shell-extension-background-logo
-gnome-shell-extension-window-list
-gnome-classic-session
-gnome-video-effects
-gnome-tour
-simple-scan
-cheese
-eog
-totem

%end

%post

dnf groupupdate core
dnf groupupdate multimedia --setop=install_weak_deps=False --exclude=PackageKit-gstreamer-plugin
dnf groupupdate sound-and-video

%end