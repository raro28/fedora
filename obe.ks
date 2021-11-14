user --name=ramser --groups=users,wheel,mock,docker,vboxsf,libvirt --password=12345678 --shell=/usr/bin/zsh
user --name=ekthor --groups=users,wheel,mock,docker,vboxsf,libvirt --password=12345678 --shell=/usr/bin/zsh

%post --erroronfail

mkdir -p /home/ekthor/.cache
chown ekthor:ekthor -R /home/ekthor/.cache

cat > /etc/systemd/system/root.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab

[Mount]
Where=/root
What=none
Type=tmpfs
Options=defaults,size=1024M,mode=0700,uid=root,gid=root
EOF

cat > /etc/systemd/system/home-ramser.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab

[Mount]
Where=/home/ramser
What=none
Type=tmpfs
Options=defaults,size=4096M,mode=0700,uid=ramser,gid=ramser
EOF

cat > /etc/systemd/system/home-ekthor-.cache.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab

[Mount]
Where=/home/ekthor/.cache
What=none
Type=tmpfs
Options=defaults,size=8192M,mode=0700,uid=ekthor,gid=ekthor
EOF

systemctl enable root.mount
systemctl enable home-ramser.mount
systemctl enable home-ekthor-.cache.mount

%end