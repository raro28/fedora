%include ./virtualization.ks
%include ./qmk.ks
%include ./obe.ks
%include ./rebrand.ks

repo --name=updates

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
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
repo --name=updates-testing --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-f$releasever&arch=$basearch
repo --name=updates-testing-modular --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-testing-modular-f$releasever&arch=$basearch
repo --name=rpmfusion-free-released --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-non-free --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-non-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates-testing --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-testing-$releasever&arch=$basearch
repo --name=rpmfusion-nonfree-updates-testing --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-testing-$releasever&arch=$basearch
repo --name=kubectl --baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch

part / --fstype="ext4" --size=22000

lang en_US
timezone America/Mexico_City
services --enabled=NetworkManager --disabled=network,sshd

%packages

mozilla-ublock-origin
microsoft-edge-stable
google-chrome-stable
overgrive

skypeforlinux
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
fedpkg
gvfs-nfs
sqlite
nmap
dnf-plugin-system-upgrade
sshfs
rpmconf
remove-retired-packages
arm-image-installer
ansible
pykickstart
livecd-tools

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
gparted
calibre
mcomix
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
file-roller
corectrl
baobab

hunspell-es-MX
libreoffice
libreoffice-langpack-es

rpmfusion-nonfree-release-tainted
rpmfusion-free-release-tainted

bpftool
brother-udev-rule-type1
brscan5
brscan-skey
dcpt520wpdrv

%end

%post --erroronfail

sed -i 's/#Storage.*/Storage=persistent/' /etc/systemd/journald.conf

ln -s /usr/lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
ln -s /usr/lib/systemd/system/cpupower.service /etc/systemd/system/multi-user.target.wants/cpupower.service


cat <<EOF > /etc/yum.repos.d/raro28-wdm-fedora.repo
[copr:copr.fedorainfracloud.org:raro28:wdm]
name=Copr repo for wdm owned by raro28
baseurl=https://download.copr.fedorainfracloud.org/results/raro28/wdm/fedora-$releasever-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://download.copr.fedorainfracloud.org/results/raro28/wdm/pubkey.gpg
repo_gpgcheck=0
enabled=1
enabled_metadata=1
EOF

cat <<EOF > /etc/yum.repos.d/omv-fedora.repo
[lan:omv]
name=omv.lan
baseurl=http://omv.lan:8000/
skip_if_unavailable=True
gpgcheck=0
repo_gpgcheck=0
enabled=1
enabled_metadata=1
EOF

%end