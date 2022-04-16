#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#######
# CLEAN
#######

trap cleanup 1 2 3 6
PROXY_ID=''
cleanup() {
	echo "Cleanup..."
	kill -9 ${PROXY_ID}
	echo "Done cleanup ... quitting."
	exit 1
}

#######
# KAFKA
#######

launchKafka() {
	if ! helm status kafka >/dev/null 2>&1; then
		echo "${GREEN} Installing KAFKA...${NC}"
		helm repo update
		helm install kafka bitnami/kafka
		kubectl run kafka-client --restart='Never' --image docker.io/bitnami/kafka:3.1.0-debian-10-r64 --namespace default --command -- sleep infinity
	else
		echo "KAFKA ..... ${GREEN}OK${NC}"
		################################################################################################################## NOTES KAFKA
		# kubectl exec --tty -i kafka-client --namespace default -- bash # found with :9092
		################################################################################################################## NOTES KAFKA END
	fi
}

launchElasticSearch() {
	if ! helm status elasticsearch >/dev/null 2>&1; then
		echo "${GREEN} Installing KAFKA...${NC}"
		helm install elasticsearch bitnami/elasticsearch
	else
		################################################################################################################## NOTES ELASTICSEARCH
		# kubectl port-forward --namespace default svc/elasticsearch-coordinating-only 9200:9200 & curl http://127.0.0.1:9200/
		################################################################################################################## NOTES ELASTICSEARCH END

		echo "ELASTICSEARCH ..... ${GREEN}OK${NC}"
	fi
}

#######
# REDIS
#######

launchRedis() {
	if ! helm status redis >/dev/null 2>&1; then
		helm install redis bitnami/redis
		kubectl run --namespace default redis-client --restart='Never' --env REDIS_PASSWORD=$REDIS_PASSWORD --image docker.io/bitnami/redis:6.2.6-debian-10-r174 --command -- sleep infinity
	else
		echo "REDIS ..... ${GREEN}OK${NC}"
		################################################################################################################## NOTES REDIS
		# kubectl exec --tty -i redis-client --namespace default -- bash # to connect to database via bash
		# REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-master && REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h redis-replicas # add passwords
		# kubectl port-forward --namespace default svc/redis-master : & REDISCLI_AUTH="$REDIS_PASSWORD" redis-cli -h 127.0.0.1 -p # to connect to database
		##################### ############################################################################################# NOTES REDIS END
	fi
}

###########
# ZOOKEEPER
###########

launchRedis() {
	if ! helm status redis >/dev/null 2>&1; then
		helm install zookeeper bitnami/zookeeper
	else
		echo "ZOOKEEPER ..... ${GREEN}OK${NC}"
		################################################################################################################## NOTES ZOOKEEPER
		# export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=zookeeper,app.kubernetes.io/instance=zookeeper,app.kubernetes.io/component=zookeeper" -o jsonpath="{.items[0].metadata.name}")
		# kubectl exec -it $POD_NAME -- zkCli.sh
		################################################################################################################## NOTES ZOOKEEPER END
	fi
}

printInfo() {
	echo "-------------------------------------"
	echo "${GREEN}Launching your dev environment...${NC}"
	echo "-------------------------------------"
}

########
# BASICS
########

printInfo

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

###########
# LAUNCHERS
###########

launchKafka
launchElasticSearch
launchRedis
launchRedis

echo "-------------------------------------"
echo "${GREEN}dependency sum...${NC}"
####################################################################################################### OTHER NOTES
# helm repo add elastic https://helm.elastic.co
# helm install elasticsearch elastic/elasticsearch
####################################################################################################### OTHER NOTE END
echo "-------------------------------------"
helm list -A
