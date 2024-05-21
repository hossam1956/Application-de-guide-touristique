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
Cette application touristique a été conçue avec une architecture moderne et évolutive. Le backend a été développé avec le framework Express.js, offrant une API robuste et sécurisée pour gérer les différentes fonctionnalités de l'application. La partie front-end admin a été construite avec React.js, une bibliothèque JavaScript puissante permettant de créer une interface utilisateur dynamique et interactive pour les administrateurs. Cela leur permet de gérer le contenu, les réservations et les informations des utilisateurs de manière efficace. Parallèlement, la partie mobile client a été développée en utilisant React Native, un framework permettant de créer des applications natives pour iOS et Android à partir d'un seul code base en JavaScript/TypeScript. Cela assure une expérience utilisateur fluide et cohérente sur les différents appareils mobiles, tout en partageant une grande partie du code entre les plateformes. Cette architecture modulaire offre de nombreux avantages, notamment en termes de maintenabilité, de scalabilité et de performance globale de l'application touristique.
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
## Frontend

### Technologies Utilisées
- React JS
- Ant Design
## Structure du projet Frontend
Le projet front-end React JS est organisé autour de cinq parties principaux, chacun répondant à un objectif spécifique et contribuant à l'architecture globale et à la maintenabilité de l'application.

### 1. Login
- ***Objectif*** : Le composant LOGIN est responsable de la gestion de l'authentification des administrateurs dans l'application. Il vise à garantir la sécurité de l'accès à l'application en utilisant le protocole JWT (JSON Web Tokens).
- ***Fonctionnalité*** : Les administrateurs saisissent leurs identifiants dans un formulaire de connexion. Le serveur authentifie ces identifiants et renvoie un jeton JWT stocké de manière sécurisée, qui est ensuite transmis avec chaque requête pour vérifier l'identité et les autorisations de l'administrateur.

### 2. Tableau de bord
- ***Objectif*** : Le composant Dashboard est responsable de la visualisation des statistiques clés de l'application, telles que les informations sur les monuments, les créateurs et les utilisateurs. Il a pour but de fournir aux administrateurs une vue d'ensemble de l'activité et de la performance de l'application.
  
- ***Fonctionnalité*** :Affichage du nombre total de monuments, d'utilisateurs et de créateurs Présentation de ces informations de manière synthétique et visuelle Mise à jour en temps réel des chiffres clés

### 3. Createur
- ***Objectif*** : Permettre aux administrateurs de gérer les informations des créateurs  enregistrés dans l'application.

- ***Fonctionnalité*** : Ajouter, modifier et supprimer des créateurs, afficher la liste des créateurs avec filtres et lier les créateurs aux monuments qu'ils ont créés.

### 4. Monument
- ***Objectif*** : Permettre aux administrateurs de gérer les informations des monuments enregistrés dans l'application..

- ***Fonctionnalité*** : Ajouter, modifier et supprimer des monuments, afficher la liste des monuments avec filtres, visualiser les détails d'un monument spécifique et lier les monuments à leurs créateurs.

### 5. Tourist
- ***Objectif*** : Permettre aux administrateurs de gérer  les comptes des tourists enregistrés dans l'application.

- ***Fonctionnalité*** : Désactiver les comptes des tourists, afficher la liste des utilisateurs avec filtres, visualiser les détails d'un utilisateur spécifique et attribuer des rôles et autorisations aux utilisateurs.

## Backend
### Technologies Utilisées
- Express JS
- MySql
## Structure du projet Backend
Le backend développé avec Express.js est connecté à une base de données MySQL et est composé des modules suivants : les modèles (Admin, Avis, Createur, Monument, Tourist) définissant la structure des données, des contrôleurs  gérant la logique métier, et les routes (Routes) configurant les différents points d'accès de l'API.



