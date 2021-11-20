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

hunspell-es-MX
libreoffice-langpack-es

%end

%post --erroronfail

koji download-build --arch=x86_64 kernel-5.15.2-200.fc35
mv kernel* /tmp/.
dnf update -y /tmp/kernel*
rm /tmp/kernel*

grubby --args="delayacct amd_cpufreq.cppc_enable=1" --update-kernel=ALL

%end