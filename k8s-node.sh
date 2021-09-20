#!/bin/bash

# FirewallD is not running
systemctl start firewalld

firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp

firewall-cmd --reload
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables




#安装kubeadm
cp kubernetes.repo /etc/yum.repos.d/kubernetes.repo
# yum install kubeadm docker -y
yum install kubeadm -y
systemctl enable kubelet
systemctl start kubelet


#安装docker
#2.1 安装yum-utils
yum install -y yum-utils
#2.2 配置国内源
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#2.3 解决problem with installed package podman-1.6.4-10.的报错
yum erase podman buildah
#2.4 安装Docker
yum install -y docker-ce docker-ce-cli  containerd.io --nobest


systemctl enable docker
systemctl start docker

# Fix
cp daemon.json /etc/docker/

systemctl daemon-reload
systemctl restart docker
