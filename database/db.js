const mysql = require('mysql');

const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'prueba'
});

conexion.connect((error)=>{
    if (error) {
        console.log('Error de conexión:  '+error);
        return
    }
    console.log('Conexión exitosa');
})

module.exports = conexion;