%packages

binutils-devel
cmake
dejavu-sans-mono-fonts
fontconfig-devel
gcc
gcc-c++
libglvnd-devel
libX11-devel
libXcursor-devel
libXfixes-devel
libXi-devel
libXinerama-devel
libxkbcommon-x11-devel
libXpresent-devel
libXrandr-devel
libXScrnSaver-devel
make
nettle-devel
pkgconf-pkg-config
SDL2-devel
SDL2_ttf-devel
spice-protocol
texlive-gnu-freefont
wayland-devel
wayland-protocols-devel

%end

%post --erroronfail

cat <<EOF > /etc/tmpfiles.d/10-looking-glass.conf
f	/dev/shm/looking-glass	0660	ekthor	kvm	-
EOF

%end