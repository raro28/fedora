%include ./rpmfusion.ks
%include ./virtualization.ks
%include ./qmk.ks
%include ./base-workstation.ks
%include ./obe.ks
%include ./rebrand.ks

repo --name=google --baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
repo --name=teams --baseurl=https://packages.microsoft.com/yumrepos/ms-teams
repo --name=skype-stable --baseurl=https://repo.skype.com/rpm/stable/
repo --name=mono-stable --baseurl=https://download.mono-project.com/repo/centos7-stable/
repo --name=slack --baseurl=https://packagecloud.io/slacktechnologies/slack/fedora/21/x86_64

url --url="file:///home/ekthor/Projects/rpms"
repo --name="local" --baseurl=file:///home/ekthor/Projects/rpms

part / --fstype="ext4" --size=13000

shutdown

%packages

cups
system-config-printer
at

google-chrome-stable
thunderbird
overgrive

skypeforlinux
teams
slack
discord
telegram-desktop

veracrypt

flatpak
awscli

%end

%post

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

grubby --args="delayacct" --update-kernel=ALL

%end

services --enabled cups
services --enabled cups-browsed
services --enabled atd