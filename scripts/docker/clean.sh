docker-compose stop
docker rm -vf $(docker ps -aq)
docker volume rm $(docker volume ls -q)
docker rmi -f $(docker images -aq)
docker system prune <<<y
