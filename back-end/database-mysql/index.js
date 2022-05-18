

var mysql = require('mysql2');





var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password :  'root', // go to the env.js file and update your password
  database : 'all-in1'
});


connection.connect((err, success) => {
  err ? console.log("connection failed", err) : console.log("Database connected successfully")
})
module.exports = connection;










