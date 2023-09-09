%include ./base-workstation.ks

%post --erroronfail

cat <<EOF > /etc/modprobe.d/kvm.conf
options kvm_intel nested=1
EOF

%end