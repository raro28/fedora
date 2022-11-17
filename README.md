```
sudo dnf install kernel-modules-$(uname -r) mock

sudo usermod -a -G mock $USER

sudo mock -r fedora-37-x86_64 --clean

mock -r fedora-37-x86_64 --init --install lorax-lmc-novirt vim-minimal pykickstart git koji telnet createrepo busybox wget

mock -r fedora-37-x86_64 --shell --isolation=simple --enable-network 
```


```
git clone --recurse-submodules https://github.com/raro28/workstation.git -b develop

git submodule update --remote

/var/lib/mock/fedora-37-x86_64/root/builddir

rm -rf /var/lmc *.log *.ks /var/run/anaconda.pid /tmp/rpms

git stash && git pull origin develop && git stash pop

./workstation/local-repo

DE=xfce
HW=desktop

ksflatten --config workstation/$DE-$HW-workstation.ks -o flat-$DE-$HW-workstation.ks --version F37
sudo setenforce 0
sudo livemedia-creator --ks flat-$DE-$HW-workstation.ks --no-virt --resultdir /var/lmc --project $DE-$HW-workstation-live --make-iso --volid $DE-$HW-workstation-37 --iso-only --iso-name $DE-$HW-workstation-37.iso --releasever 37

livecd-creator -c flat-$DE-$HW-workstation.ks -f $DE-$HW-workstation -t /var/lmc

```