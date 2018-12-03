module.exports = function(){
    var express = require('express');
    var router = express.Router();

    //usefull functions martin made:

    //get table data
    router.get('/', function(req, res){
        console.log("inside router.get function")

        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deletelocation.js", "deletelineup.js", "deletetrack.js", "deletetracklist.js", "deleteconcert.js", "filterpeople.js"];
        var mysql = req.app.get('mysql');
        getTracks(res, mysql, context, complete);
        getConcerts(res, mysql, context, complete);
        getLocations(res, mysql, context, complete);
        //getLocation(res, mysql, context, complete);
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
        mysql.pool.query("SELECT lineupID, concertID, members FROM LineupMembers", function(error, results, fields){
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
        mysql.pool.query("SELECT locationID, venueName, country FROM Location", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.locations  = results;
            complete();
        });
    }

    function getLocation(res, mysql, context, id, complete){
        console.log("get single location")
        /*
        var sql = "SELECT * FROM Location WHERE locationID = ?";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.location = results; //results[0]
            complete();
        });
        */
       context.location = "hi";
    }

    //get concerts data
    function getConcerts(res, mysql, context, complete){
        //var sqlReq = "SELECT c.id, c.date, c.name, l.venueName, c.lineup, c.tour, c.tracklist, c.media, c.notes FROM Concert c LEFT JOIN Location l ON l.locationID = c.locationID"
        var sqlReq = "SELECT c.id, c.date, c.name, c.location, c.lineup, c.tour, c.tracklist, c.media, c.notes FROM Concert c LEFT JOIN Location l ON l.locationID = c.locationID"
        
        mysql.pool.query(sqlReq, function(error, results, fields){
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
        var sql = "SELECT trackID, name, releaseName FROM Track"
        mysql.pool.query(sql, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.tracks = results;
            complete();
        });
    } 

    function getConcert(res, mysql, context, id, complete){
        var sql = "SELECT id as id, name, date, location, lineup, tour, tracklist, media, notes FROM Concert WHERE id = ?";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.concert = results[0];
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
    });

    router.delete('/deleteLineup/:id', function(req, res){
        console.log("router.delete /deleteLineup/:id")  
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM LineupMembers WHERE lineupID = ?";
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
    }); 
    
    router.delete('/deleteTrack/:id', function(req, res){
        console.log("router.delete /deleteTrack/:id")  
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM Track WHERE trackID = ?";
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
    }); 

    router.delete('/deleteTracklist/:id', function(req, res){
        console.log("router.delete /deleteTracklist/:id")  
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM Tracklist WHERE concertID = ?";
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
    }); 

    router.delete('/deleteConcert/:id', function(req, res){
        console.log("router.delete /deleteConcert/:id")  
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM Concert WHERE id = ?";
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
    }); 

     /* Display one concert for the specific purpose of updating concert */

     router.get('/:id', function(req, res){
         console.log("people.js router.get /:id\n");
         
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedplanet.js", "updateperson.js"];
        var mysql = req.app.get('mysql');

        getConcert(res, mysql, context, req.params.id, complete);
        //getConcerts(res, mysql, context, complete);      
        getTracks(res, mysql, context, complete);
        getLocations(res, mysql, context, complete);
        getLineups(res, mysql, context, complete); 
        getTracklists(res, mysql, context, complete); 

        function complete(){
            callbackCount++;
            if(callbackCount >= 5){
                res.render('update-person', context);
            }

        }
        
    });   

    /* The URI that update data is sent to in order to update a person */

    router.put('/:id', function(req, res){
        console.log("people.js router.put /:id\n");
       
        var mysql = req.app.get('mysql');
        console.log(req.body)
        console.log(req.params.id)
        
        var sql = "UPDATE Concert SET name=?, date=?, location=?, lineup=?, tour=?, tracklist=?, media=?, notes=? WHERE id=?";
        var inserts = [req.body.name, req.body.date, req.body.location, req.body.lineup, req.body.tour, req.body.tracklist, req.body.media, req.body.notes, req.params.id];
        console.log("inserts = ");
        console.log(inserts);
        
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
  
    return router;
    
}();
