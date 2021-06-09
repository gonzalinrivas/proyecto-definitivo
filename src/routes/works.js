const express = require('express');
const routerWorks = express.Router();

const mysqlConnection = require( '../database');
const utils = require( '../utils/querys');

routerWorks.post( '/getPendingJobs' , (req , res ) => {

    const { userId } = req.body;

    mysqlConnection.query( GET_PENDING_PLANNING_BY_USER , [userId] , ( err , rows , fields ) => {
        if( !err ){
            var response = {
                "status" : 1 ,
                "works" : rows
            }
            res.json( response )
        }else{
            console.log(  err );
            return;
        }
    });
});

routerWorks.post( '/getFinishedJobs' , (req , res ) => {

    const { userId } = req.body;

    mysqlConnection.query( GET_FINISHED_PLANNING_BY_USER , [userId] , ( err , rows , fields ) => {
        if( !err ){
            res.json( rows )
        }else{
            console.log(  err );
            return;
        }
    });
});

module.exports = routerWorks;