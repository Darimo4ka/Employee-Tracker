const inquirer = require('inquirer');
const express = require('express');
const app = express();

// Import and require mysql2
const mysql = require('mysql2');

// import console.table
const cTable = require('console.table'); 

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


 startScreen();

//What the user will first see once logged into node( welcome page with choices)
function startScreen() {
  inquirer
    .prompt({
      type: "list",
      choices: [
        "Add department",
        "Add role",
        "Add employee",
        "View departments",
        "View roles",
        "View employees",
        "Update employee role",
        "Exit"
      ],
      message: "What would you like to do?",
      name: "option"
    })
    .then(function(result) {
      console.log("You entered: " + result.option);

      switch (result.option) {
        case "Add department":
          addDepartment();
          break;
        case "Add role":
          addRole();
          break;
        case "Add employee":
          addEmployee();
          break;
        case "View departments":
          viewDepartment();
          break;
        case "View roles":
          viewRoles();
          break;
        case "View employees":
          viewEmployees();
          break;
        case "Update employee role":
          updateEmployee();
          break;
        default:
          quit();
      }
    });
}


// //All of the corresponding functions found below

function viewDepartment() {
  // select from the db
  let query = "SELECT * FROM department";
  db.query(query, function(err, res) {
    if (err) throw err;
    console.table(res);
    startScreen();
  });
  // show the result to the user (console.table)
}

function viewRoles() {
  // select from the db
  let query = "SELECT * FROM role";
  db.query(query, function(err, res) {
    if (err) throw err;
// show the result to the user (console.table)
    console.table(res);
    startScreen();
  });

}

function viewEmployees() {
  // select from the db
  let query = "SELECT * FROM employee";
  // line 25 is responsable for connection so db.query creates connection to my sql( my db)
  db.query(query, function (err, res) {
    if (err) throw err;
    // show the result to the user (console.table)
    console.table(res);
    startScreen();
  });
}

function addDepartment() {
  inquirer
    .prompt({
      type: "input",
      message: "What is the name of the department?",
      name: "deptName",
    })
    .then(function (answer) {
      db.query(
        "INSERT INTO department (name) VALUES (?)",
        [answer.deptName],
        function (err, res) {
          if (err) throw err;
          console.table(res);
          startScreen();
        }
      );
    });
}

function quit() {
  db.end();
  process.exit();
}