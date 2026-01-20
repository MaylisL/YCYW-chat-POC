# YCYW-chat-POC
## Contexte et objectif

Cette Proof of Concept (PoC) a pour objectif de démontrer la faisabilité
d’un chat en temps réel entre utilisateurs pour la nouvelle application de 
**Your Car Your Way**.

Elle vise à valider l’utilisation des WebSockets pour la communication
en temps réel entre un frontend Angular et un backend Spring Boot.

---

## Technologies utilisées
### Backend
- Java
- Spring Boot
- Spring WebSocket (STOMP)
- SockJS
- Lombok

### Frontend
- Angular
- @stomp/stompjs
- sockjs-client

---

## Lancement du projet

Le projet est organisé sous forme de mono-repo avec un frontend et un backend.

### Backend
Le backend démarre sur http://localhost:8080.

``` 
cd backend
 ``` 
sous linux/mac OS : 
 ``` 
./mvnw spring-boot:run
``` 
sous windows : 
 ``` 
 mvnw.cmd spring-boot:run 
 ``` 

### Frontend
Le frontend démarre sur http://localhost:4200.

``` 
cd frontend
npm install
ng serve
``` 
