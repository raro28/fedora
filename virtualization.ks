%packages
@Virtualization --optional
libguestfs-tools

%end

docker-desktop

%post

ln -s /usr/lib/systemd/system/libvirtd.service /etc/systemd/system/multi-user.target.wants/libvirtd.service
ln -s /usr/lib/systemd/system/libvirtd.socket /etc/systemd/system/sockets.target.wants/libvirtd.socket
ln -s /usr/lib/systemd/system/libvirtd-ro.socket /etc/systemd/system/sockets.target.wants/libvirtd-ro.socket

%end
