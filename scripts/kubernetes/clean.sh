kubectl delete pods –all
helm ls --all --short | xargs -L1 helm delete
minikube delete

