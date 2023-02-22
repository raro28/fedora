```
git clone --recurse-submodules https://github.com/raro28/workstation.git -b develop

git submodule update --remote

sudo rm -rf /data/home/$USER/lc *.ks

DE=xfce
HW=desktop
sudo setenforce 0

ksflatten --config workstation/$DE-$HW-workstation.ks -o flat-$DE-$HW-workstation.ks --version F37

sudo livecd-creator -c flat-$DE-$HW-workstation.ks -f $DE-$HW-workstation -t /data/home/$USER/lc --cache=/data/home/$USER/live/$DE-$HW-workstation --nocleanup --verbose

```