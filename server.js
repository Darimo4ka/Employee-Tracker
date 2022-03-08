const inquirer = require('inquirer');
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


const userSelections = () =>
{
    // Ask user for what they want to do
    inquirer.prompt ([
        {
            type: 'list',
            name: 'choices',
            message: 'What would you like to do?',
            choices: ['View all Departments',
                      'View all Roles',
                      'View all Employees',
                      'Add a Department',
                      'Add a Role',
                      'Add an Employee',
                      'Update an Employee Role',
                      'EXIT']

        }
    ])
    .then((selection) => 
    {
        const {choices} = selection;

        if (choices === 'EXIT')
        {
            console.log('it is working')
            process.exit();
        }
        // View all departments
        if (choices === 'View all Departments')
        {
          db.query('SELECT * FROM department', function (err, results) {
                  console.log(results);

                // userSelections();
            });
        }    
    })
}


// Call main function
userSelections();