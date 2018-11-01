var express = require('express');
var mysql = require('./dbcon.js');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});
//setup stuff
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);

//get page? like /index.??
app.get('/',function(req,res,next){
  var context = {};
  //sql command to create table
  var createString = "CREATE TABLE diagnostic(id INT PRIMARY KEY AUTO_INCREMENT, text VARCHAR(255) NOT NULL)";
  
  //run drop table command, handle error
  mysql.pool.query('DROP TABLE IF EXISTS diagnostic', function(err){
    //if error, go to next? return? something happens
    if(err){
      next(err);
      return;
    }

    //run createString we made above, handle error
    mysql.pool.query(createString, function(err){
      //if error again go next / return?
      if(err){
        next(err);
        return;
      }

      //run another mysql.pool (i guess this runs sql commands), handle error
      //run line inserting into sql table
      mysql.pool.query('INSERT INTO diagnostic (`text`) VALUES ("MySQL is Working!")',function(err){

       //run sql command to select stuff from database , handle error as well as specify returned value?
       mysql.pool.query('SELECT * FROM diagnostic', function(err, rows, fields){
        //context.results is what the sql query returns, stringify? turns to string i guess
        //reslts is the name of the value in the home.handlebars (html code) file
        context.qresults = JSON.stringify(rows);
        //idk what this line does, returns query results?
        res.render('home',context);
      }); //end of select qeury
     
     });//end of instert into query
    
    });//end of create string query
  
  });//end of drop table query

});//end of app.get('/'

app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
