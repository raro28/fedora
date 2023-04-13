%packages
@Virtualization --optional
libguestfs-tools

qemu-system-aarch64

kubectl
minikube

podman-compose
podman-docker

%end

%post

ln -s /usr/lib/systemd/system/libvirtd.service /etc/systemd/system/multi-user.target.wants/libvirtd.service
ln -s /usr/lib/systemd/system/libvirtd.socket /etc/systemd/system/sockets.target.wants/libvirtd.socket
ln -s /usr/lib/systemd/system/libvirtd-ro.socket /etc/systemd/system/sockets.target.wants/libvirtd-ro.socket

%end
