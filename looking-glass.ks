%packages

binutils-devel
cmake
texlive-gnu-freefont
fontconfig-devel
SDL2-devel
SDL2_ttf-devel
spice-protocol
libX11-devel
nettle-devel
wayland-protocols-devel
gcc
libXScrnSaver-devel
libXfixes-devel
libXi-devel
wayland-devel
libXinerama-devel

%end

%post --erroronfail

cat <<EOF > /etc/tmpfiles.d/10-looking-glass.conf
f	/dev/shm/looking-glass	0660	ekthor	kvm	-
EOF

%end