%post --erroronfail

/usr/sbin/useradd \
    -p '$6$OX3S7RR.l0JCBbK7$9ihUqInRXgcmeeRBNAHL/WXKUz8HDszspnuj.BFEVbZGgo1qejCNSufQtzfx.x.qtjYiaMNtPg5sepJh6.otX/' \
    -G users,wheel,libvirt,input,qemu,kvm \
    -s /usr/bin/zsh \
    ekthor

/usr/sbin/useradd \
    -p '$6$OX3S7RR.l0JCBbK7$9ihUqInRXgcmeeRBNAHL/WXKUz8HDszspnuj.BFEVbZGgo1qejCNSufQtzfx.x.qtjYiaMNtPg5sepJh6.otX/' \
    -G users \
    -s /usr/bin/bash \
    ramser

mkdir -p /home/ekthor/.cache
chown ekthor:ekthor -R /home/ekthor/.cache

cat <<EOF > /etc/systemd/system/root.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab
Conflicts=umount.target
Before=local-fs.target umount.target
After=swap.target

[Install]
WantedBy=local-fs.target

[Mount]
Where=/root
What=none
Type=tmpfs
Options=defaults,size=1024M,mode=0700,uid=root,gid=root
EOF

cat <<EOF > /etc/systemd/system/home-ramser.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab
Conflicts=umount.target
Before=local-fs.target umount.target
After=swap.target

[Install]
WantedBy=local-fs.target

[Mount]
Where=/home/ramser
What=none
Type=tmpfs
Options=defaults,size=4096M,mode=0700,uid=ramser,gid=ramser
EOF

cat <<EOF > /etc/systemd/system/home-ekthor-.cache.mount
[Unit]
Documentation=man:fstab(5) man:systemd-fstab-generator(8)
SourcePath=/etc/fstab
Conflicts=umount.target
Before=local-fs.target umount.target
After=swap.target

[Install]
WantedBy=local-fs.target

[Mount]
Where=/home/ekthor/.cache
What=none
Type=tmpfs
Options=defaults,size=8192M,mode=0700,uid=ekthor,gid=ekthor
EOF

ln -s /etc/systemd/system/root.mount /etc/systemd/system/local-fs.target.wants/root.mount
ln -s /etc/systemd/system/home-ramser.mount /etc/systemd/system/local-fs.target.wants/home-ramser.mount
ln -s /etc/systemd/system/home-ekthor-.cache.mount /etc/systemd/system/local-fs.target.wants/home-ekthor-.cache.mount

%end