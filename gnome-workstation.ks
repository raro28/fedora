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
font-antialiasing='rgba'

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
show-delete-permanently=true

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
remember-recent-files=false

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

[org/gnome/system/locale]
region='es_MX.UTF-8'

[org/gnome/system/location]
enabled=false

[org/gnome/desktop/notifications]
show-in-lock-screen=false

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
binding='<Super>t'
name='tilix'
command='tilix'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Super>e'
name='nautilus'
command='nautilus'

[com/gexperts/Tilix/Settings]
warn-vte-config-issue=false

[com/gexperts/Tilix/ProfilesList]
default='2b7c4080-0ddd-46c5-8f23-563fd3ba789d'
list=['2b7c4080-0ddd-46c5-8f23-563fd3ba789d']

[com/gexperts/Tilix/profiles]
list=['2b7c4080-0ddd-46c5-8f23-563fd3ba789d']

[com/gexperts/Tilix]
profiles=['/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/']
new-instance-mode='split-down'

[com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
visible-name='Default'
draw-margin=120
default-size-columns=120
use-system-font=false
font='JetBrains Mono 12'

[org/gtk/settings/file-chooser]
sort-directories-first=true

EOF

cat <<EOF > /etc/dconf/db/local.d/03-shell
[org/gnome/shell/extensions/dash-to-panel]
panel-sizes='{"0":24}'
panel-element-positions='{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'
appicon-padding=0
appicon-margin=4
animate-appicon-hover=false
animate-app-switch=false
animate-window-launch=false
focus-highlight-dominant=true
dot-color-dominant=true
dot-style-unfocused='DASHES'
dot-position='LEFT'
dot-size=5
focus-highlight-opacity=50
trans-panel-opacity=50.0
show-favorites-all-monitors=false
isolate-workspaces=true
isolate-monitors=true
hide-overview-on-startup=true
primary-monitor=1

[org/gnome/shell/extensions/trayIconsReloaded]
icons-limit=1
icon-size=24

[org/gnome/shell]
favorite-apps=['google-chrome.desktop']

EOF

dconf update

%end