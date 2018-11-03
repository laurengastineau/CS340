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
  var context = {};
  
  mysql.pool.query('SELECT * FROM Concert', function(err, rows, fields){
    
    //Concert_contents is the name of the value in the home.handlebars (html code) file
    context.Concert_contents = JSON.stringify(rows);

    //idk what this line does, returns query results?
    res.render('home',context);

  }); //end of select qeury

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

/*
function showEntity(str){
  console.log("inside show entity function");
  
};
*/