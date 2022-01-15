%include ./gnome-workstation.ks
%include ./workstation.ks

network --hostname=mumei

%packages

-virtualbox-guest-additions
-zram-generator
-zram-generator-defaults

kernel-5.13.9-200.fc34.x86_64
kernel-devel-5.13.9-200.fc34.x86_64

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
          <connector>eDP-1</connector>
          <vendor>AUO</vendor>
          <product>0x143d</product>
          <serial>0x00000000</serial>
        </monitorspec>
        <mode>
          <width>1920</width>
          <height>1080</height>
          <rate>60.049468994140625</rate>
        </mode>
      </monitor>
    </logicalmonitor>
    <disabled>
      <monitorspec>
        <connector>DP-1</connector>
        <vendor>DEL</vendor>
        <product>DELL S2721DGF</product>
        <serial>CCMRP83</serial>
      </monitorspec>
    </disabled>
  </configuration>
</monitors>
EOF

chown ekthor:ekthor ~ekthor/.config/monitors.xml

cp -f ~ekthor/.config/monitors.xml ~gdm/.config/monitors.xml
chown gdm:gdm ~gdm/.config/monitors.xml 
restorecon ~gdm/.config/monitors.xml

printf "\nexclude=kernel*\n" >> /etc/dnf/dnf.conf

%end