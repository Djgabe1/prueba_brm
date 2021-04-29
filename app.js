const { json } = require('express');
const express = require('express');
const app = express();

app.set('view engine', 'ejs');

app.use(express.urlencoded({extended:false}));
app.use(express(json));

app.use(express.static('public'));
app.use('/recursos', express.static(__dirname+'/public'));

app.use('/', require('./routes/routes'));

//Puerto
app.listen(3000, ()=>{
    console.log('Servidor corriendo en http://localhost:3000');
} );
