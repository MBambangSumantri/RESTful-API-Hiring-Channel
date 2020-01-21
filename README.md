<h1 align="center">RESTful API Hiring Channel</h1>



RESTfull API Hiring Channel is a simple application specially for backend only. Built with NodeJs using the ExpressJs Framework.
Express.js is a web application framework for Node.js. [More about Express](https://en.wikipedia.org/wiki/Express.js)
## Built With
[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.13.1-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements
1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?
1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name hiring_cannel, and Import file [hiring_channel.sql](hiring_channel.sql) to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:8000)
8. You can see all the end point [here](#end-point)

## Set up .env file
Open .env file on your favorite code editor, and copy paste this code below :
```
PORT=8000
HOST=localhost
USER=root
PASS= 
DATABASE=hiring_channel

SECRET_KEY=koderahasiasekali
BASE_URL=http://localhost:8000

## End Point

**1. GET**
* `/api/v1/engineer`
* `/api/v1/engineer/:id` (Get engineer by id)
* `/api/v1/company` 
* `/api/v1/company/:id` (Get company by id)

**2. POST**
* `/api/v1/register`
    * ``` { "name": "bambang", "email": "bambang@mail.com", "password": 12345678, "role": "engineer" } ```

* `/api/v1/engineer`
    * ``` { "name": "bambang", "photo" key(file): "photo-1573083816958-6bec2f4e11a9.jpg", "email": "bambang@mail.com", "description": "Fullstack Developer", "expectsalary": "7000000", "skill": "node.js", "location": "jakarta", "dateofbirth": "1998-08-10", "showcase": "portofolio.com" } ```
    
* `/api/v1/company`
    * ``` { "name":"Gojek","email":"gojek@gmail.com","logo":"logo-1577324620086.png","location":"Jakarta","description":"gojek is a company" } ```

**3. PUT**
* `/api/v1/engineer/:id` (Update engineer by id)
   * ``` { "name": "bambang", "photo" key(file): "photo-1573083816958-6bec2f4e11a9.jpg", "email": "bambang@mail.com", "description": "Fullstack Developer", "expectsalary": "7000000", "skill": "node.js", "location": "jakarta", "dateofbirth": "1998-08-10", "showcase": "portofolio.com" } ```
* `/api/v1/company/:id` (Update company by id)
   * ``` { "name":"Gojek","email":"gojek@gmail.com","logo":"logo-1577324620086.png","location":"Jakarta","description":"gojek is a company" } ```

**4. DELETE**
* `/api/v1/engineer/:id` (Delete engineer by id)
* `/api/v1/company/:id` (Delete company by id)
