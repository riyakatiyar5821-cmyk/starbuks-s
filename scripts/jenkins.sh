#install jankin by the officel websit 
#!/bin/bash
#this Script belong to Cloudaseem Youtube channel #####
# jenkins installation on ubuntu 
sudo apt update -y
sudo apt install fontconfig openjdk-17-jre -y
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y 
sudo systemctl enable jenkins
sudo systemctl start jenkins



#install jankin by the docker most importent
#!/bin/bash

# Install Docker
echo "Installing Docker..."
sudo apt update -y
sudo apt install -y docker.io

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Remove old container if exists
sudo docker rm -f jenkins 2>/dev/null

# Run Jenkins
echo "Starting Jenkins container..."
sudo docker run -d \
  --name jenkins \
  --restart always \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts

# Wait for Jenkins to start
echo "Waiting for Jenkins to initialize (60 seconds)..."
sleep 60

# Get admin password
echo "========================================="
echo "Jenkins is Ready!"
echo "========================================="
echo ""
echo "Access Jenkins at: http://13.235.133.48:8080"
echo ""
echo "Initial Admin Password:"
sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
echo ""
echo "========================================="
echo "Container Status:"
sudo docker ps
echo "========================================="
