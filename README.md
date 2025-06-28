# WordPress_Docker_Deployment

This project demonstrates how to deploy a WordPress website and its MySQL database using Docker containers on a local machine. Both services run in isolated containers connected via a dedicated Docker network.

---

##  Project Phases

- **Phase 1 – Local Deployment (Main Branch)**:  
  Deploy WordPress and MySQL using Docker Compose on a local development environment.

- **Phase 2 – Cloud Deployment (`phase-2-cloud` Branch)**:  
  Provision and configure an EC2 instance on AWS using Terraform and Ansible, then deploy WordPress in the cloud.

---

##  Local Deployment Overview (Phase 1)

- WordPress and MySQL run in separate containers.
- Containers are connected via a Docker bridge network.
- Persistent volumes are used for MySQL data.
- Docker Compose manages the services.

---

##  How to Run Locally

### 1. Clone the Repository
```bash
git clone https://github.com/Code-Paragon/Docker_WordPress_Deployment.git
cd Docker_WordPress_Deployment
```
2. Start Docker Services
```
docker-compose up -d
```
3. Access the Site
Navigate to http://localhost:8080 in your browser.

## Stack
- Docker

- Docker Compose

- WordPress (6.8.1)

- MySQL (8.0)

## Project Structure
```
Docker_WordPress_Deployment/
│
├── docker-compose.yml
├── .env                 # Environment variables
├── README.md
```

## To Stop Containers
```
docker-compose down
```

### Want to See It on the Cloud?
Check out the phase-2-cloud branch to see how this same application is deployed using Terraform and Ansible on AWS EC2.
