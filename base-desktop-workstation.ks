%include ./base-workstation.ks

network --hostname=mumei

%packages

-xorg-x11-drv-amdgpu
-xorg-x11-drv-ati
-xorg-x11-drv-intel
-xorg-x11-drv-nouveau
-xorg-x11-drv-qxl
-xorg-x11-drv-vesa
-xorg-x11-drv-vmware

-virtualbox-guest-additions
akmod-nvidia
kernel-devel
xorg-x11-drv-nvidia-cuda

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
EOF

export KERNEL="$(rpm -q kernel --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n' | tail -1;)"
export NVIDIA="$(rpm -q akmod-nvidia --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n')"
export NVIDIA_KMOD=kmod-nvidia-$KERNEL-$NVIDIA

if rpm -q $NVIDIA_KMOD
then
 echo "skip nvidia_mod"
else
 sudo -u ramser akmodsbuild -k $KERNEL /usr/src/akmods/nvidia-kmod.latest -o /tmp
 rpm -ivh /tmp/$NVIDIA_KMOD.rpm
fi

grubby --args="initcall_blacklist=acpi_cpufreq_init amd_pstate.shared_mem=1" --update-kernel=ALL

%end