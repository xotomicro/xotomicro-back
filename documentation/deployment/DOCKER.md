### 🤷🏼‍♂️ PREREQUISITE DEV
- Java version 11 (at least)
- Maven
- Docker environment
- Docker compose

### 🐳 RUNNING THE APP DOCKER

```shell
mvn clean install -Dmaven.test.skip # install all deps for backend from parent pom file
docker-compose --env-file=.env build # build back end
docker-compose --env-file=.env up # run back end
```

### 👩🏻‍💻 HELPFULL COMMANDS 
``` shell
# DOCKER
docker rmi -f $(docker images -aq)
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker-compose stop && docker system prune <<< y
``` 