%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./gnome-clean.ks

%packages

gnome-tweaks
gnome-extensions-app

file-roller

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
old-files-age=uint32 7
recent-files-max-age=7
remove-old-temp-files=true
remove-old-trash-files=true
report-technical-problems=false

[org/gnome/desktop/screensaver]
lock-delay=0
lock-enabled=false

[org/gnome/desktop/search-providers]
disabled=['org.gnome.Software.desktop']

[ca/desrt/dconf-editor/Settings]
show-warning=true

[org/gnome/desktop/session]
idle-delay=uint32 0

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-type='nothing'
sleep-inactive-battery-timeout=300
power-button-action='interactive'
idle-dim=false

[system/locale]
region='es_MX.UTF-8'

[org/gnome/system/location]
enabled=false

[org/gnome/desktop/notifications]
show-in-lock-screen=false
EOF

dconf update

%end