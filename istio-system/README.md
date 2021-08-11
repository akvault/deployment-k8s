# Deploy Istio on EKS

```echo 'export ISTIO_VERSION="1.10.0"' >> ${HOME}/.bash_profile```

```source ${HOME}/.bash_profile```

```cd ~/environment```
```curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} sh -```

```cd ${HOME}/environment/istio-${ISTIO_VERSION}```

```sudo cp -v bin/istioctl /usr/local/bin/```

```istioctl version --remote=false```

```yes | istioctl install --set profile=demo```

```kubectl -n istio-system get svc```



