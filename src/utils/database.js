const mysql = require('mysql');

const mysqlConnection = mysql.createConnection( {
    host: 'localhost',
    user: 'root',
    password: 'rootpass',
    database: 'node20_mysql'
});


mysqlConnection.connect( function ( err ){
    if( err ){
        console.log(  err );
        return;
    }else{
        console.log( 'La base de datos esta conectada');
    }
});

module.exports = mysqlConnection;