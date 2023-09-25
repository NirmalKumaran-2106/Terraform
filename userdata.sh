swapon -s
sudo dd if=/dev/zero of=/swapfile bs=1M count=3072
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
swapon -s