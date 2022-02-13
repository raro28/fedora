%include ./gnome-workstation.ks
%include ./base-workstation.ks
%include ./clean.ks
%include ./looking-glass.ks

network --hostname=mumei

%packages

-virtualbox-guest-additions
akmod-nvidia
xorg-x11-drv-nvidia-cuda

vfio-gpu-passthrough-scripts
qemu-hook-scripts

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
EOF

export KERNEL="$(rpm -q kernel --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n' | tail -1;)"
export NVIDIA="$(rpm -q akmod-nvidia --qf '%{VERSION}-%{RELEASE}.%{ARCH}\n')"

sudo -u liveuser akmodsbuild -k $KERNEL /usr/src/akmods/nvidia-kmod.latest -o /tmp
rpm -ivh "/tmp/kmod-nvidia-$KERNEL-$NVIDIA.rpm"

grubby --args="amd_iommu=on iommu=pt rd.driver.pre=vfio-pci" --update-kernel=ALL

%end

%post --erroronfail

mkdir ~ekthor/.config
chown ekthor:ekthor -R ~ekthor/.config

cat <<EOF > ~ekthor/.config/monitors.xml
<monitors version="2">
  <configuration>
    <logicalmonitor>
      <x>0</x>
      <y>0</y>
      <scale>1</scale>
      <primary>yes</primary>
      <monitor>
        <monitorspec>
          <connector>HDMI-0</connector>
          <vendor>auto</vendor>
          <product>DELL S2721DGF</product>
          <serial>CCMRP83</serial>
        </monitorspec>
        <mode>
          <width>2560</width>
          <height>1440</height>
          <rate>143.91154479980469</rate>
        </mode>
      </monitor>
    </logicalmonitor>
    <disabled>
      <monitorspec>
        <connector>DVI-D-0</connector>
        <vendor>GGF</vendor>
        <product>MG700</product>
        <serial>0000000000000</serial>
      </monitorspec>
    </disabled>
  </configuration>
  <configuration>
    <logicalmonitor>
      <x>0</x>
      <y>0</y>
      <scale>1</scale>
      <primary>yes</primary>
      <monitor>
        <monitorspec>
          <connector>HDMI-0</connector>
          <vendor>DEL</vendor>
          <product>DELL S2721DGF</product>
          <serial>CCMRP83</serial>
        </monitorspec>
        <mode>
          <width>2560</width>
          <height>1440</height>
          <rate>143.91154479980469</rate>
        </mode>
      </monitor>
    </logicalmonitor>
    <disabled>
      <monitorspec>
        <connector>DVI-D-0</connector>
        <vendor>GGF</vendor>
        <product>MG700</product>
        <serial>0000000000000</serial>
      </monitorspec>
    </disabled>
  </configuration>
  <configuration>
    <logicalmonitor>
      <x>0</x>
      <y>0</y>
      <scale>1</scale>
      <primary>yes</primary>
      <monitor>
        <monitorspec>
          <connector>HDMI-0</connector>
          <vendor>DEL</vendor>
          <product>DELL S2721DGF</product>
          <serial>CCMRP83</serial>
        </monitorspec>
        <mode>
          <width>2560</width>
          <height>1440</height>
          <rate>143.91154479980469</rate>
        </mode>
      </monitor>
    </logicalmonitor>
    <disabled>
      <monitorspec>
        <connector>DVI-D-0</connector>
        <vendor>BNQ</vendor>
        <product>BenQ GW2480</product>
        <serial>53L0069001Q</serial>
      </monitorspec>
    </disabled>
  </configuration>
</monitors>
EOF

chown ekthor:ekthor ~ekthor/.config/monitors.xml

cp -f ~ekthor/.config/monitors.xml ~gdm/.config/monitors.xml
chown gdm:gdm ~gdm/.config/monitors.xml 
restorecon ~gdm/.config/monitors.xml

%end