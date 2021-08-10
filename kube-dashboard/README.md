# Deploy Kubernetes Dashboard

  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
  
  kubectl proxy
  
  (http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

## Authenticate the dashboard

   kubectl apply -f kube-dashboard/
