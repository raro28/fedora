%include ./base-workstation.ks

repo --excludepkgs=kernel* --name=fedora --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --excludepkgs=kernel* --name=updates --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

%packages

-zram-generator
-zram-generator-defaults

kernel-5.13.9-200.fc34.x86_64
kernel-devel-5.13.9-200.fc34.x86_64
kernel-modules-5.13.9-200.fc34.x86_64
kernel-modules-extra-5.13.9-200.fc34.x86_64
kernel-core-5.13.9-200.fc34.x86_64

kernel-tools-5.13.6-200.fc34.x86_64
kernel-tools-libs-5.13.6-200.fc34

%end

%post --erroronfail

printf "\nexclude=kernel*\n" >> /etc/dnf/dnf.conf

%end