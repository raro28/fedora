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

akmodsbuild -k $(uname -r) /usr/src/akmods/nvidia-kmod.latest -o /home/

%end