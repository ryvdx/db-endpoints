# Switch to root user
sudo su
sudo yum install docker git -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

# Setup the docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mv /usr/local/bin/docker-compose /bin/docker-compose