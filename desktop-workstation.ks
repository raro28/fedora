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