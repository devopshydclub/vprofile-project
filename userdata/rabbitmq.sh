#!/bin/bash
sudo yum update -y
sudo yum install epel-release -y
sudo yum install socat -y
sudo yum install erlang -y
sudo yum install wget -y
cd /tmp/
wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.10/rabbitmq-server-3.6.10-1.el7.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
sudo rpm -Uvh /tmp/rabbitmq-server-3.6.10-1.el7.noarch.rpm
sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl status rabbitmq-server
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server