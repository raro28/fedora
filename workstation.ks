%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./clean.ks
%include ./rpmfusion.ks
%include ./virtualization.ks
%include ./qmk.ks

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=mono-stable --baseurl=https://download.mono-project.com/repo/centos7-stable/

part / --fstype="ext4" --size=13000

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
mock

python3.9

%end