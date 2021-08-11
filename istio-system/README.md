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

```kubectl label namespace vote istio-injection=enabled --overwrite```

# Install Grafana and Prometheus

```export ISTIO_RELEASE=$(echo $ISTIO_VERSION |cut -d. -f1,2)```

### Install Prometheus
```kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-${ISTIO_RELEASE}/samples/addons/prometheus.yaml```

### Install Grafana
```kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-${ISTIO_RELEASE}/samples/addons/grafana.yaml```


# Kiali

```kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-${ISTIO_RELEASE}/samples/addons/kiali.yaml```

``` kubectl apply -f istio-system/istio-ingress.yaml```

