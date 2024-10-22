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
  pool.query('SELECT * FROM rezervacije', (error, results) => {
    if (error) {
      return next(error);
    }
    res.render('izvjestaji', {
      title: 'Izvještaji',
      gostiDrzave: [],
      gostiSmjestaj: [],
      nocenjaDrzave: [],
      podaci: results
    });
  });
});

router.post('/', (req, res) => {
  let pocetniDatum = req.body.odDatum;
  let krajniDatum = req.body.doDatum;

  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error getting database connection: ' + err.stack);
      return res.status(500).json({ error: 'Database error' });
    }

    const upitGostiDrzave = 'CALL brojGostijuPoDrzavama(?, ?)';
    const upitGostiSmjestaj = 'CALL brojGostijuPoSmjestaju(?, ?)';
    const upitNocenjeDrzave = 'CALL brojNocenjaPoDrzavama(?, ?)';

    connection.query(upitGostiDrzave, [pocetniDatum, krajniDatum], (error1, results1) => {
      if (error1) {
        console.error('Error executing stored procedure: ' + error1.stack);
        connection.release();
        return res.status(500).json({ error: 'Database error' });
      }

      connection.query(upitGostiSmjestaj, [pocetniDatum, krajniDatum], (error2, results2) => {
        if (error2) {
          console.error('Error executing stored procedure: ' + error2.stack);
          connection.release();
          return res.status(500).json({ error: 'Database error' });
        }

        connection.query(upitNocenjeDrzave, [pocetniDatum, krajniDatum], (error3, results3) => {
          connection.release();

          if (error3) {
            console.error('Error executing stored procedure: ' + error3.stack);
            return res.status(500).json({ error: 'Database error' });
          }

          // Send JSON response
          res.json({
            gostiDrzave: results1[0] || [],
            gostiSmjestaj: results2[0] || [],
            nocenjaDrzave: results3[0] || []
          });
        });
      });
    });
  });
});





module.exports = router;
