%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./clean.ks
%include ./rpmfusion.ks
%include ./virtualization.ks
%include ./qmk.ks
%include ./base-workstation.ks

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=mono-stable --baseurl=https://download.mono-project.com/repo/centos7-stable/
repo --name=slack --baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64

part / --fstype="ext4" --size=13000

%packages

google-chrome-stable.x86_64
python3.9

steam
thunderbird
skypeforlinux
teams
slack

clang
cmake
gtk3-devel

awscli

%end