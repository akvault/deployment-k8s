# Deploy Kubernetes Dashboard

  kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
  
  kubectl proxy
  
  (http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

## Authenticate the dashboard

To use the Kubernetes dashboard, you need to create a ClusterRoleBinding and provide an authorization token. This gives the cluster-admin permission to access the kubernetes-dashboard. Authenticating using kubeconfig is not an option. You can read more about it in the Kubernetes documentation.

In another terminal (do not close the kubectl proxy process), create the ClusterRoleBinding resource.

   ```kubectl apply -f kube-dashboard/kubernetes-dashboard-admin.rbac.yaml```
   
Then, generate the authorization token.
   
   ```kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep service-controller-token | awk '{print $1}')```
   
Select "Token" on the Dashboard UI then copy and paste the entire token you receive into the dashboard authentication screen to sign in. You are now signed in to the dashboard for your Kubernetes cluster.

Navigate to the "Cluster" page by clicking on "Cluster" in the left navigation bar. You should see a list of nodes in your cluster.
