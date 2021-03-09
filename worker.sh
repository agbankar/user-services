#!/bin/bash
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
swapoff -a
echo net.bridge.bridge-nf-call-ip6tables = 1 >> /etc/sysctl.conf
echo net.bridge.bridge-nf-call-iptables = 1 >> /etc/sysctl.conf
modprobe br_netfilter
sysctl -p
yum install -y docker kubelet kubeadm kubectl kubernetes-cni
systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet
#--pod-network-cidr=10.244.0.0/16
