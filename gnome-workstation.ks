%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./gnome-clean.ks

repo --name=mushrooms --baseurl=https://download.copr.fedorainfracloud.org/results/tomaszgasior/mushrooms/fedora-$releasever-$basearch/

%packages

qogir-theme
fluent-gtk-theme-red-compact
qogir-cursors-theme
tela-circle-icon-black-theme

gnome-tweaks
gnome-extensions-app
gnome-sound-recorder
nautilus-terminal

dconf-local-db-config
user-files

file-roller

%end

%post --erroronfail

rm -f /etc/xdg/autostart/gnome-software-service.desktop

%end