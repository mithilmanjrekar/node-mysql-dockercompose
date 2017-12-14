'use strict';

const express = require('express');

// const mysql = require('mysql');

// const connection = mysql.createConnection({

// 	host: "localhost",
// 	user: "root",
// 	password: "rootroot",
// 	database: "testdb"

// })

// connection.connect(function(error){
// 	if(!!error){
// 		console.log("Error")
// 	}
// 	else{
// 		console.log("Successful")
// 	}
// });


// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();

app.get('/', (req, res) => {
 //  connection.query("select * from test" , function(error,rows,fields){
 //  	if(!!error){
	// 	console.log("Error")
	// 	res.send('Error\n' + rows + fields + error);
	// }
	// else{
	// 	console.log("Successful")
		res.send('Successful');
	// }
 //  })	
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
