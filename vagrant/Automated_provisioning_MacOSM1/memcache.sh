#!/bin/bash
mv /etc/yum.repos.d/fedora-updates.repo /tmp/
mv /etc/yum.repos.d/fedora-updates-modular.repo /tmp/
yum clean all
yum update
sudo yum install epel-release -y
sudo yum install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached
firewall-cmd --add-port=11211/tcp --permanent
firewall-cmd --reload
sed -i 's/OPTIONS="-l 127.0.0.1"/OPTIONS=""/' /etc/sysconfig/memcached
sudo systemctl restart memcached

sudo memcached -p 11211 -U 11111 -u memcached -d
