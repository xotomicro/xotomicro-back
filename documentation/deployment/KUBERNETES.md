<h1 align="center">Microservices frontend Kubernetes 👋</h1>

### 👷 PREREQUISITE K8
- Java version 11 (at least)
- Maven
- Minikube environment
- Kubectl environment
- Skaffold environment
- Helm environment

### 🕸 RUNNING THE APP K8 (PRODUCTION)
``` shell
sh ./scripts/docker/clean.sh # delete all docker instances
sh ./scripts/kubernetes/clean.sh # delete all kubernetes instances
# before running this step make sure that docker desktop has the sufficiant resources 
sh ./scripts/kubernetes/minikube.sh # start start minikube 
eval $(minikube docker-env) # switch to minikube environment
sh ./scripts/kubernetes/helm.sh # install dependencies for cluster
mvn clean install -Dmaven.test.skip # install local dependencies for app 

skaffold run --no-prune=false --cache-artifacts=false # deploy to minikube instance 
# if the above does not work run this before : docker-compose --env-file=.env build # build service with docker
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
kubectl delete --all pods --namespace=foo # deletes all namespaces pods with name foo
kubectl delete --all deployments --namespace=foo # deletes all namespaces with name foo
kubectl delete --all namespaces # deletes all
kubectl apply -f ./kubernetes # starts all yaml files inside yaml file folder
kubectl get pods # Get all pods
kubectl get deployment # Get all deployment
kubectl logs -f pod/{pod_name} # Tail log of a pod
kubectl apply -f {yaml_file} # Deploy by yaml file
kubectl delete -f {yaml_file} # Delete deployment by yaml file
``` 

### 👩🏻‍💻 DEBUGGING
``` shell
kubectl logs pod/${POD_HASH} # get pod hash from kubectl get pod 
watch kubectl get pod # install watch then watch the state of each pod (htop for more)
kubectl describe pod/ # get an overview of the pods state
kubectl get all -A  # get all 
kubectl get pods # check the pods installed
kubectl get svc -A # check the services installed
``` 

### 🚀 DEPLOY MANUALLY

```shell
# services
kubectl apply -f  kubernetes/eureka-service.yaml
kubectl apply -f  kubernetes/authservice-service.yaml
kubectl apply -f  kubernetes/elasticsearch-service.yaml
kubectl apply -f  kubernetes/eventservice-service.yaml
kubectl apply -f  kubernetes/external-gateway-service.yaml
kubectl apply -f  kubernetes/internal-gateway-service.yaml
kubectl apply -f  kubernetes/kafka-service.yaml
kubectl apply -f  kubernetes/orderservice-service.yaml
kubectl apply -f  kubernetes/productservice-service.yaml
kubectl apply -f  kubernetes/userservice-service.yaml
kubectl apply -f  kubernetes/zookeeper-service.yaml

# deployment
kubectl apply -f kubernetes/eureka-deployment.yaml 
kubectl apply -f  kubernetes/authservice-deployment.yaml
kubectl apply -f  kubernetes/elasticsearch-deployment.yaml
kubectl apply -f  kubernetes/eventservice-deployment.yaml
kubectl apply -f  kubernetes/external-gateway-deployment.yaml
kubectl apply -f  kubernetes/internal-gateway-deployment.yaml
kubectl apply -f  kubernetes/kafka-deployment.yaml
kubectl apply -f  kubernetes/order-db-deployment.yaml
kubectl apply -f  kubernetes/order-redis-deployment.yaml
kubectl apply -f  kubernetes/orderservice-deployment.yaml
kubectl apply -f  kubernetes/product-db-deployment.yaml
kubectl apply -f  kubernetes/product-redis-deployment.yaml
kubectl apply -f  kubernetes/productservice-deployment.yaml
kubectl apply -f  kubernetes/user-db-deployment.yaml
kubectl apply -f  kubernetes/userservice-deployment.yaml
kubectl apply -f  kubernetes/zookeeper-deployment.yaml
```