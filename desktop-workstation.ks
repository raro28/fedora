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

[org/gnome/desktop/wm/preferences]
titlebar-font='Noto Sans Bold 11'

[org/gnome/desktop/background]
picture-uri=''
primary-color='#000000'
secondary-color='#000000'

[org/gnome/desktop/screensaver]
picture-uri=''
primary-color='#000000'
secondary-color='#000000'
EOF

cat <<EOF > /etc/dconf/db/local.d/01-behaviour
[org/gnome/desktop/interface]
clock-show-date=true
clock-show-weekday=true

[org/gnome/desktop/calendar]
show-weekdate=true

[org/gnome/tweaks]
show-extensions-notice=false

[org/gnome/nautilus/preferences]
show-create-link=true
show-delete-permanently=false

[org/gnome/software]
first-run=false

[org/gnome/desktop/media-handling]
automount-open=false
autorun-never=true

[org/gnome/desktop/privacy]
old-files-age=7
recent-files-max-age=7
remove-old-temp-files=true
remove-old-trash-files=true

[org/gnome/desktop/screensaver]
lock-delay=0
lock-enabled=false

[org/gnome/desktop/search-providers]
disabled=['org.gnome.Software.desktop']

[ca/desrt/dconf-editor/Settings]
show-warning=true
EOF

dconf update

%end