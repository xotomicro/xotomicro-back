sh ./scripts/docker/clean.sh     # delete all docker instances
sh ./scripts/kubernetes/clean.sh # delete all kubernetes instances
# before running this step make sure that docker desktop has the sufficiant resources
sh ./scripts/kubernetes/minikube.sh # start start minikube
# eval $(minikube docker-env)         # switch to minikube environment
sh ./scripts/kubernetes/helm.sh     # install dependencies for cluster
mvn clean install -Dmaven.test.skip # install local dependencies for app
