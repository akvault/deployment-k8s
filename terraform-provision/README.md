# Demo Terraform - Provision an EKS Cluster

**AWS VPC Module** - https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/11.0.0

**vpc.tf** -> provisions a VPC, subnets and availability zones using the AWS VPC Module.

**security-groups.tf** ->  provisions the security groups used by the EKS cluster.

**eks-cluster.tf** ->  provisions all the resources (AutoScaling Groups) required to set up an EKS cluster using the AWS EKS Module.

**outputs.tf** -> defines the output configuration.

**versions.tf** -> sets the Terraform version to at least 0.14. It also sets versions for the providers used in this context.

**Execution**

git clone https://github.com/akvault/deployment-k8s.git

cd deployment-k8s/terraform-provision

terraform init

terraform plan

terraform apply


