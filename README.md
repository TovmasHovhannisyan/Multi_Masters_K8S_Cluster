## Deploying High Avialable  Kubernetes cluter with Ansible

###  Description 

This project will help to deploy Multimaster  Kubernetes cluster with  stacked control plane nodes. We will use the Hetzner cloud environment and will use Terraform for creating necessary components in that environment.  The usage of ansible-playbook will automate the Kubernetes installation process, cluster initialization, joining all worker and master nodes.
The usage of Terraform helps to create an inventory file for Ansible automatically, after creating necessary components.

>### Pre-requirements
 >1. Already installed [Ansible](https://docs.ansible.com/>ansible/latest/installation_guide/intro_installation.html)
 >2. Account in [Hetzner cloud](https://www.hetzner.com/cloud)

 ### Steps for deploymant 
  > First of all, you need to mention the necessary values in **Multi_Masters_K8S Cluster/Hetzner Terraform/variables.tf** file (you must put there the API token that you will [generate](https://vocon-it.com/2018/03/21/testing-the-hetzner-cloud-api-via-curl-iaas-automation/) in your Hetzner account  ) .Also, you can change the default values for all variables in the same file, or you can give them new value in **Multi_Masters_K8S_Cluster/Hetzner_terraform/terraform.tfvars** which will overwrite the default values.

1. Creating necessary compute resources:
 * Initialize the terraform with executing following command in  **Hetzner_terraform/** directory :
    ```
     $ Terraform init 
    ```
 * Create all resources: 
   > You can check the exact resources that will be created due "Terraform apply" by using a command terraform plan.
    ```
    $Terraform apply     
    ```
    In the end, we will have 3 servers for master nodes, 3 servers for worker nodes, and one node for Haproxy. Also, we will have a private network where will be all our servers and SSH key for accessing those servers.
    > In our case, we will use HAProxy as TCP load balancer which will distribute traffic to all healthy control plane nodes in its target list.

2. Initialize the Kubernetes cluster.
  
   * Execute the following command in k8s_multi_master_ansible/ directory: 
    ``` 
    $asnible-playbook -i hosts playbook.yaml 
    ``` 
    > As we mentioned above the inventory file ("hosts ") will be created automatically by Terraform after environment creation.