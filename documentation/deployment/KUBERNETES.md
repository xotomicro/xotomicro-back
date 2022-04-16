### 👷 PREREQUISITE K8
- Java version 11 (at least)
- Maven
- Minikube environment
- Kubectl environment
- Skaffold environment
- Helm environment

### 🕸 RUNNING THE APP K8 (PRODUCTION)
``` shell
sh ./scripts/kubernetes/clean.sh # delete all
sh ./scripts/kubernetes/minikube.sh # start start minikube 
sh ./scripts/kubernetes/helm.sh # install dependencies 
mvn clean install -Dmaven.test.skip # install local app 
skaffold run --no-prune=false --cache-artifacts=false # deploy to minikube instance
kubectl get pods # check the pods installed
```

### 🎁 MINIKUBE 
``` shell
minikube start # START MINIKUBE
minikube addons enable ingress # ENABLE INGRESS CONTROLLER
minikube tunnel # MAKE NETWORK BRIDGE
minikube service {SERVICE} --url 
```

### 🏃 HELM 
``` shell
helm repo add bitnami https://charts.bitnami.com/bitnami # ADD BITNAMI REPOSITORY
helm repo add datawire https://www.getambassador.io # ADD EDGE STACK REPOSITORY
helm repo update # REPOSITORY UPDATE
helm install kafka bitnami/kafka # KAFKA INSTALL
helm install keycloak bitnami/keycloak # KEYCLOAK INSTALL
```

### 🔨 SKAFFOLD 
``` shell
skaffold dev # BUILD AND RUN BACKEND IN DEVELOPMENT MODE
skaffold debug # BUILD AND RUN BACKEND IN DEBUG MODE
skaffold run # BUILD AND RUN BACKEND IN PRODUCTION MODE
```

### 👩🏻‍💻 HELPFULL COMMANDS 
``` shell
# KUBECTL
kubectl delete --all pods --namespace=foo
kubectl delete --all deployments --namespace=foo
kubectl delete --all namespaces
``` 