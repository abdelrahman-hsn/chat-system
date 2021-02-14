# Chat System Challenge

Back End Challenge

* Ruby version: 2.5.1
* Ruby on Rails version: 5.2.4

### Requirments
* [Docker](https://www.docker.com/)
* API Test Tool, ex:([Postman](https://www.postman.com/))

## Installion
First of all pull the code of course

    git clone https://github.com/abdelrahman-hsn/chat-system.git
Open repo root folder
    
    cd chat-system
Then Let docker do the rest of the work

    docker-compose up -d &&  docker-compose exec sidekiq bundle exec sidekiq
open postman and import

    https://www.getpostman.com/collections/9920ee861e4e30393728


here is the list of the apis you can test and play with
**Application APIS**
-     GET         /applications   
-     POST       /applications   
-     GET    	   /applications/:token
-     PATCH      /applications/:token
-     PUT 	  /applications/:token

> The body in the POST AND PUT requestes
- `{ "application": { "name": "Instgram"} }`

**CHAT APIS**

-     GET    /applications/:application_token/chats     
-     POST   /applications/:application_token/chats           
-     GET /applications/:application_token/chats/:number         
-     PATCH  /applications/:application_token/chats/:number
-      PUT    /applications/:application_token/chats/:number       
-      DELETE /applications/:application_token/chats/:number

> The body in the POST AND PUT requestes
- `{ "chat": { "name": "Chat 1"} }`


**MESSAGE APIS**

-   GET   /applications/:application_token/chats/:chat_number/messages/search
-       GET    /applications/:application_token/chats/:chat_number/messages
-     POST   /applications/:application_token/chats/:chat_number/messages
-     GET    /applications/:application_token/chats/:chat_number/messages/:number
-     PATCH  /applications/:application_token/chats/:chat_number/messages/:number
-     PUT /applications/:application_token/chats/:chat_number/messages/:number
-     DELETE /applications/:application_token/chats/:chat_number/messages/:number 

> The body in the POST AND PUT requestes
- `{ "message": { "body": "bla bla"} }`
