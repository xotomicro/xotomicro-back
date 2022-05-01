# eval $(docker-machine env -u)
eval $(minikube docker-env)
minikube start --cpus 4 --memory 8192 # or customize minikube start --mount --mount-string /Users:/Users --cpus 4 --memory 8192
minikube addons enable ingress # ENABLE INGRESS CONTROLLER
minikube tunnel &> /dev/null & # MAKE NETWORK BRIDGE