const express = require('express');
const app = express();

// Import and require mysql2
const mysql = require('mysql2');

//  this is important for deployment on HEROKU
const PORT = process.env.PORT || 3001;

// Express middleware

//  first declare app.use(express.json()) to set the base of server:
app.use(express.json());
// to establish the url encoding
app.use(express.urlencoded({ extended: false }));


// Connect to database
const db = mysql.createConnection(
  {
    host: 'localhost',
    // MySQL username
    user: 'root',
    // Add MySQL password
    password: '1234',
    database: 'employees'
  },
  console.log(`Connected to the employees database.`)
);

