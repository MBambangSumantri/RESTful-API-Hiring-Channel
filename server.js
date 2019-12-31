require("dotenv").config();
const   express = require('express'),
        app = express(),
        port = process.env.PORT,
        bodyParser = require('body-parser'),
        logger = require('morgan'),
        cors = require('cors')

// starting up the cors config
// app.use(function (req, res, next) {
//     res.header("Access-Control-Allow-Origin", "http://localhost:3000"); // update to match the domain you will make the request from
//     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//     next();
// });
app.use(express.static("images"));

app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors());

app.use(bodyParser.json());

app.use(logger('dev'));

const routes = require('./src/routes/routes');
routes(app);

app.listen(port);
console.log('RESTful API Hiring Channel App server started on: ' + port);
