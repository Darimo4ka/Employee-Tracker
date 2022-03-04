const express = require('express');
const app = express();

// Import and require mysql2
const mysql = require('mysql2');

// Load .env variables
require("dotenv").config()

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
      // MySQL username,
      user: process.env.DB_USER,
      // MySQL password
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME
    },
    console.log(`Connected to the employees database.`),
  );
