const express = require('express');
const app = express();
const fs = require('fs')

app.get('/', function(req, res) {
    fs.readFile('EIX_circulating_supply.txt', 'utf8', (err, data) => {
        if (err) {
            console.error(err)
            return
        }
        res.send(data)
    })
});

app.listen(8080, function() {
    console.log('Listening at 8080');
});
