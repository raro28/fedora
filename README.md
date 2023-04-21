```
git clone --recurse-submodules https://github.com/raro28/workstation.git -b develop

git submodule update --remote

OUTPUT=/data/home/$USER/live
DE=xfce
HW=desktop
VERSION=F38
sudo setenforce 0

sudo rm -rf $OUTPUT/{lc,flat-$DE-$HW-$VERSION-workstation.ks}

ksflatten --config workstation/$DE-$HW-workstation.ks -o $OUTPUT/flat-$DE-$HW-$VERSION-workstation.ks --version $VERSION

sudo livecd-creator -c $OUTPUT/flat-$DE-$HW-$VERSION-workstation.ks -f $DE-$HW-$VERSION-workstation -t $OUTPUT/lc --cache=$OUTPUT/cache --nocleanup --verbose

```