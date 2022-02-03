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
repo --name=microsoft-edge --baseurl=https://packages.microsoft.com/yumrepos/edge
repo --name="local" --baseurl=http://127.0.0.1:8000

part / --fstype="ext4" --size=14000

shutdown

%packages

powerpanel
epson-inkjet-printer-201215w-1.0.0-1lsb3.2.x86_64

microsoft-edge-stable
google-chrome-stable
overgrive

skypeforlinux
teams
slack
discord
telegram-desktop

pspp
awscli
mongodb-compass

%end

%post

grubby --args="delayacct" --update-kernel=ALL

%end

services --enabled sshd