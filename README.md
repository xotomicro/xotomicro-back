<h1 align="center">Microservices Backend Package 👋</h1>

- [🏗️ ARCHITECTURE](#️-architecture)
- [🎭 AUTHENTICATION](#-authentication)
- [📦 CREATE PRODUCT](#-create-product)
- [🎭 MONOREPO STRUCTURE](#-monorepo-structure)
- [🤷🏼‍♂️ PREREQUISITE](#️-prerequisite)
- [🐳 RUN WITH DOCKER](#-run-with-docker)
- [♻️ RUN WITH KUBERNETES](#️-run-with-kubernetes)
- [📦 BOOTSTRAP](#-bootstrap)
- [🧪 GLOBAL UTILITY CONTAINERS](#-global-utility-containers)
- [📜 OTHER DOCUMENTATION](#-other-documentation)
- [🚚 SERVICES](#-services)
- [👤 AUTHOR](#-author)
- [📝 LICENSE](#-license)
- [🏃 CHANGELOGS AND TODOS](#-changelogs-and-todos)
- [👩🏻‍💻 PROJECTS HELPFULL COMMANDS](#-projects-helpfull-commands)

### 🏗️ ARCHITECTURE

<img src="/documentation/backend/architecture.png" width="800">

###  🎭 AUTHENTICATION

<img src="/documentation/backend/authentication.png" width="800">

### 📦 CREATE PRODUCT

<img src="/documentation/backend/create-product.png" width="800">

### 🎭 MONOREPO STRUCTURE
```sh
# clone all git submodules
git clone --recurse-submodules https://github.com/xotomicro/xotomicro-back.git >> /dev/null # to import all micro services into the monorepo
```

### 🤷🏼‍♂️ PREREQUISITE
  - Java version 11 (at least)
  - Maven
  - Postgres
  - Clang 14
  - Lumbok

### 🐳 RUN WITH DOCKER 
* To install and run with docker follow : 
    - [DOCKER](./documentation/deployment/DOCKER.md)

### ♻️ RUN WITH KUBERNETES
* To install and run with docker kubernetes : 
    - [KUBERNETES](./documentation/deployment/KUBERNETES.md)

### 📦 BOOTSTRAP
* To repo that can be created and duplicated for different team use
    - [BACKENDBOOT](./bootstrap/example/README.md)

### 🧪 GLOBAL UTILITY CONTAINERS
* Back end urls : 
    - elasticsearch : http://localhost:9200
    - backend api swagger : http://localhost:8080/swagger-ui.html

### 📜 OTHER DOCUMENTATION
* Documents to get you started with the projects agility : 
  - [WELCOME](./documentation/conduct/WELCOME.md) - welcome documents
  - [GUIDEBOOK](./documentation/conduct/GUIDEBOOK.md) - guide documents
  - [CONTRIBUTING](./documentation/conduct/CONTRIBUTING.md) - contributing documents
  - [CODE_OF_CONDUCT](./documentation/conduct/CODE_OF_CONDUCT.md) - code_of_conduct documents
  - [SECURITY](./documentation/conduct/SECURITY.md) - security documents

### 🚚 SERVICES
* SYSTEM : SERVICE THAT INCLUDE ***elasticsearch port 9200 , zookeeper port 2181, kafka port 9092***
	- [STREAMSYSTEM](./packages/system/xotomicro-back-stream-system/README.md)
	- [GATEWAYSYSTEM](./packages/system/xotomicro-back-gateway-system/README.md) port : 8080
* SERVICES
	- [AUTHSERVICE](./packages/service/xotomicro-back-auth-service/README.md) port : 8082
	- [EVENTSERVICE](./packages/service/xotomicro-back-event-service/README.md) port : 8085
	- [ORDERSERVICE](./packages/service/xotomicro-back-order-service/README.md) port : 8084
	- [PRODUCTSERVICE](./packages/service/xotomicro-back-product-service/README.md) port : 8083
	- [USERSERVICE](./packages/service/xotomicro-back-user-service/README.md) port : 8081
* SERVERS
	- [EUREKASERVER](./packages/server/xotomicro-back-eureka-server/README.md) port : 9090

### 👤 AUTHOR
 **xotosphere organization**
    -   GITHUB: [@xotosphere](https://github.com/xotosphere)

### 📝 LICENSE
Copyright © 2022 [XOTOSPHERE](https://github.com/xotosphere).<br/>
This project is [ISC](https://raw.githubusercontent.com/xotomicro/xotomicro-back/development/LICENSE) licensed.

### 🏃 CHANGELOGS AND TODOS
- TODOS
	- [TODO](./TODO.md) 
	- [CHANGELOG](./CHANGELOG.md) 

### 👩🏻‍💻 PROJECTS HELPFULL COMMANDS
```shell
# GIT SUB REPO 
git submodule foreach git checkout -b {BRANCH} # new branch
git submodule foreach `git add . && git commit -m "NEW GIT" && git push`; # update all
```
