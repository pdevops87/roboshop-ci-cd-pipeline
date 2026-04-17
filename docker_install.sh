if [ "$1" = "install"  ]; then
 sudo dnf -y install dnf-plugins-core
 sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
 sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
 sudo systemctl enable docker
 sudo systemctl start docker
fi

if [ "$1" = "uninstall" ]; then
   sudo dnf remove -y dnf-plugins-core
   sudo rm -f /etc/yum.repos.d/docker-ce.repo
   sudo dnf remove -y \
      docker-ce \
      docker-ce-cli \
      containerd.io \
      docker-buildx-plugin \
      docker-compose-plugin
fi

