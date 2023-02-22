```
git clone --recurse-submodules https://github.com/raro28/workstation.git -b develop

git submodule update --remote

DE=xfce
HW=desktop
sudo setenforce 0

sudo rm -rf /data/home/$USER/live/{lc,flat-$DE-$HW-workstation.ks}

ksflatten --config workstation/$DE-$HW-workstation.ks -o /data/home/$USER/live/flat-$DE-$HW-workstation.ks --version F37

sudo livecd-creator -c /data/home/$USER/live/flat-$DE-$HW-workstation.ks -f $DE-$HW-workstation -t /data/home/$USER/live/lc --cache=/data/home/$USER/live/cache --nocleanup --verbose

```