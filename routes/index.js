var express = require('express');
var router = express.Router();
const mysql = require('mysql2');
require('dotenv').config();

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});


router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/', (req, res) => {
  let indeks = req.body.broj;
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection: ' + err.stack);
      return res.status(500).send('Database error');
    }
    connection.query('SELECT idRezervacije, brojSobe, datumDolaska, datumOdlaska, ukupnaCijena FROM rezervacije WHERE idRezervacije = ?;', [indeks], (error, results) => {
      connection.release();

      if (error) {
        console.error('Error executing query: ' + error.stack);
        return res.status(500).send('Database error');
      }

      res.json({ podaci: results });
    });
  });
});

module.exports = router;
