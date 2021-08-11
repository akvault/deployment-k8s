# Demo Terraform - Provision an EKS Cluster

**AWS VPC Module** - https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/11.0.0

**vpc.tf** -> provisions a VPC, subnets and availability zones using the AWS VPC Module.

**security-groups.tf** ->  provisions the security groups used by the EKS cluster.

**eks-cluster.tf** ->  provisions all the resources (AutoScaling Groups) required to set up an EKS cluster using the AWS EKS Module.

**outputs.tf** -> defines the output configuration.

**versions.tf** -> sets the Terraform version to at least 0.14. It also sets versions for the providers used in this context.

## **prerequisite**

  - AWS Account 
  
  - AWS CLI 
  
  - Kubectl 
  
  - Service user with access key and secret key 
  
  - IAM policy associated with service user
  
  - Terraform installation (https://www.terraform.io/downloads.html  - Based on client)
  

## Execution

  ```git clone https://github.com/akvault/deployment-k8s.git```

  ```cd deployment-k8s/terraform-provision```

  ```terraform init```

  ```terraform plan```

  ```terraform apply```
  
## Configure kubectl

  Now that you've provisioned your EKS cluster, you need to configure kubectl. Run the following command to retrieve the access credentials for   your cluster and automatically configure kubectl

  aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
  
## Deploy Kubernetes Metrics Server

  - wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz
  - kubectl apply -f metrics-server-0.3.6/deploy/1.8+/
  - kubectl get deployment metrics-server -n kube-system

