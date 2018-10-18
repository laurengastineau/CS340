-- Authors: Martin Barker, Lauren Gastineau
-- Group: 6

DROP TABLE IF EXISTS Concert;
CREATE TABLE `Concert` (
    `id` int(11) AUTO_INCREMENT,
    `date` int(11) NOT NULL,
    `location` varchar(255) NOT NULL DEFAULT 0 REFERENCES `Location` (`venueName`),
    `lineup` varchar(255) NOT NULL REFERENCES `LineupMembers` (`members`),
    `tour` varchar(255) DEFAULT NULL,
    `tracklist` varchar(255) DEFAULT NULL REFERENCES `tracklist` (`tracklistID`),
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

-- create tracks played at concert 1
INSERT INTO Track (`name`, `release`) VALUES ('Heavy Metal Kids', 'unreleased'), ('Stratovarius', 'Kraftwerk 1'), ('Ruckzuck', 'Kraftwerk 1'), ('Vom Himmel Hoch', 'Kraftwerk 1'), ('Rueckstoss Gondliere', 'unreleased');


DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `concertID` int(11) NOT NULL REFERENCES `Concert` (`id`), 
    `track` varchar(255) NOT NULL REFERENCES `Track` (`trackID`), 
    `trackNum` int(11) NOT NULL,
    PRIMARY KEY (`concertID`, `track`)
)ENGINE=InnoDB;

/*
INSERT INTO Tracklist (concertID, trackNum, track) VALUES ((SELECT id FROM Concert WHERE date = '1971'), 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids'));
*/
/* old not working
INSERT INTO Tracklist (concertID, trackNum, track) VALUES 
    (1, 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids') ),
    (1, 2, (SELECT trackID FROM Track WHERE name = 'Stratovarius') ),
    (1, 3, (SELECT trackID FROM Track WHERE name = 'Ruckzuck') ),
    (1, 4, (SELECT trackID FROM Track WHERE name = 'Vom Himmel Hoch') ),
    (1, 5, (SELECT trackID FROM Track WHERE name = 'Rueckstoss Gondliere') );
*/

-- add row to Concert for concert1
INSERT INTO Concert (date, location, tour, lineup, media, notes, tracklist) VALUES 
    ('1971', 
    (SELECT locationID FROM `Location` WHERE venueName = 'Radio Bremen'),
    (SELECT members FROM LineupMembers WHERE `concertID` = 1),
    NULL,
    'https://www.youtube.com/watch?v=lTP-Clo62Dg',
    'Recorded without founder Ralf Hutter. Featuring Klaus Dinger of NEU! on drums. ',
    (SELECT tl.trackNum, t.name FROM Tracklist tl INNER JOIN Track t ON tl.track = t.id WHERE tl.concertID = 0),
 );




