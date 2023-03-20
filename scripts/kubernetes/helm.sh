#!/bin/bash
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
		echo ""
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
		echo ""
		echo "${GREEN} Installing ElasticSearch...${NC}"
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
		echo ""
		echo "${GREEN} Installing Redis...${NC}"
		# helm adds master
		helm install order-redis bitnami/redis
		helm install product-redis bitnami/redis
		# kubectl run --namespace default redis-client --rm --tty -i --restart='Never' --image docker.io/bitnami/redis:6.2.6-debian-10-r174 --command -- sleep infinity
		# export REDIS_PASSWORD=$(kubectl get secret redis-client -o jsonpath="{.data.redis-password}" | base64 --decode)
		# kubectl run --namespace default redis-client --restart='Never' --env REDIS_PASSWORD=$REDIS_PASSWORD --image docker.io/bitnami/redis:6.2.6-debian-10-r174 --command -- sleep infinity
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

launchZooKeeper() {
	if ! helm status zookeeper >/dev/null 2>&1; then
		echo ""
		echo "${GREEN} Installing Zookeeper...${NC}"
		helm install zookeeper bitnami/zookeeper
	else
		echo "ZOOKEEPER ..... ${GREEN}OK${NC}"
		################################################################################################################## NOTES ZOOKEEPER
		# export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=zookeeper,app.kubernetes.io/instance=zookeeper,app.kubernetes.io/component=zookeeper" -o jsonpath="{.items[0].metadata.name}")
		# kubectl exec -it $POD_NAME -- zkCli.sh
		################################################################################################################## NOTES ZOOKEEPER END
	fi
}

###########
# POSTGRES
###########

launchPostgres() {
	if ! helm status postgresql >/dev/null 2>&1; then
		echo ""
		echo "${GREEN} Installing Zookeeper...${NC}"
		helm install product-db bitnami/postgresql --set global.postgresql.auth.postgresPassword=admin --set global.postgresql.auth.username=postgres --set global.postgresql.auth.password=admin --set global.postgresql.auth.database=boilerplate
		helm install order-db bitnami/postgresql --set global.postgresql.auth.postgresPassword=admin --set global.postgresql.auth.username=postgres --set global.postgresql.auth.password=admin --set global.postgresql.auth.database=boilerplate
		helm install user-db bitnami/postgresql --set global.postgresql.auth.postgresPassword=admin --set global.postgresql.auth.username=postgres --set global.postgresql.auth.password=admin --set global.postgresql.auth.database=boilerplate
	else
		echo "Postgresql ..... ${GREEN}OK${NC}"
		################################################################################################################## NOTES POSTGRES
		# PostgreSQL can be accessed via port 5432 on the following DNS names from within your cluster:
		#     my-release-postgresql.default.svc.cluster.local - Read/Write connection
		# To get the password for "postgres" run:
		#     export POSTGRES_PASSWORD=$(kubectl get secret --namespace default my-release-postgresql -o jsonpath="{.data.postgres-password}" | base64 --decode)
		# To connect to your database run the following command:
		#     kubectl run my-release-postgresql-client --rm --tty -i --restart='Never' --namespace default --image docker.io/bitnami/postgresql:14.2.0-debian-10-r77 --env="PGPASSWORD=$POSTGRES_PASSWORD" \
		#       --command -- psql --host my-release-postgresql -U postgres -d postgres -p 5432
		#     > NOTE: If you access the container using bash, make sure that you execute "/opt/bitnami/scripts/entrypoint.sh /bin/bash" in order to avoid the error "psql: local user with ID 1001} does not exist"
		# To connect to your database from outside the cluster execute the following commands:
		#     kubectl port-forward --namespace default svc/my-release-postgresql 5432:5432 &
		#     PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5432
		################################################################################################################## NOTES POSTGRES END
	fi
}

printInfo() {
	echo "-------------------------------------"
	echo ""
	echo "${GREEN} Launching your dev environment...${NC}"
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
launchZooKeeper
launchPostgres

echo ""
echo "-------------------------------------"
echo "${GREEN}dependency sum...${NC}"
####################################################################################################### OTHER NOTES
# helm repo add elastic https://helm.elastic.co
# helm install elasticsearch elastic/elasticsearch
####################################################################################################### OTHER NOTE END
echo "-------------------------------------"
helm list -A
