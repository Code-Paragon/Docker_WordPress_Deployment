#  WordPress Docker Deployment — Phase 2: Cloud Deployment on AWS

This phase focuses on provisioning AWS infrastructure and deploying a Dockerized WordPress + MySQL stack to the cloud using **Terraform** for infrastructure provisioning and **Ansible** for server configuration.

---

##  Project Overview

In **Phase 1**, we deployed WordPress and MySQL using Docker on a local machine.  
**In Phase 2**, we’ve taken that deployment to the cloud (AWS EC2) and automated the entire workflow.

Both WordPress and its MySQL database run in **separate containers** and are connected through a **Docker bridge network** on the EC2 instance.

---

##  Stack Used

- **Infrastructure Provisioning:** [Terraform](https://www.terraform.io/)
- **Server Configuration & App Deployment:** [Ansible](https://www.ansible.com/)
- **Cloud Provider:** [AWS EC2](https://aws.amazon.com/ec2/)
- **Runtime Environment:** Docker Engine
- **Services Deployed:**
    - WordPress
    - MySQL (as container)
    - Docker Network (custom bridge)

---

##  Project Structure
```
Docker_WordPress_Deployment/
│
├── terraform/
│ ├── main.tf
│ ├── provider.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── ansible/
│ ├── inventory
│ ├── site.yml
│ └── roles/
│ ├── docker/
│ └── wordpress/
│
├── scripts/
│ └── ssh-keygen.sh
│
├── .gitignore
└── README.md
```

---

##  How It Works

###  Terraform Responsibilities:
- Creates an EC2 instance
- Uploads an existing SSH key
- Opens necessary ports via a security group (22, 80, 443)
- Outputs the public IP and inventory line for Ansible

###  Ansible Responsibilities:
- Installs Docker & Docker Compose
- Deploys WordPress and MySQL containers using a `docker-compose.yml`
- Ensures both services are connected via a Docker bridge network

---

##  Deployment Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/Docker_WordPress_Deployment.git
   cd Docker_WordPress_Deployment/terraform
2. Set up your AWS credentials

    Make sure your ~/.aws/credentials and ~/.aws/config are configured properly.

3. Initialize and Apply Terraform
    ```
    terraform init
    terraform apply
    ```
4. Copy Inventory Output
After Terraform completes, copy the inventory output for Ansible:
    ```
    terraform output inventory_format > ../ansible/inventory
   ```
5. Run Ansible Playbook
    ```
    cd ../ansible
    ansible-playbook -i inventory site.yml
    ```
6. Access Your WordPress Site, Open a browser and visit:
```
http://<your-ec2-public-ip>
```
7. Teardown (Clean Up Resources)
To destroy all AWS resources:
```
cd terraform
terraform destroy
```
