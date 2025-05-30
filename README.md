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

### 2. Mongo Network Setup For Communication Between Containers.
```bash
docker network create mongo-network  # Create dedicated network
```

Varify Network:
```bash
docker network ls # Should show mongo-network 
```

### 3. MongoDB Container Setup.
```bash
docker run -d -p 27017:27017 --name mongo --network mongo-network -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password mongo
```

Verify containers:
```bash
docker ps  # Should show mongo running container 
```
### 4. Mongo Express Setup
```bash
docker run -d -p 8081:8081 --name mongo-express --network mongo-network -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -e ME_CONFIG_MONGODB_URL="mongodb://admin:password@mongo:27017" mongo-express
```

Verify containers:
```bash
docker ps  # Should show both running containers 
```

### Phase 5: Verifying the Setup

Application: http://public IP:5050

Mongo Express: http://public IP:8081 (login with admin/pass)

Test database operations through your application interface and verify the data on Mongo Express Inter interface
---

## Phase 4: System Shutdown

### 1. Stop Node.js Application
For PM2:
```bash
pm2 stop server
pm2 delete server
```

For direct runs:
```bash
ps aux | grep node  # Find process ID
kill [process_id]   # Replace with actual ID
```

### 2. Stop Database Services
```bash
docker stop mongo-express mongo
docker rm mongo-express mongo
docker network rm mongo-network
```

### 3. Optional Cleanup
```bash
docker volume prune  # Remove unused volumes
```

---

## Key Notes:

1. Security considerations:
   - Default admin credentials should be changed in production
   - Network isolation is implemented via custom Docker network

2. All Docker components are ephemeral by default (data not persisted)
