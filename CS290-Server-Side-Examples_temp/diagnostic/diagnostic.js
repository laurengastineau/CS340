//setup stuff
var express = require('express');
var mysql = require('./dbcon.js');
var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'});
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);


function showEntity(str) {
  console.log("inside showEntity function")
  if (str == "") {
      console.log("str=blank")
      document.getElementById("txt").innerHTML = "";
      return;
  } else if (str == "Concerts"){
      console.log("str=Concert")
  }
}

//get page? like /index.??
app.get('/',function(req,res,next){
  console.log("inside apt.get function");
  //console.log("req="+req);
  //console.log("res="+res);
  //console.log("next="+next);
  var context = {};
  
  mysql.pool.query('SELECT * FROM Concert', function(err, rows, fields){
    context.Concert_contents = JSON.stringify(rows);
  });

  mysql.pool.query('SELECT * FROM Location', function(err, rows, fields){
    context.Location_contents = JSON.stringify(rows);
  }); 

  mysql.pool.query('SELECT * FROM LineupMembers', function(err, rows, fields){
    context.Lineup_contents = JSON.stringify(rows);
  }); 
  
  mysql.pool.query('SELECT * FROM Track', function(err, rows, fields){
    context.Track_contents = JSON.stringify(rows);
  }); 

  mysql.pool.query('SELECT * FROM Tracklist', function(err, rows, fields){
    context.Tracklist_contents = JSON.stringify(rows);
    //idk exactly what this line does, returns query results (context) to home.handlebars i believe
    res.render('home',context);
  }); 

  
});


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

/*
function showEntity(str){
  console.log("inside show entity function");
  
};
*/