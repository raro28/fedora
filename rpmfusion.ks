repo --name=rpmfusion-free-released --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
repo --name=rpmfusion-non-free --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch
repo --name=rpmfusion-non-free-updates --mirrorlist=https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch

%packages

rpmfusion-nonfree-release-tainted
rpmfusion-free-release-tainted
*-firmware

%end

%post

dnf groupupdate core
dnf groupupdate multimedia --setop=install_weak_deps=False --exclude=PackageKit-gstreamer-plugin
dnf groupupdate sound-and-video

%end