const express = require('express');
const router = express.Router();

const mysqlConnection = require( '../database');
const utils = require( '../utils/querys');

router.get( '/getAll' , ( req , res ) => {
    mysqlConnection.query( GET_EMPLOYEES , ( err , rows , fields ) => {
        if( !err ){
            res.json( rows )
        }else{
            console.log(  err );
            return;
        }
    })
});

router.get( '/getByUserName/:userName' , (req , res ) => {

        const { userName } = req.params;

        mysqlConnection.query( GET_BY_USER_NAME , [userName] , ( err , rows , fields ) => {
            if( !err ){
                res.json( rows[0] )
            }else{
                console.log(  err );
                return;
            }
        });
});

router.post( '/login' , ( req , res ) => {
    
    const { userName } = req.body;
    const { password } = req.body;
    const { actualDate } = req.body;

    mysqlConnection.query( GET_LOGIN , [userName , password , actualDate] , ( err , rows , fields ) => {
        if( !err ){

            if( rows[0] != undefined){
                var response = {
                    'status' : 'ok',
                    'message' : 'Bienvenido '+rows[0].name,
                    'userName': rows[0].user_name ,
                    'userPhoto': rows[0].photo_url ,
                    'fullName' : rows[0].name + " " + rows[0].lastname,
                    'userId': rows[0].id_user ,                
                }

                res.send( response );
            }else{
                var response = {
                    'status' : 'KO',
                    'message' : 'Usuario / contraseña incorrectos'
                }

                res.send( response );
            }
        }else{
            console.log(  err );
            return;
        }
    });

});

module.exports = router;