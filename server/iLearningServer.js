const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();

const con = mysql.createConnection({

    host: 'localhost', //'localhost',
    user: 'root',
    password: '',
    port: 3306, //port mysql
    database: 'sitedb'
});
app.use(bodyParser.json());
app.use(cors());

app.listen(3002, () => {
    console.log(`app is running on port 3002`);
});