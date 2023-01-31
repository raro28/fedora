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

sudo rm -rf /var/lmc *.ks

git stash && git pull origin develop && git stash pop

DE=xfce
HW=desktop
sudo setenforce 0

ksflatten --config workstation/$DE-$HW-workstation.ks -o flat-$DE-$HW-workstation.ks --version F37

sudo livecd-creator -c flat-$DE-$HW-workstation.ks -f $DE-$HW-workstation -t /var/lmc --cache=/home/ekthor/live/$DE-$HW-workstation --nocleanup --verbose

```