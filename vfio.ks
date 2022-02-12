%post --erroronfail

dracut -f

mkdir -p /etc/libvirt/hooks
chmod -R 755 /etc/libvirt/hooks
chmod +x /etc/libvirt/hooks

cat <<EOF > /etc/libvirt/hooks/qemu
#!/bin/bash

command=$2

if [[ $command == "started" ]]; then
    systemctl set-property --runtime -- user.slice AllowedCPUs=0-7,16-23
    systemctl set-property --runtime -- system.slice AllowedCPUs=0-7,16-23
    systemctl set-property --runtime -- init.scope AllowedCPUs=0-7,16-23
elif [[ $command == "release" ]]; then
    systemctl set-property --runtime -- user.slice AllowedCPUs=0-31
    systemctl set-property --runtime -- system.slice AllowedCPUs=0-31
    systemctl set-property --runtime -- init.scope AllowedCPUs=0-31
fi
EOF

%end