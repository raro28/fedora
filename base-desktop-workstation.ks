%include ./base-workstation.ks

%packages

akmod-nvidia
kernel-devel

kernel-tools
kernel-tools-libs

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
options nouveau modeset=0
EOF

ln -s /dev/null /etc/systemd/system/nvidia-powerd.service

cat <<EOF > /etc/modprobe.d/kvm.conf
options kvm_amd nested=1
EOF

cat <<EOF > /etc/modprobe.d/asus-sensors.conf
blacklist asus_wmi
blacklist eeepc_wmi
EOF

%end