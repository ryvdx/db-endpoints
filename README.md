# db-endpoints
Did you just want a simple way to get an instance of Oracle and or SQL Server up and running for development and testing?
Yeah, so did I.

Getting Oralce and SQL Server up and running on an M1 Mac is frustrating, it seems (at the time I did this), that neither SQL Server and Oracle have "developer-friendly" containers ready for arm64 out of the box.  This was just a simple solution to get some basic database endpoints running on AWS EC2's.

# What's in the box?
1. MSSQL Express Edition
2. Oracle Community Edition
3. Portainer to check logs of the above and see basic resource usage stats
4. health-check endpoint (nginx) (to hit with something like AWS ELB health check so you can simplify SSL/TLS and inbound access to something like whitelisted IPs)

# AWS recommended setup
1. Setup security group that 
2. Create EC2 (AWS Linux type), t2.large or larger.  (About a cup of coffee/day... just shut it down at the end of the day.)
3. Run this behind a classic ELB using AWS ACM for SSL.
4. Setup the ELB healthcheck for HTTP:80/index.html (Will use the hello-world nginx for the health check.)

# AWS EC2 Setup
After SSH-ing into the instance, run the following
```
sudo su
sudo yum install docker git -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mv /usr/local/bin/docker-compose /bin/docker-compose
```

# Setup
```
sudo git clone https://github.com/ryvdx/ryvealedgetest.git /var/lib/db-endpoints
```

# Edit Portainer password
Create a new password for portainer using bcrypt, and replace that in /var/lib/db-endpoints/docker-compose.yaml in the portainer command line.  (Just make sure it meets the portainer minimum complexity
https://bcrypt.online/

# Then Run
```
cd /var/lib/db-endpoints
docker-compose up -d
```

