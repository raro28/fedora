%include ./gnome-workstation.ks
%include ./base-workstation.ks
%include ./clean.ks

network --hostname=mumei

%packages

-virtualbox-guest-additions
akmod-nvidia
xorg-x11-drv-nvidia-cuda

vfio-gpu-passthrough-scripts
qemu-hook-scripts
looking-glass-client

gdm-desktop-monitor-xml

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
EOF

export KERNEL="$(rpm -q kernel --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n' | tail -1;)"
export NVIDIA="$(rpm -q akmod-nvidia --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n')"

sudo -u liveuser akmodsbuild -k $KERNEL /usr/src/akmods/nvidia-kmod.latest -o /tmp
rpm -ivh "/tmp/kmod-nvidia-$KERNEL-$NVIDIA.rpm"

grubby --args="amd_iommu=on iommu=pt rd.driver.pre=vfio-pci" --update-kernel=ALL

%end