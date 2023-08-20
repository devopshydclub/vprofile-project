#!/bin/bash
sudo mv /etc/yum.repos.d/fedora-updates.repo /tmp/
sudo mv /etc/yum.repos.d/fedora-updates-modular.repo /tmp/
sudo yum clean all
#sudo yum update -y
echo "SElinux changes."
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config 
setenforce 0
echo
echo
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash
sudo yum clean all
sudo yum makecache
sudo yum install erlang -y
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
sudo yum install rabbitmq-server -y
rpm -qi rabbitmq-server
systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
firewall-cmd --add-port=5671/tcp --permanent
firewall-cmd --add-port=5672/tcp --permanent
firewall-cmd --reload
sudo systemctl restart rabbitmq-server
nohup sleep 30 &&  reboot &
echo "going to reboot now"
