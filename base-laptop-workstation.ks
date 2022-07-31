%include ./base-workstation.ks

network --hostname=nameless

repo --excludepkgs=kernel* --name=fedora
repo --excludepkgs=kernel* --name=updates

%packages

-virtualbox-guest-additions
-zram-generator
-zram-generator-defaults

kernel-5.13.9-200.fc34.x86_64
kernel-devel-5.13.9-200.fc34.x86_64
kernel-modules-5.13.9-200.fc34.x86_64
kernel-modules-extra-5.13.9-200.fc34.x86_64
kernel-core-5.13.9-200.fc34.x86_64

%end

%post --erroronfail

printf "\nexclude=kernel*\n" >> /etc/dnf/dnf.conf

%end