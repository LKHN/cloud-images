# AlmaLinux 8 kickstart file for Generic Cloud (OpenStack) aarch64 image

url --url https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/kickstart/
repo --name=BaseOS --baseurl=https://repo.almalinux.org/almalinux/8/BaseOS/aarch64/os/
repo --name=AppStream --baseurl=https://repo.almalinux.org/almalinux/8/AppStream/aarch64/os/

text
skipx
eula --agreed
firstboot --disabled

lang en_US.UTF-8
keyboard us
timezone UTC --isUtc

network --bootproto=dhcp
firewall --enabled --service=ssh
services --disabled="kdump" --enabled="chronyd,rsyslog,sshd"
selinux --enforcing

# TODO: remove "console=tty0" from here
bootloader --append="console=ttyS0,115200n8 console=tty0 crashkernel=auto net.ifnames=0 no_timer_check" --location=mbr --timeout=1
zerombr
clearpart --all --initlabel
part /boot/efi --size=200 --fstype=efi
part /boot --size=1024 --fstype=xfs
part / --fstype=xfs

rootpw --plaintext almalinux

reboot --eject


%packages
@core
-biosdevname
-open-vm-tools
-plymouth
-dnf-plugin-spacewalk
-rhn*
-iprutils
-iwl*-firmware
%end


# disable kdump service
%addon com_redhat_kdump --disable
%end


%post
%end
