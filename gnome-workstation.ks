%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./gnome-clean.ks

%packages

gnome-tweaks
gnome-extensions-app

file-roller

%end

%post --erroronfail

rm -f /etc/xdg/autostart/gnome-software-service.desktop

cat <<EOF > /etc/dconf/db/local.d/00-appearance
[org/gnome/desktop/interface]
gtk-theme='Adwaita-dark'
document-font-name='Noto Sans 11'
font-name='Noto Sans 11'
monospace-font-name='JetBrains Mono 10'
font-hinting='full'
enable-animations=false
font-antialiasing='rgba'
enable-hot-corners=false

[org/gnome/desktop/wm/preferences]
titlebar-font='Noto Sans Bold 11'
num-workspaces=2

[org/gnome/desktop/background]
picture-uri=''
primary-color='#000000'
secondary-color='#000000'

[org/gnome/desktop/screensaver]
picture-uri=''
primary-color='#000000'
secondary-color='#000000'

[org/gnome/gedit/preferences/editor]
scheme='oblivion'

[org/gnome/settings-daemon/plugins/color]
night-light-enabled=true
night-light-schedule-automatic=true
night-light-schedule-from=18.0
night-light-schedule-to=8.0
night-light-temperature=uint32 2171

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

[ca/desrt/dconf-editor]
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
show-hidden=true

[org/gnome/gthumb/browser]
viewer-thumbnails-orientation='vertical'
thumbnail-size=128
go-to-last-location=false
startup-location='file:///home'
use-startup-location=true
active-extensions=['resize_images', 'image_print', 'webalbums', 'burn_disc', 'search', 'list_tools', 'convert_format', 'exiv2_tools', 'edit_metadata', 'find_duplicates', 'rename_series', 'photo_importer', 'raw_files', 'gstreamer_tools', 'catalogs', 'desktop_background', 'change_date', 'contact_sheet', 'image_rotation', 'selections', 'bookmarks', 'terminal', 'file_manager', 'red_eye_removal', 'comments', 'slideshow']
sort-type='file::mtime'
sort-inverse=true
reuse-active-window=true

[org/gnome/gthumb/slideshow]
random-order=true

[org/gnome/gnome-system-monitor]
graph-update-interval=499
resources-memory-in-iec=true
network-in-bits=true
network-total-unit=true
process-memory-in-iec= true
disktreenew/col-4-visible=true

[org/gnome/software]
download-updates=false

[org/gnome/mutter]
dynamic-workspaces=false
workspaces-only-on-primary=false

EOF

cat <<EOF > /etc/dconf/db/local.d/03-shell
[org/gnome/shell]
favorite-apps=['google-chrome.desktop']

[org/gnome/shell/extensions/dash-to-panel]
panel-sizes='{"0":24}'
panel-element-positions='{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}],"1":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}'
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

[org/gnome/shell/extensions/vitals]
show-voltage=false
show-fan=false
use-higher-precision=true
fixed-widths=true
memory-measurement=0
show-storage=false
hot-sensors=['_memory_allocated_', '_memory_swap_used_', '__temperature_avg__', '_processor_frequency_', '_system_load_5m_', '__network-download_max__', '__network-upload_max__']
hide-zeros=true

[org/gnome/shell/extensions/dash-to-dock]
border-radius=25
custom-theme-shrink=true
dash-max-icon-size=24
dock-position='BOTTOM'
floating-margin=4
isolate-monitors=true
isolate-workspaces=true
multi-monitor=true
show-show-apps-button=false
transparency-mode='DYNAMIC'

[org/gnome/shell/app-switcher]
current-workspace-only=true

EOF

dconf update

%end