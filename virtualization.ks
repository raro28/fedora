repo --name=docker-ce-stable --baseurl=https://download.docker.com/linux/fedora/$releasever/$basearch/stable

%packages
@Virtualization --optional
libguestfs-tools
VirtualBox
kernel-devel
akmod-VirtualBox
-docker
-docker-client
-docker-client-latest
-docker-common
-docker-latest
-docker-latest-logrotate
-docker-logrotate
-docker-selinux
-docker-engine-selinux
-docker-engine
docker-ce
docker-ce-cli
containerd.io

%end