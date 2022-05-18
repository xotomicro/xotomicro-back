eval $(minikube docker-env)            # docker env
minikube start --cpus 8 --memory=11500 # install minikube
minikube addons enable ingress         # enable ingress controller
minikube tunnel &>/dev/null &          # make network bridge
