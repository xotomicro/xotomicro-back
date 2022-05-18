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
# NOTE: before running this step make sure that docker desktop has the sufficiant resources 
# [< 8 cors more than 12 gigs of memory]
sh ./scripts/kubernetes/minikube.sh # start start minikube 
eval $(minikube docker-env) # switch to minikube environment
sh ./scripts/kubernetes/helm.sh # install dependencies for cluster
mvn clean install -Dmaven.test.skip # install local dependencies for app 
skaffold run --no-prune=false --cache-artifacts=false --default-repo={your_docker_repo_name} # deploy to minikube instance 
# NOTE: if the above does not work run this before : 
# docker-compose --env-file=.env build # build service with docker
```

### 🎁 MINIKUBE

``` shell
minikube start # start minikube
minikube addons enable ingress # enable ingress controller
minikube tunnel # make network bridge
minikube service {SERVICE} --url 
```

### 🏃 HELM

``` shell
helm repo add bitnami https://charts.bitnami.com/bitnami # add bitnami repository
helm repo add datawire https://www.getambassador.io # add edge stack repository
helm repo update # repository update
helm install kafka bitnami/kafka # kafka install
helm install keycloak bitnami/keycloak # keycloak install
```

### 🔨 SKAFFOLD

``` shell
skaffold dev # build and run backend in development mode
skaffold debug # build and run backend in debug mode
skaffold run # build and run backend in production mode
```

### 👩🏻‍💻 HELPFULL COMMANDS

``` shell
# KUBECTL
kubectl delete --all pods --namespace=foo # deletes all namespaces pods with name foo
kubectl delete --all deployments --namespace=foo # deletes all namespaces with name foo
kubectl delete --all namespaces # deletes all
kubectl apply -f ./kubernetes # starts all yaml files inside yaml file folder
kubectl get pods # get all pods
kubectl get deployment # get all deployment
kubectl logs -f pod/{pod_name} # tail log of a pod
kubectl apply -f {yaml_file} # deploy by yaml file
kubectl delete -f {yaml_file} # delete deployment by yaml file
```

### 👩🏻‍💻 DEBUGGING

``` shell
kubectl logs pod/${POD_HASH} # get pod hash from kubectl get pod 
watch kubectl get pod # install watch then watch the state of each pod (htop for more)
kubectl describe pod/{POD} # get an overview of the pods state
kubectl get all -A  # get all 
kubectl get svc -A # check the services installed
kubectl get pods # check the pods installed
kubectl get pods # wait for elastic search
kubectl delete -f ./kubernetes # delete all kubernetes instances
kubectl run -it curl --image=curlimages/curl -- sh # run terminal in the kubernetes command
```

### 🚀 DEPLOY MANUALLY

```shell
# services
kubectl apply -f  ./kubernetes/eureka-service.yaml
kubectl apply -f  ./kubernetes/authservice-service.yaml
kubectl apply -f  ./kubernetes/elasticsearch-service.yaml
kubectl apply -f  ./kubernetes/eventservice-service.yaml
kubectl apply -f  ./kubernetes/external-gateway-service.yaml
kubectl apply -f  ./kubernetes/internal-gateway-service.yaml
kubectl apply -f  ./kubernetes/kafka-service.yaml
kubectl apply -f  ./kubernetes/orderservice-service.yaml
kubectl apply -f  ./kubernetes/productservice-service.yaml
kubectl apply -f  ./kubernetes/userservice-service.yaml
kubectl apply -f  ./kubernetes/zookeeper-service.yaml

# deployment
kubectl apply -f  ./kubernetes/eureka-deployment.yaml 
kubectl apply -f  ./kubernetes/authservice-deployment.yaml
kubectl apply -f  ./kubernetes/elasticsearch-deployment.yaml
kubectl apply -f  ./kubernetes/eventservice-deployment.yaml
kubectl apply -f  ./kubernetes/external-gateway-deployment.yaml
kubectl apply -f  ./kubernetes/internal-gateway-deployment.yaml
kubectl apply -f  ./kubernetes/kafka-deployment.yaml
kubectl apply -f  ./kubernetes/order-db-deployment.yaml
kubectl apply -f  ./kubernetes/order-redis-deployment.yaml
kubectl apply -f  ./kubernetes/orderservice-deployment.yaml
kubectl apply -f  ./kubernetes/product-db-deployment.yaml
kubectl apply -f  ./kubernetes/product-redis-deployment.yaml
kubectl apply -f  ./kubernetes/productservice-deployment.yaml
kubectl apply -f  ./kubernetes/user-db-deployment.yaml
kubectl apply -f  ./kubernetes/userservice-deployment.yaml
kubectl apply -f  ./kubernetes/zookeeper-deployment.yaml
```
