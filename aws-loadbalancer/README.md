# Deploy Load Balancer on EKS

https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

Only execute if IAM policy has been created as per above document.

Note: Add Account ID before Execute below command.

kubectl apply -f alb-loadbalancer/aws-load-balancer-controller-service-account.yaml

OR 

eksctl create iamserviceaccount \
  --cluster=my_cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve      




kubectl apply \
    --validate=false \
    -f https://github.com/jetstack/cert-manager/releases/download/v1.1.1/cert-manager.yaml
    
curl -o v2_2_0_full.yaml https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/v2_2_0_full.yaml

kubectl apply -f v2_2_0_full.yaml

kubectl get deployment -n kube-system aws-load-balancer-controller
