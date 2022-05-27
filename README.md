sudo dnf install kernel-modules-$(uname -r) mock

sudo usermod -a -G mock $USER

sudo mock -r fedora-35-x86_64 --clean

mock -r fedora-35-x86_64 --init --install lorax-lmc-novirt vim-minimal pykickstart git koji telnet createrepo busybox wget

mock -r fedora-35-x86_64 --shell --isolation=simple --enable-network 

git clone --recurse-submodules https://github.com/raro28/workstation.git

git submodule update --remote

/var/lib/mock/fedora-35-x86_64/root/builddir

rm -rf /var/lmc *.log *.ks /var/run/anaconda.pid /tmp/rpms

git stash && git pull origin develop && git stash pop

./workstation/local-repo
 
ksflatten --config workstation/desktop-workstation.ks -o flat-desktop-workstation.ks --version F35
livemedia-creator --ks flat-desktop-workstation.ks --no-virt --resultdir /var/lmc --project Desktop-Workstation-Live --make-iso --volid Desktop-Workstation-35 --iso-only --iso-name Desktop-Workstation-35.iso --releasever 35

livecd-creator -c flat-desktop-workstation.ks -f desktop-workstation -t /var/lmc

ksflatten --config workstation/laptop-workstation.ks -o flat-laptop-workstation.ks --version F35
livemedia-creator --ks flat-laptop-workstation.ks --no-virt --resultdir /var/lmc --project Laptop-Workstation-Live --make-iso --volid Laptop-Workstation-35 --iso-only --iso-name Laptop-Workstation-35.iso --releasever 35