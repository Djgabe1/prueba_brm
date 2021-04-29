const conexion = require('../database/db');


//"Incorrect integer value: '[object Object]' for column `prueba`.`clientes`.`precio` at row 1",
exports.guardar = (req, res)=>{
    const idCliente = req.body.idCliente;
    const nombre = req.body.nombre;
    const apellido = req.body.apellido;
    const producto = req.body.producto;
    const cantidad = req.body.cantidad;
    conexion.query('INSERT INTO clientes SET ?', {idCliente:idCliente, productos:producto, nombre:nombre, apellido:apellido,  cantidad:cantidad}, (error, results)=>{
        if (error)console.log(error);
        else{res.redirect('/shopping');}
    })
}