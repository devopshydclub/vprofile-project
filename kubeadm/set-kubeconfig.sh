  mkdir -p $HOME/.kube
  sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  sudo mkdir -p /home/vagrant/.kube
  sudo cp -f /etc/kubernetes/admin.conf /home/vagrant/.kube/config
  sudo chown -R vagrant.vagrant /home/vagrant/.kube