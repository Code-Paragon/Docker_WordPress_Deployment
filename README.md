#  WordPress + MySQL Deployment on Kubernetes (Minikube)

This project demonstrates a local deployment of WordPress and MySQL using Kubernetes (via Minikube) and Docker. Both applications run in separate containers and communicate over a Kubernetes-managed internal network. Persistent volumes ensure data durability across restarts.

---

##  Project Phase

>  **Phase 1: Local Deployment via Minikube with Manual YAMLs**

---

## Project Structure

```bash
WordPress_Docker_Deployment/
├── mysql-pv.yaml
├── wordpress-pv.yaml
├── mysql-deployment.yaml
├── mysql-service.yaml
├── wordpress-deployment.yaml
├── wordpress-service.yaml
└── README.md
```
## Tech Stack

* **Orchestration:** Minikube (Kubernetes Cluster)
* **Containerization:** Docker Engine
* **CLI Tool:** kubectl
* **Application:** WordPress (Latest)
* **Database:** MySQL (v5.7)
* **Configuration:** YAML Manifests (K8s native)
* **Networking:** NodePort + Port Forwarding

## Prerequisites

Before you begin, ensure you have the following tools installed on your local machine:

* **Minikube:** [Installation Guide](https://minikube.sigs.k8s.io/docs/start/)
* **Docker:** [Installation Guide](https://docs.docker.com/engine/install/) (or another container runtime compatible with Minikube)
* **kubectl:** [Installation Guide](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Step-by-Step Instructions

# 1. Start Minikube with Docker Driver
```bash
minikube start --driver=docker --memory=4096 --cpus=2
```
# 2. Enable Ingress (Optional)
```
minikube addons enable ingress
```
# 3. Create Namespace
```
kubectl create namespace wordpress-local
```
# 4. Apply YAML Files
```
kubectl apply -f mysql-pv.yaml
kubectl apply -f wordpress-pv.yaml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
kubectl apply -f wordpress-deployment.yaml
kubectl apply -f wordpress-service.yaml
```
# 5. Pull WordPress Image (if stuck)
```
docker pull wordpress:latest
minikube image load wordpress:latest
kubectl rollout restart deployment wordpress -n wordpress-local
```
# 6. Port Forward WordPress
```
kubectl port-forward -n wordpress-local service/wordpress 8080:80
```

**Then open:**
```
http://localhost:8080
```
---
## Result
You should see the WordPress installation screen, and after setup, the full admin dashboard like this:
![4](https://github.com/user-attachments/assets/19e85124-3db0-4b26-8c8e-a3551dbe986f)
