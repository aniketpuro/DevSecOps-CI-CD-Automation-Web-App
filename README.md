# DevSecOps-CI-CD-Automation-Web-App

---

# 🛠️ Jenkins + Trivy Setup for DevSecOps Pipeline

This project demonstrates how to set up **Jenkins** and **Trivy** on an Ubuntu system to build a secure DevSecOps CI/CD pipeline. You'll install and configure Jenkins, add Trivy for vulnerability scanning, and ensure Jenkins has access to Docker.

---

## 📋 Prerequisites

* Ubuntu 20.04+ (tested on AWS EC2 `t2.medium` or higher)
* User with `sudo` privileges
* Docker and Docker Compose installed
* Internet access

---

## ⚙️ Step-by-Step Installation

### 1️⃣ System Update

```bash
sudo apt update
```

---

### 2️⃣ Install Java (Required for Jenkins)

```bash
sudo apt install fontconfig openjdk-17-jre -y
```

---

### 3️⃣ Install Jenkins

#### Add Jenkins GPG Key:

```bash
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
```

#### Add Jenkins Repository:

```bash
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
```

#### Install Jenkins:

```bash
sudo apt-get update
sudo apt-get install jenkins -y
```

---

### 4️⃣ Install Trivy (Aqua Security)

#### Install Dependencies:

```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
```

#### Add Trivy GPG Key and Repo:

```bash
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
```

#### Install Trivy:

```bash
sudo apt-get update
sudo apt-get install trivy -y
```

---

### 5️⃣ Docker Permissions for Jenkins

Allow Jenkins and your user to run Docker commands:

```bash
sudo usermod -aG docker jenkins
sudo usermod -aG docker $USER
```

Restart services:

```bash
sudo systemctl restart docker
sudo systemctl restart jenkins
```

> ⚠️ **Reboot is required** to apply group membership changes:

```bash
sudo reboot
```

---

### 6️⃣ Verify Installations

#### Jenkins Admin Password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

#### Check Trivy Version:

```bash
trivy --version
```

#### Check Docker Access:

```bash
docker ps
```

---

## 🧪 Trivy Scanning Examples

### Scan Docker Image:

```bash
trivy image ubuntu:latest
```

### Scan File System:

```bash
trivy fs ./
```

---

## 🚀 Running Docker Compose Project

Navigate to Jenkins workspace and run the application:

```bash
cd /var/lib/jenkins/workspace/wanderlust
docker-compose down --remove-orphans
docker-compose up -d --build
```

To stop the app:

```bash
docker-compose down
```

---

## 🧹 Common Maintenance

* List Docker containers:

  ```bash
  docker ps -a
  ```

* Start a container:

  ```bash
  docker start <container_id>
  ```

* Clear screen:

  ```bash
  clear
  ```

* Check Dockerfile and rebuild image:

  ```bash
  cd backend/
  docker build -t be .
  ```

---

## ✅ Final Checklist

* [x] Java installed
* [x] Jenkins installed and running on `http://<your-ip>:8080`
* [x] Trivy installed
* [x] Docker permission granted to Jenkins
* [x] Project deployed using `docker-compose`

---

## 🙌 Credits

Inspired by **Train with Shubham's DevSecOps Bootcamp** — integrating tools like Jenkins, Trivy, SonarQube, and OWASP Dependency-Check.

---

Let me know if you want to add **SonarQube setup**, **OWASP integration**, or **Jenkins pipeline code** — I’ll update the README accordingly.
