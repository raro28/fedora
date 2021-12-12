sudo dnf install kernel-modules-$(uname -r) mock

sudo usermod -a -G mock $USER

mock -r fedora-35-x86_64 --init --install lorax-lmc-novirt vim-minimal pykickstart git koji

mock -r fedora-35-x86_64 --shell --isolation=simple --enable-network 

git clone --recurse-submodules https://github.com/raro28/workstation.git

git submodule update --remote

/var/lib/mock/fedora-35-x86_64/root/builddir

rm -rf /var/lms *.log *.ks

git stash && git pull origin develop && git stash pop
 
ksflatten --config workstation/desktop-workstation.ks -o flat-desktop-workstation.ks --version F35
livemedia-creator --ks flat-desktop-workstation.ks --no-virt --resultdir /var/lmc --project Workstation-Live --make-iso --volid Workstation-35 --iso-only --iso-name Workstation-35-x86_64.iso --releasever 35

ksflatten --config workstation/laptop-workstation.ks -o flat-laptop-workstation.ks --version F35
livemedia-creator --ks flat-laptop-workstation.ks --no-virt --resultdir /var/lmc --project Workstation-Live --make-iso --volid Workstation-35 --iso-only --iso-name Workstation-35-x86_64.iso --releasever 35