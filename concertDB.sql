-- Authors: Martin Barker, Lauren Gastineau
-- Group: 6

DROP TABLE IF EXISTS Concert;
CREATE TABLE `Concert` (
    `id` int(11) AUTO_INCREMENT,
    `date` int(11) NOT NULL,
    `location` varchar(255) NOT NULL DEFAULT 0 REFERENCES `Location` (`venueName`),
    `lineup` varchar(255) NOT NULL REFERENCES `LineupMembers` (`concertID`),
    `tour` varchar(255) DEFAULT NULL,
    `tracklist` varchar(255) NOT NULL REFERENCES `Tracklist` (`concertID`),
    `media` varchar(255) DEFAULT NULL,
    `notes` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `Location`;
CREATE TABLE `Location` (
    `locationID` int(11) AUTO_INCREMENT,
    `venueName` varchar(255) NOT NULL, 
    `country` varchar(255) NOT NULL,
    PRIMARY KEY (`locationID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS LineupMembers;
CREATE TABLE `LineupMembers` (
    `concertID` int(11) NOT NULL AUTO_INCREMENT,
    `memberName` varchar(255) NOT NULL,
    PRIMARY KEY (`concertID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `concertID` int(11) NOT NULL,
    `trackNum` int(11) NOT NULL,
    `track` varchar(255) NOT NULL,
    PRIMARY KEY (`concertID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Track;
CREATE TABLE `Track`(
	`trackID` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`release` varchar(255) NOT NULL
) ENGINE=InnoDB; 


/*--------------  Inserting Data into table -------------------- */

-- create row for concert 1 location
INSERT INTO `Location` (venueName, country) VALUES ('Radio Bremen', 'Germany');

-- create row for concert 1 lineup
INSERT INTO `LineupMembers` (`memberName`) VALUES ('Klaus Dinger'), ('Florian Schneider'), ( 'Michael Rother');
/*
-- create tracks played at concert 1
INSERT INTO Track (`name`, release) VALUES ('Heavy Metal Kids', 'unreleased'), ('Stratovarius', 'Kraftwerk 1'), ('Ruckzuck', 'Kraftwerk 1'), ('Vom Himmel Hoch', 'Kraftwerk 1'), ('Rueckstoss Gondliere', 'unreleased');

-- create tracklist for concert 1
INSERT INTO Tracklist (concertID, trackNum, track) VALUES
    (1, 1, (SELECT trackID FROM track WHERE name = 'Heavy Metal Kids') ),
    (1, 2, (SELECT trackID FROM track WHERE name = 'Stratovarius') ),
    (1, 3, (SELECT trackID FROM track WHERE name = 'Ruckzuck') ),
    (1, 4, (SELECT trackID FROM track WHERE name = 'Vom Himmel Hoch') ),
    (1, 5, (SELECT trackID FROM track WHERE name = 'Rueckstoss Gondliere') );

-- add row to Concert for concert1
INSERT INTO Concert (date, location, lineup, tour, tracklist, media, notes) VALUES 
    ('1971', 
    (SELECT LocationID FROM Location WHERE venueName = 'Radio Bremen'),
    (SELECT * FROM LineupMembers WHERE name IN ('Klaus Dinger', 'Florian Schneider', 'Michael Rother')),
    NULL,
    (SELECT tracklist FROM tracklist WHERE concertID = 1),
    'https://www.youtube.com/watch?v=lTP-Clo62Dg',
    'Recorded without founder Ralf Hutter. Featuring Klaus Dinger of NEU! on drums. '
 );

/*--------------------------------------------------------------*/
/*
-- create row for concert2 location
INSERT INTO Location (venueName, country) VALUES ('Nakano Sun Plaza', 'Tokyo, Japan');

-- create lineup for concert2
INSERT INTO LineupMembers (concertID, name) VALUES (2, 'Karl Bartos'), (2, 'Ralf Hütter'), (2, 'Wolfgang Flür');

-- create tracks played at concert2
INSERT INTO track (name, release) VALUES 
    ('Beethoven-Intro', 'unreleased'),
    ('Numbers', 'Computer World'),
    ('Computerworld', 'Computer World'),
    ('Computer Love', 'Computer World'),
    ('Homecomputer', 'Computer World'),
    ('Neonlights', 'The Man-Machine'),
    ('Autobahn', 'Autobahn'),
    ('Showroom Dummies', 'Trans Europe Express'),
    ('Trans Europe Express', 'Trans Europe Express'),
    ('The Robots', 'The Man-Machine'),
    ('Its More Fun To Compute', 'Computer World');

-- create tracklist for concert2
INSERT INTO tracklist (concertID, trackNum, track) VALUES
    (2, 1, (SELECT trackID FROM track WHERE name = 'Beethoven-Intro') ),
    (2, 2, (SELECT trackID FROM track WHERE name = 'Numbers') ),
    (2, 3, (SELECT trackID FROM track WHERE name = 'Computerworld') ),
    (2, 4, (SELECT trackID FROM track WHERE name = 'Computer Love') ),
    (2, 5, (SELECT trackID FROM track WHERE name = 'Homecomputer') ),
    (2, 6, (SELECT trackID FROM track WHERE name = 'Neonlights') ),
    (2, 7, (SELECT trackID FROM track WHERE name = 'Autobahn') ),
    (2, 8, (SELECT trackID FROM track WHERE name = 'Showroom Dummies') ),
    (2, 9, (SELECT trackID FROM track WHERE name = 'Trans Europe Express') ),
    (2, 10, (SELECT trackID FROM track WHERE name = 'The Robots') ),
    (2, 11, (SELECT trackID FROM track WHERE name = 'Its More Fun To Compute') );

-- add row to Concert for concert2
INSERT INTO Concert (date, location, lineup, tour, tracklist, media, notes) VALUES 
    ('7/9/1981', 
    (SELECT LocationID FROM Location WHERE venueName = 'Nakano Sun Plaza'),
    (SELECT * FROM LineupMembers WHERE name IN ('Karl Bartos', 'Florian Schneider', 'Ralf Hütter', 'Wolfgang Flür') ),
    'Computer World Tour', 
    (SELECT tracklist FROM Tracklist WHERE concertID = 2),
    'https://www.youtube.com/watch?v=J0vfwuSVDgw',
    'Concert from the 1981 Computer World tour in which Kraftwerk disassembled their studio to bring with them on tour. The song Its More Fun To Compute is an alternative live version'
 );
*/
