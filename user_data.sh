#!/bin/bash
apt-get update -y
apt-get install -y docker.io docker-compose openjdk-11-jdk curl gnupg unzip git

systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

# Jenkins install
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update -y
apt-get install -y jenkins
systemctl start jenkins
systemctl enable jenkins

# SonarQube
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts-community

# Trivy
wget https://github.com/aquasecurity/trivy/releases/latest/download/trivy_0.51.1_Linux-64bit.deb
dpkg -i trivy_0.51.1_Linux-64bit.deb
