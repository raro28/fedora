%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./gnome-clean.ks

%packages

gnome-tweaks
gnome-extensions-app
gnome-sound-recorder

dconf-local-db-config

file-roller

%end

%post --erroronfail

rm -f /etc/xdg/autostart/gnome-software-service.desktop

%end