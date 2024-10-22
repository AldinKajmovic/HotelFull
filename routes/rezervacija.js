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
  res.render('rezervacija');
});

router.post('/', (req, res) => {
  let datumDolaska = req.body.datum1;
  let datumOdlaska = req.body.datum2;
  let brojGostiju = req.body.brojgostiju;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection: ' + err.stack);
      return res.status(500).send('Database error');
    }
    connection.query('CALL SlobodneSobe(?,?,?);', [datumDolaska, datumOdlaska, brojGostiju], (error, results) => {
      connection.release();

      if (error) {
        console.error('Error executing query: ' + error.stack);
        return res.status(500).send('Database error');
      }

      res.render('rezervacija', { podaci: results[0] });
    });
  });
});

router.post('/ok', (req, res) => {
  let brojSobe = req.body.soba;
  let datumDolaska = req.body.datumDolaska;
  let datumOdlaska = req.body.datumOdlaska;
  let brojGostiju = req.body.brojGostiju;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection: ' + err.stack);
      return res.status(500).send('Database error');
    }
    connection.query('INSERT INTO rezervacije(brojSobe, datumDolaska, datumOdlaska, brojGostiju) values(?,?,?,?);', [brojSobe,datumDolaska, datumOdlaska, brojGostiju], (error, results) => {
      connection.release();

      if (error) {
        console.error('Error executing query: ' + error.stack);
        return res.status(500).send('Database error');
      }

      res.render('ok', );
    });
  });
});

module.exports = router;
