var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_barkemar',
  password        : '4778',
  database        : 'cs340_barkemar'
});

module.exports.pool = pool;
