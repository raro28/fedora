#https://forum.level1techs.com/t/fedora-33-ultimiate-vfio-guide-for-2020-2021-wip/163814
%post --erroronfail

cat > /usr/bin/checkiommu << EOF
#!/usr/bin/env bash
shopt -s nullglob
for g in /sys/kernel/iommu_groups/*; do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done
done
EOF
chmod +x /usr/bin/checkiommu

mkdir -p /usr/lib/dracut/modules.d/20vfio
cat <<EOF > /usr/lib/dracut/modules.d/20vfio/vfio-pci-override.sh
#!/bin/sh
PREREQS=""
DEVS="0000:0b:00.0 0000:0b:00.1"

for DEV in $DEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
done

modprobe -i vfio-pci
EOF
chmod +x /usr/lib/dracut/modules.d/20vfio/vfio-pci-override.sh

cat <<EOF > /usr/lib/dracut/modules.d/20vfio/module-setup.sh
#!/usr/bin/bash
check() {
  return 0
}
depends() {
  return 0
}
install() {
  inst_hook pre-udev 00 "/usr/lib/dracut/modules.d/20vfio/vfio-pci-override.sh"
}
EOF
chmod +x /usr/lib/dracut/modules.d/20vfio/module-setup.sh

cat <<EOF > /etc/dracut.conf.d/vfio.conf
add_dracutmodules+=" vfio "
force_drivers+=" vfio vfio-pci vfio_iommu_type1 "
install_items="/usr/bin/find /usr/bin/dirname"
EOF

#dracut -f

%end