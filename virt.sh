#!/bin/bash

yay -S --needed qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs
sudo systemctl start libvirtd.service
sudo systemctl enable libvirtd.service
sudo sed -i '$a unix_sock_group = \"libvirt\"' /etc/libvirt/libvirtd.conf
sudo sed -i '$a unix_sock_ro_perms = \"0777\"' /etc/libvirt/libvirtd.conf
sudo sed -i '$a unix_sock_rw_perms = \"0770\"' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt priyanshu
sudo systemctl restart libvirtd.service
sudo virsh net-start default
