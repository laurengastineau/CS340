-- Authors: Martin Barker, Lauren Gastineau
-- Group: 6

DROP TABLE IF EXISTS Concert;
CREATE TABLE `Concert` (
    `id` int(11) AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `date` int(11) NOT NULL,
    `location` varchar(255) NOT NULL DEFAULT 0 REFERENCES `Location` (`venueName`),
<<<<<<< HEAD
    `lineup` varchar(255) NOT NULL REFERENCES `LineupMembers` (`members`),
    `tour` varchar(255) DEFAULT NULL,
    `tracklist` varchar(255) DEFAULT NULL REFERENCES `tracklist` (`tracklistID`),
=======
 --   `lineup` varchar(255) NOT NULL REFERENCES `LineupMembers` (`memberName`),
    `tour` varchar(255) DEFAULT NULL,
 --   `tracklist` varchar(255) NOT NULL REFERENCES `Tracklist` (`track`),
>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6
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

-- create row for concert 1 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Radio Bremen', 'Germany');

DROP TABLE IF EXISTS LineupMembers;
CREATE TABLE `LineupMembers` (
    `concertID` int(11) NOT NULL,
<<<<<<< HEAD
    `members` varchar(255) NOT NULL,
    PRIMARY KEY (`members`)
) ENGINE=InnoDB;

-- create row for concert 1 lineup
INSERT INTO LineupMembers (`concertID`, `members`) VALUES (1, 'Klaus Dinger, Florian Schneider, Michael Rother');

DROP TABLE IF EXISTS Track;
CREATE TABLE `Track`(
    `trackID` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `release` varchar(255) NOT NULL,
    PRIMARY KEY (`trackID`)
) ENGINE=InnoDB;
=======
    `memberName` varchar(255) NOT NULL,
    PRIMARY KEY (`memberName`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `concertID` int(11) NOT NULL,
    `trackNum` int(11) NOT NULL,
    `track` varchar(255) NOT NULL,
    PRIMARY KEY (`track`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Track;
CREATE TABLE `Track`(
	`trackID` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`release` varchar(255) NOT NULL,
    PRIMARY KEY (`trackID`)
) ENGINE=InnoDB; 


/*--------------  Inserting Data into table -------------------- */

-- create row for concert 1 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Radio Bremen', 'Germany');

-- create row for concert 1 lineup
INSERT INTO LineupMembers (`concertID`, `memberName`) VALUES (1, 'Klaus Dinger'), (1, 'Florian Schneider'), (1, 'Michael Rother');
>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6

-- create tracks played at concert 1
INSERT INTO Track (`name`, `release`) VALUES ('Heavy Metal Kids', 'unreleased'), ('Stratovarius', 'Kraftwerk 1'), ('Ruckzuck', 'Kraftwerk 1'), ('Vom Himmel Hoch', 'Kraftwerk 1'), ('Rueckstoss Gondliere', 'unreleased');

<<<<<<< HEAD

DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `concertID` int(11) NOT NULL REFERENCES `Concert` (`id`),
    `track` varchar(255) NOT NULL REFERENCES `Track` (`trackID`),
    `trackNum` int(11) NOT NULL,
    PRIMARY KEY (`concertID`, `track`)
)ENGINE=InnoDB;

-- add row to Concert for concert1
INSERT INTO Concert (date, name, location, lineup, tour, media, notes) VALUES
    ('1971',
    ('Live On Radio Bremen'),
    (SELECT locationID FROM `Location` WHERE venueName = 'Radio Bremen'),
    (SELECT members FROM LineupMembers WHERE `concertID` = 1),
    NULL,
=======
-- create tracklist for concert 1
INSERT INTO Tracklist (concertID, trackNum, track) VALUES
    (1, 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids') ),
    (1, 2, (SELECT trackID FROM Track WHERE name = 'Stratovarius') ),
    (1, 3, (SELECT trackID FROM Track WHERE name = 'Ruckzuck') ),
    (1, 4, (SELECT trackID FROM Track WHERE name = 'Vom Himmel Hoch') ),
    (1, 5, (SELECT trackID FROM Track WHERE name = 'Rueckstoss Gondliere') );

-- add row to Concert for concert1
-- INSERT INTO Concert (date, location, lineup, tour, tracklist, media, notes) VALUES 
INSERT INTO Concert (date, location, tour, media, notes) VALUES 
    ('1971', 
    (SELECT locationID FROM `Location` WHERE venueName = 'Radio Bremen'),
 --   (SELECT lineup FROM LineupMembers WHERE `memberName` IN ('Klaus Dinger', 'Florian Schneider', 'Michael Rother')),
    NULL,
--    (SELECT tracklist FROM Tracklist WHERE concertID = 1),
>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6
    'https://www.youtube.com/watch?v=lTP-Clo62Dg',
    'Recorded without founder Ralf Hutter. Featuring Klaus Dinger of NEU! on drums. '
 );

<<<<<<< HEAD
=======
/*-------------------- Add data for concert 2 --------------------------------------*/
>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6

INSERT INTO Tracklist (concertID, trackNum, track) VALUES
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 2, (SELECT trackID FROM Track WHERE name = 'Stratovarius') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 3, (SELECT trackID FROM Track WHERE name = 'Ruckzuck') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 4, (SELECT trackID FROM Track WHERE name = 'Vom Himmel Hoch') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 5, (SELECT trackID FROM Track WHERE name = 'Rueckstoss Gondliere') );

/*
stuff for concert2:
*/
-- create row for concert2 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Nakano Sun Plaza', 'Tokyo, Japan');

-- create lineup for concert2
<<<<<<< HEAD
INSERT INTO LineupMembers (`concertID`, `members`) VALUES (2, 'Karl Bartos, Florian Schneider, Ralf Hütter, Wolfgang Flür');

-- create tracks played at concert2
INSERT INTO Track (`name`, `release`) VALUES
=======
INSERT INTO LineupMembers (concertID, memberName) VALUES (2, 'Karl Bartos'), (2, 'Ralf Hütter'), (2, 'Wolfgang Flür');

-- create tracks played at concert2
INSERT INTO Track (`name`, `release`) VALUES 
>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6
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

<<<<<<< HEAD
    -- add row to Concert for concert2
        INSERT INTO Concert (date, name, location, lineup, tour, media, notes) VALUES
        ('7/9/1981',
        ('Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'),
        (SELECT LocationID FROM `Location` WHERE venueName = 'Nakano Sun Plaza'),
        (SELECT members FROM LineupMembers WHERE `concertID` = 2),
        'Computer World Tour',
        'https://www.youtube.com/watch?v=J0vfwuSVDgw',
        'Concert from the 1981 Computer World tour in which Kraftwerk disassembled their studio to bring with them on tour. The song Its More Fun To Compute is an alternative live version'
     );

-- create tracklist for concert2
INSERT INTO Tracklist (concertID, trackNum, track) VALUES
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 1, (SELECT trackID FROM Track WHERE name = 'Beethoven-Intro') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 2, (SELECT trackID FROM Track WHERE name = 'Numbers') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 3, (SELECT trackID FROM Track WHERE name = 'Computerworld') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 4, (SELECT trackID FROM Track WHERE name = 'Computer Love') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 5, (SELECT trackID FROM Track WHERE name = 'Homecomputer') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 6, (SELECT trackID FROM Track WHERE name = 'Neonlights') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 7, (SELECT trackID FROM Track WHERE name = 'Autobahn') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 8, (SELECT trackID FROM Track WHERE name = 'Showroom Dummies') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 9, (SELECT trackID FROM Track WHERE name = 'Trans Europe Express') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 10, (SELECT trackID FROM Track WHERE name = 'The Robots') ),
    ((SELECT id FROM Concert WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'), 11, (SELECT trackID FROM Track WHERE name = 'Its More Fun To Compute') );
=======
-- create tracklist for concert2
INSERT INTO Tracklist (concertID, trackNum, track) VALUES
    (2, 1, (SELECT trackID FROM Track WHERE name = 'Beethoven-Intro') ),
    (2, 2, (SELECT trackID FROM Track WHERE name = 'Numbers') ),
    (2, 3, (SELECT trackID FROM Track WHERE name = 'Computerworld') ),
    (2, 4, (SELECT trackID FROM Track WHERE name = 'Computer Love') ),
    (2, 5, (SELECT trackID FROM Track WHERE name = 'Homecomputer') ),
    (2, 6, (SELECT trackID FROM Track WHERE name = 'Neonlights') ),
    (2, 7, (SELECT trackID FROM Track WHERE name = 'Autobahn') ),
    (2, 8, (SELECT trackID FROM Track WHERE name = 'Showroom Dummies') ),
    (2, 9, (SELECT trackID FROM Track WHERE name = 'Trans Europe Express') ),
    (2, 10, (SELECT trackID FROM Track WHERE name = 'The Robots') ),
    (2, 11, (SELECT trackID FROM Track WHERE name = 'Its More Fun To Compute') );

-- add row to Concert for concert2
-- INSERT INTO Concert (`date`, `location`, lineup, tour, tracklist, media, notes) VALUES 
INSERT INTO Concert (date, location, tour, media, notes) VALUES
    ('7/9/1981', 
    (SELECT LocationID FROM `Location` WHERE venueName = 'Nakano Sun Plaza'),
 --   (SELECT * FROM LineupMembers WHERE memberName IN ('Karl Bartos', 'Florian Schneider', 'Ralf Hütter', 'Wolfgang Flür') ),
    'Computer World Tour', 
--    (SELECT tracklist FROM Tracklist WHERE concertID = 2),
    'https://www.youtube.com/watch?v=J0vfwuSVDgw',
    'Concert from the 1981 Computer World tour in which Kraftwerk disassembled their studio to bring with them on tour. The song Its More Fun To Compute is an alternative live version'
 );


>>>>>>> 6a31402efdf99100a1066caf8dbc4a23d66ff4a6
