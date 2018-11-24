var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_gastinel',
  password        : '4440',
  database        : 'cs340_gastinel'
});

module.exports.pool = pool;
