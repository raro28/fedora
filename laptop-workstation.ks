%include ./gnome-workstation.ks
%include ./workstation.ks

network --hostname=mumei

%packages

-virtualbox-guest-additions
-zram-generator
-zram-generator-defaults

%end

%post --erroronfail

grubby --args="i915.enable_psr=0 i915.mitigations=off i915.disable_power_well=1 i915.enable_fbc=1" --update-kernel=ALL

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

%end