To run the website:

log on to flip using putty or whatever and type 'hostname' to find out what number flip your on (gonna either be flip1 flip2 or flip3)
2)clone this branch and cd in /CS340/sampleWebApp

3)You need to choose a port for hosting(like 5328) There are two ways to host the server:

momentarily: will only be up for as long as you have the window open Run using: "$ node main.js 5328"

forever: will keep running even after you close the window, this is what we'll do before submitting an assignment. host server forever using command: "$ ./node_modules/forever/bin/forever start main.js 5378"

Once server is up and running, go to the url of your current flip version from step 1 and the port, such as: 'flip1.engr.oregonstate.edu:5326'
Might have to run npm install ? or command for npm to install node.js? let me know if there are troubles running website