<h1 align="center">Microservices Backend Monorepo ๐</h1>

<div align="center">
 <h3> ๐ญ AUTHENTICATION  </h3>
 <img src="/documentation/backend/architecture.png" width="70%">
</div>

<br>

<div align="center">
 <h3> ๐๏ธ ARCHITECTURE </h3>
 <img src="/documentation/backend/authentication.png" width="70%">
</div>

<br>

<div align="center">
 <h3> ๐ฆ CREATE PRODUCT </h3>
 <img src="/documentation/backend/create-product.png" width="70%">
</div>

<br>

- [๐ MONOREPO STRUCTURE](#-monorepo-structure)
- [๐คท๐ผโโ๏ธ PREREQUISITE](#๏ธ-prerequisite)
- [๐ณ RUN WITH DOCKER](#-run-with-docker)
- [โป๏ธ RUN WITH KUBERNETES](#๏ธ-run-with-kubernetes)
- [๐งช GLOBAL UTILITY CONTAINERS](#-global-utility-containers)
- [๐ OTHER DOCUMENTATION](#-other-documentation)
- [๐ SERVICES](#-services)
- [๐ค AUTHOR](#-author)
- [๐ LICENSE](#-license)
- [๐ CHANGELOGS AND TODOS](#-changelogs-and-todos)
- [๐ฉ๐ปโ๐ป PROJECTS HELPFULL COMMANDS](#-projects-helpfull-commands)

### ๐ MONOREPO STRUCTURE

```sh
# clone all git submodules
git clone --recurse-submodules https://github.com/xotomicro/xotomicro-back.git >> /dev/null # to import all micro services into the monorepo
```

### ๐คท๐ผโโ๏ธ PREREQUISITE

- Java version 11 (at least)
- Maven
- Postgres
- Clang 14
- Lumbok

### ๐ณ RUN WITH DOCKER

* To install and run with docker follow :
  - [DOCKER](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/deployment/DOCKER.md)

### โป๏ธ RUN WITH KUBERNETES

* To install and run with docker kubernetes :
  - [KUBERNETES](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/deployment/KUBERNETES.md) : main readme for front kubernetes (local kubectl & minikube)

### ๐งช GLOBAL UTILITY CONTAINERS

* Back end urls :
  - elasticsearch : <http://localhost:9200>
  - backend api swagger : <http://localhost:8080/swagger-ui.html>

### ๐ OTHER DOCUMENTATION

* Documents to get you started with the projects agility :
  - [CONTRIBUTING](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/conduct/CONTRIBUTING.md) - contributing documents
  - [GUIDEBOOK](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/conduct/GUIDEBOOK.md) - contributing documents
  - [CODE_OF_CONDUCT](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/conduct/CODE_OF_CONDUCT.md) - code_of_conduct documents
  - [SECURITY](https://github.com/xotomicro/xotomicro-back/blob/development/documentation/conduct/SECURITY.md) - security documents

### ๐ SERVICES

- SYSTEM : SERVICE THAT INCLUDE ***elasticsearch port 9200 , zookeeper port 2181, kafka port 9092***
  - [STREAMSYSTEM](https://github.com/xotomicro/xotomicro-back-stream-system/blob/development/README.md) port : (multiple)
  - [GATEWAYSYSTEM](https://github.com/xotomicro/xotomicro-back-gateway-system/blob/development/README.md) port : 8080
  
- SERVICES
  - [AUTHSERVICE](https://github.com/xotomicro/xotomicro-back-auth-service/blob/development/README.md) port : 8082
  - [EVENTSERVICE](https://github.com/xotomicro/xotomicro-back-event-service/blob/development/README.md) port : 8085
  - [ORDERSERVICE](https://github.com/xotomicro/xotomicro-back-order-service/blob/development/README.md) port : 8084
  - [PRODUCTSERVICE](https://github.com/xotomicro/xotomicro-back-product-service/blob/development/README.md) port : 8083
  - [USERSERVICE](https://github.com/xotomicro/xotomicro-back-user-service/blob/development/README.md) port : 8081
  
- SERVERS
  - [EUREKASERVER](https://github.com/xotomicro/xotomicro-back-eureka-server/blob/development/README.md) port : 9090

### ๐ค AUTHOR

 **xotosphere organization**
    -   GITHUB: [@xotosphere](https://github.com/xotosphere)

### ๐ LICENSE

Copyright ยฉ 2022 [XOTOSPHERE](https://github.com/xotosphere).<br/>
This project is [ISC](https://raw.githubusercontent.com/xotomicro/xotomicro-back/development/LICENSE) licensed.

### ๐ CHANGELOGS AND TODOS

- TODOS
  - [TODO](https://github.com/xotomicro/xotomicro-back/blob/development/TODO.md)
  - [CHANGELOG](https://github.com/xotomicro/xotomicro-back/blob/development/CHANGELOG.md)

### ๐ฉ๐ปโ๐ป PROJECTS HELPFULL COMMANDS

```shell
# GIT SUB REPO 
git submodule foreach git checkout -b {BRANCH} # new branch
git submodule foreach `git add . && git commit -m "NEW GIT" && git push`; # update all
```
