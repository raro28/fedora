%include ./gnome-workstation.ks
%include ./workstation.ks

%packages

-virtualbox-guest-additions
akmod-nvidia
xorg-x11-drv-nvidia-cuda

%end

%post --erroronfail

cat <<EOF > /etc/modprobe.d/nouveau-blacklist.conf
blacklist nouveau
EOF

#sudo -u ekthor akmodsbuild -k $(uname -r) /usr/src/akmods/nvidia-kmod.latest -o /opt

grubby --args="amd_cpufreq.cppc_enable=1" --update-kernel=ALL

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
</monitors>
EOF

chown ekthor:ekthor ~ekthor/.config/monitors.xml

cp -f ~ekthor/.config/monitors.xml ~gdm/.config/monitors.xml
chown gdm:gdm ~gdm/.config/monitors.xml 
restorecon ~gdm/.config/monitors.xml

%end