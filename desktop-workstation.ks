%include ./gnome-workstation.ks
%include ./workstation.ks

%packages

-virtualbox-guest-additions
akmod-nvidia
xorg-x11-drv-nvidia-cuda

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
EOF

#sudo -u ekthor akmodsbuild -k $(uname -r) /usr/src/akmods/nvidia-kmod.latest -o /opt

grubby --args="delayacct amd_cpufreq.cppc_enable=1" --update-kernel=ALL

%end

%post --erroronfail

cat <<EOF > /etc/dconf/db/local.d/00-appearance
[org/gnome/desktop/interface]
gtk-theme='Adwaita-dark'
document-font-name='Noto Sans 11'
font-name='Noto Sans 11'
monospace-font-name='JetBrains Mono 10'
font-hinting='full'
enable-animations=false
font-antialiasing='grayscale'
clock-show-date=true
clock-show-weekday=true

[org/gnome/desktop/wm/preferences]
titlebar-font='Noto Sans Bold 11'
EOF

dconf update

%end