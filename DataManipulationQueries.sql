-- Authors: Martin Barker, Lauren Gastineau
-- Group: 6

--get all locations to populate location dropdown when creating new concert
SELECT venueName FROM Location;

--get all lineups to populate lineup dropdown when creating new concert
SELECT members FROM LineupMembers;

--get all tracklist ID's to populate tracklist dropdown when creating new concert
SELECT concertID FROM Tracklist;

--get all tracks to display when choosing track to add to tracklist
SELECT trackID FROM Track;

-- add concert
INSERT INTO Concert (
    name, 
    date, 
    location, 
    lineup, 
    tour, 
    tracklist, 
    media, 
    notes
) VALUES (
    :nameInput, 
    :dateInput, 
    :locationInput, 
    :lineupInput, 
    :tourInput, 
    :tracklistInput, 
    :mediaInput, 
    :notesInput
);

-- add location
INSERT INTO Location (
    venueName, 
    country
) VALUES ( 
    :venueNameInput, 
    :countryInput
);

-- add lineupmembers
INSERT INTO LineupMembers (
    concertID, 
    members
)VALUES (
    :concertIDinput, 
    :membersInput
);

-- add track
INSERT INTO Track ( 
    name, 
    release
) VALUES ( 
    :nameInput, 
    :releaseInput
);

-- add tracklist
-- associate a concertID with a trackID (M-to-M relationship addition)
INSERT INTO Tracklist (
    concertID, 
    track, 
    trackNum
) VALUES (
    :concertID_Input, 
    :track_id_from_dropdown, 
    :trackNum_input
);

--get all tracks in a tracklist that correspond with a concertid
SELECT track FROM Tracklist WHERE concertID = :concertIdinput;

--get all concert information for displaying on homepage
SELECT name, date, location, lineup, tour, tracklist, media, notes FROM Concert;

-- update a concert (from update concert modal)
UPDATE Concert SET
    name = :nameInput,
    date = :dateInput, 
    location = :locationInput,  
    lineup = :lineupInput, 
    tour = :tourInput,
    tracklist = :tracklistInput, 
    media = :mediaInput, 
    notes = :notesInput
WHERE id = :idInput;

--delete a concert 
DELETE FROM Concert WHERE id = :idInput;

--delete a location
DELETE FROM Location WHERE locationID = :locationIDinput;

--delete a track
DELETE FROM Track WHERE trackID = :trackIDinput;

--delete a tracklist
DELETE FROM Tracklist WHERE concertID = :concertIDinput

--delete a lineup
DELETE FROM LineupMembers WHERE lineupID = :lineupIDinput
 


