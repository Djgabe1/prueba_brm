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
    conexion.query('SELECT * FROM clientes, factura', (error, factura)=>{
        if (error) throw error;
        else {
            res.render('invoice', {factura:factura});
        }
    });
});



route.get('/shopping', (req,res)=>{
    conexion.query('SELECT * FROM proveedores, clientes', (error, pro)=>{
        if (error) throw error;
        else {
            res.render('shoppingCart', {pro:pro});
        }
    });
});

//eliminar

route.get('/eliminar/:id', (res, req, next)=>{
    const id= req.body.id;
    conexion.query('DELETE FROM `proveedores` WHERE proveedores.idProveedores= ?', [id], (error, results)=>{
        if (error) throw error;
        else {
            res.send('/');
            next();
        }
    });

});

route.get('/cancelar/:id', (res, req, next)=>{
    const id = req.params.id
    conexion.query('DELETE FROM clientes WHERE idCliente = ?',[id], (error, results)=>{
            res.send('/');
    });
    res.render('/');
});



const crud = require('../controllers/ crud');
route.post('/save', crud.save);

const clients = require('../controllers/clients');
route.post('/guardar', clients.guardar);



module.exports = route;