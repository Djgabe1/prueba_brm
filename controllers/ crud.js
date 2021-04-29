const conexion = require('../database/db');

exports.save = (req, res)=>{
    const productos = req.body.producto;
    const cantidad = req.body.cantidad;
    const lote = req.body.lote;
    const fechaVencimiento = req.body.fechaVencimiento;
    const precio = req.body.precio;
    conexion.query('INSERT INTO proveedores SET ?', {productos:productos, cantidad:cantidad, lote:lote, fechaVencimiento:fechaVencimiento, precio:precio}, (error, results)=>{
        if (error)console.log(error);
        else{res.redirect('/');}
    })
};

