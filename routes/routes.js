const express = require('express');
const route = express.Router();

const conexion = require('../database/db');

route.get('/', (req, res)=>{
    res.render('index');
});

route.get('/inventary', (req, res)=>{
    const consulta2 = ('SELECT * FROM proveedores');
        conexion.query(consulta2, (error, resp)=>{
                if (error) throw error;
                res.render('inventory', {proveedores: resp});
            });
    });


route.get('/products', (req, res)=>{
        conexion.query('SELECT * FROM productos', (error, results)=>{
            if (error) throw error;
            else {
                res.render('create', {results:results});
            }
        })
            
});

route.get('/invoice', (req, res)=>{
    conexion.query('SELECT * FROM clientes', (error, cresultado)=>{
        if (error) throw error;
        else {
            res.render('invoice', {cresultado:cresultado});
        }
    });

/* 
    const consulta1 = ('SELECT clientes.cantidad FROM clientes');
    const consulta2 = ('SELECT proveedores.precio FROM proveedores');
    const resultado = consulta1 * consulta2;
        res.render('invoice', {resultado}); */

});


route.get('/shopping', (req,res)=>{
    conexion.query('SELECT * FROM proveedores', (error, pro)=>{
        if (error) throw error;
        else {
            res.render('shoppingCart', {pro:pro});
        }
    });
});

/* route.get('/shopping', (req, res)=>{
    const consulta2 = ('SELECT * FROM proveedores');
        conexion.query(consulta2, (error, resp)=>{
                if (error) throw error;
                res.render('shoppingCart', {proveedores: resp});
            });

})
 */


const crud = require('../controllers/ crud');
route.post('/save', crud.save);

const clients = require('../controllers/clients');
route.post('/guardar', clients.guardar);

module.exports = route;