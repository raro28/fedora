user --name=ramser --groups=users,wheel,mock,docker,vboxsf,libvirt --password=12345678 --shell=/usr/bin/zsh
user --name=ekthor --groups=users,wheel,mock,docker,vboxsf,libvirt --password=12345678 --shell=/usr/bin/zsh

%post

mkdir -p /mnt/sysroot/home/ekthor/.cache
chown ekthor:ekthor -R /mnt/sysroot/home/ekthor

echo "none     /home/ekthor/.cache     tmpfs     defaults,size=8192M,mode=0700,uid=ekthor,gid=ekthor     0 0" >> /mnt/sysroot/etc/fstab
echo "none     /home/ramser     tmpfs     defaults,size=4096M,mode=0700,uid=ramser,gid=ramser     0 0" >> /mnt/sysroot/etc/fstab
echo "none     /root     tmpfs     defaults,size=1024M,mode=0700,uid=root,gid=root     0 0" >> /mnt/sysroot/etc/fstab

%end