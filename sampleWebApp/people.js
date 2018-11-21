module.exports = function(){
    var express = require('express');
    var router = express.Router();

    //usefull functions martin made:

    //get table data
    router.get('/', function(req, res){
        console.log("inside router.get function")

        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletelocation.js"];
        var mysql = req.app.get('mysql');
        getTracks(res, mysql, context, complete);
        getConcerts(res, mysql, context, complete);
        getLocations(res, mysql, context, complete);
        getLineups(res, mysql, context, complete); 
        getTracklists(res, mysql, context, complete); 
        function complete(){
            callbackCount++;
            if(callbackCount >= 5){ //wait for each get() function to complete, call one function wait 1 etc
                res.render('people', context);
            }
        }  
    });

    //get tracklists data
    function getTracklists(res, mysql, context, complete){
        mysql.pool.query("SELECT DISTINCT concertID FROM Tracklist", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.tracklists  = results;
            complete();
        });
    }

    //get lineups data
    function getLineups(res, mysql, context, complete){
        mysql.pool.query("SELECT * FROM LineupMembers", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.lineupMembers  = results;
            complete();
        });
    }

    //get locations data
    function getLocations(res, mysql, context, complete){
        mysql.pool.query("SELECT * FROM Location", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.locations  = results;
            complete();
        });
    }

    //get concerts data
    function getConcerts(res, mysql, context, complete){
        mysql.pool.query("SELECT * FROM Concert", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.concerts = results;
            complete();
        });
    }

    //get tracks data
    function getTracks(res, mysql, context, complete){
        var old_sql = "SELECT bsg_people.character_id as id, fname, lname, bsg_planets.name AS homeworld, age FROM bsg_people INNER JOIN bsg_planets ON homeworld = bsg_planets.planet_id"
        var sql = "SELECT * FROM Track"
        mysql.pool.query(sql, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.tracks = results;
            complete();
        });
    } 

    //insert new concert 
    router.post('/addConcert', function(req, res){
        console.log("inside addConcert post function")
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Concert (name, date, location, lineup, tour, tracklist, media, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        var inserts = [req.body.name, req.body.date, req.body.location, req.body.lineup, req.body.tour, req.body.tracklist, req.body.media, req.body.notes];

        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/people');
            }
        });
    });

    //insert new tracklist
    router.post('/addTracklist', function(req, res){
        console.log("inside addTracklist post function")
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Tracklist (trackNum, concertID, track) VALUES (?, ?, ?)";
        var inserts = [req.body.trackNum, req.body.concertID, req.body.track];

        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/people');
            }
        });
        
    });  

    //inserts new lineup
    router.post('/addLineup', function(req, res){
        console.log("inside addLineup post function")
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO LineupMembers (members) VALUES (?)";
        var inserts = [req.body.members];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/people');
            }
        });
    });

    //inserts new location
    router.post('/addLocation', function(req, res){
        console.log("inside addLocation post function")
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Location (venueName, country) VALUES (?,?)";
        var inserts = [req.body.venueName, req.body.country];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/people');
            }
        });  
    });

    //inserts new track
    router.post('/addTrack', function(req, res){
        console.log("inside addTrack post function")
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Track (name, releaseName) VALUES (?,?)";
        var inserts = [req.body.name, req.body.releaseName];
        console.log("inserts = "+inserts)
        /* */
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/people');
            }
        });  
    });

    router.get('/getTracks', function(req, res){
        console.log("inside getTracks get function")
    }); 


    router.delete('/deleteLocation/:id', function(req, res){
        console.log("router.delete /deleteLocation/:id")
       
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM Location WHERE locationID = ?";
        var inserts = [req.params.id];
        console.log("inserts = "+inserts)
        
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
        
    })

   /* 
    //delete concert row
    router.delete('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM Concert WHERE id = ?";
        var inserts = [req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400);
                res.end();
            }else{
                res.status(202).end();
            }
        })
    }) 
*/

    // /* Find people whose fname starts with a given string in the req */
    // function getPeopleWithNameLike(req, res, mysql, context, complete) {
    //   //sanitize the input as well as include the % character
    //    var query = "SELECT bsg_people.character_id as id, fname, lname, bsg_planets.name AS homeworld, age FROM bsg_people INNER JOIN bsg_planets ON homeworld = bsg_planets.planet_id WHERE bsg_people.fname LIKE " + mysql.pool.escape(req.params.s + '%');
    //   console.log(query)

    //   mysql.pool.query(query, function(error, results, fields){
    //         if(error){
    //             res.write(JSON.stringify(error));
    //             res.end();
    //         }
    //         context.people = results;
    //         complete();
    //     });
    // }
     
   
    /* The URI that update data is sent to in order to update a person */
    /*
    router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        console.log(req.body)
        console.log(req.params.id)
        var sql = "UPDATE bsg_people SET fname=?, lname=?, homeworld=?, age=? WHERE character_id=?";
        var inserts = [req.body.fname, req.body.lname, req.body.homeworld, req.body.age, req.params.id];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(error)
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        });
    });
    */

    return router;
}();
