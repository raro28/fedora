%include ./fedora-kickstarts/fedora-live-workstation.ks
%include ./clean.ks
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

part / --fstype="ext4" --size=13000

shutdown

%packages

cups
system-config-printer

google-chrome-stable
thunderbird
gnome-tweaks
gnome-extensions-app

skypeforlinux
teams
slack
discord

snapd
awscli

%end

%post

ln -s /var/lib/snapd/snap /snap

%end

services --enabled snapd
services --enabled cups
services --enabled cups-browsed