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
