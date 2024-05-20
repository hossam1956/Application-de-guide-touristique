# Application de guide touristique local basée sur la géolocalisation
![logo](img/logo.png)
## Table des matières

- [Objectif générale du projet](#Objectif-générale-du-projet)
- [Architecture du projet](#Architecture-du-projet)
- [Docker Compose](#Docker-compose)
## Objectif générale du projet
Ce projet de guide touristique mobile représente une initiative ambitieuse et innovante
visant à faciliter la découverte du riche patrimoine historique d’une ville. Axée sur l’accessibilité, l’exhaustivité des informations et l’interactivité, cette application mobile se
positionne comme un outil incontournable pour les habitants et les visiteurs souhaitant
explorer en profondeur les monuments et sites historiques locaux.
## Architecture du projet
![logo](img/architecture.jpg)

## docker Compose
```yaml
version: "3"
services:
 mysql:
    image: mysql:latest
    container_name: hossam-mysql-1
    environment:
      MYSQL_ALLOW_EMPTY_PASSWORD: 'yes'
      MYSQL_DATABASE: db_pfa
    volumes:
      - ./database:/docker-entrypoint-initdb.d
      - mysql-db:/var/lib/mysql
    ports:
      - "3306:3306"
 app_backend:
  container_name: app_backend
  build:
   context: ./app_backend
   args:
    - NODE_ENV=developement
  volumes:
   - ./app_backend:/app/backend:ro
  command: npm start
  ports:
   - "5000:5000"
  depends_on:
   - mysql
 app_frontend:
  container_name: app_frontend
  build:
    context: ./app_front
  volumes:
    - ./app_front/src:/react/src:ro
  command: npm start
  ports:
    - "3000:3000"
  depends_on:
    - app_backend


volumes:
 mysql-db: {}
```
