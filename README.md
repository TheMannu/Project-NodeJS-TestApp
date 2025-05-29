# Node.js Application Deployment with MongoDB and Mongo Express Containers
This is a simple Node.js application designed for testing infrastructure environments. The application provides a basic web server that can be used to verify proper deployment, network connectivity, and environment configuration.

## Overview
This guide explains how to:
1. Set up a Node.js application on the host machine
2. Run MongoDB and Mongo Express in Docker containers
3. Manage the application lifecycle

## Prerequisites
- Ubuntu Linux system
- [Example Node.js Application](https://github.com/TheMannu/Project-NodeJS-TestApp.git)
- Basic command line knowledge
- Docker (installation covered below)

---

## Phase 1: Node.js Application Setup

### 1. System Preparation
```bash
sudo apt update && sudo apt upgrade -y  # Update system packages
sudo apt install nodejs npm -y         # Install Node.js and npm
```

Verify installations:
```bash
node --version
npm --version
```

### 2. Application Setup
```bash
git clone https://github.com/TheMannu/Project-NodeJS-TestApp.git
cd Project-NodeJS-TestApp
npm install  # Install dependencies
```

### 3. Initial Test Run
```bash
node server.js  # Runs in foreground (Ctrl+C to stop)
```
*Note: Database connection errors are expected at this stage.*

---

## Phase 2: Production Process Management

### Option A: PM2 (Recommended)
```bash
sudo npm install -g pm2
pm2 start server.js    # Start application
pm2 save              # Save process list
pm2 startup           # Enable auto-start on boot
```

Management commands:
```bash
pm2 list              # View running applications
pm2 logs              # View application logs
```
Verify Application 
```bash
curl http://<Public IP>:5050  # Test application
```
---

## Phase 3: Docker Setup

### 1. Docker Installation
```bash
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker $USER  # Add user to docker group
```
*Log out and back in for group changes to take effect.*

Verify installation:
```bash
sudo systemctl status docker
```

Verify installation By Running a test Container:
```bash
docker run hello-world
```
