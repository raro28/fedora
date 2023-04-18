%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./gnome-clean.ks

%packages

gnome-tweaks
gnome-extensions-app
gnome-sound-recorder

file-roller

%end

%post --erroronfail

rm -f /etc/xdg/autostart/gnome-software-service.desktop

sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm/custom.conf

%end