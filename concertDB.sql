-- Authors: Martin Barker, Lauren Gastineau
-- Group: 6

DROP TABLE IF EXISTS Concert;
CREATE TABLE `Concert` (
    `id` int(11) AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `date` datetime NOT NULL,
    `locationID` int(11) NOT NULL REFERENCES `Location` (`locationID`),
    `location` varchar(255) NOT NULL DEFAULT 0,
    `lineupID` int(11) NOT NULL REFERENCES `LineupMembers` (`lineupID`),
    `lineup` varchar(255) NOT NULL,
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

DROP TABLE IF EXISTS LineupMembers;
CREATE TABLE `LineupMembers` (
    `lineupID` int(11) NOT NULL AUTO_INCREMENT,
    `concertID` int(11) NOT NULL,
    `members` varchar(255) NOT NULL,
    PRIMARY KEY (`lineupID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Track;
CREATE TABLE `Track`(
    `trackID` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `releaseName` varchar(255) NOT NULL,
    PRIMARY KEY (`trackID`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `tracklistID` int(11) NOT NULL AUTO_INCREMENT,
    `concertID` int(11) NOT NULL REFERENCES `Concert` (`id`),
    `track` varchar(255) NOT NULL REFERENCES `Track` (`trackID`),
    `trackNum` int(11) NOT NULL,
    PRIMARY KEY (`tracklistID`)
    -- PRIMARY KEY (`concertID`, `track`)
)ENGINE=InnoDB;





-- Stuff for concert1:

-- create row for concert 1 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Radio Bremen', 'Germany');
-- create row for concert 1 lineup
INSERT INTO LineupMembers (`concertID`, `members`) VALUES (1, 'Klaus Dinger, Florian Schneider, Michael Rother');
-- create tracks played at concert 1
INSERT INTO Track (`name`, `releaseName`) VALUES ('Heavy Metal Kids', 'unreleased'), ('Stratovarius', 'Kraftwerk 1'), ('Ruckzuck', 'Kraftwerk 1'), ('Vom Himmel Hoch', 'Kraftwerk 1'), ('Rueckstoss Gondliere', 'unreleased');
-- add row to Concert for concert1
INSERT INTO Concert (date, name, location, lineup, tour, media, notes) VALUES
    ('1971/1/1',
    ('Live On Radio Bremen'),
    (SELECT locationID FROM `Location` WHERE venueName = 'Radio Bremen'),
    (SELECT members FROM LineupMembers WHERE `concertID` = 1),
    NULL,
    'https://www.youtube.com/watch?v=lTP-Clo62Dg',
    'Recorded without founder Ralf Hutter. Featuring Klaus Dinger of NEU! on drums. '
 );
-- create tracklist for concert1
INSERT INTO `Tracklist` (concertID, trackNum, track) VALUES
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 2, (SELECT trackID FROM Track WHERE name = 'Stratovarius') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 3, (SELECT trackID FROM Track WHERE name = 'Ruckzuck') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 4, (SELECT trackID FROM Track WHERE name = 'Vom Himmel Hoch') ),
    ((SELECT id FROM Concert WHERE name = 'Live On Radio Bremen'), 5, (SELECT trackID FROM Track WHERE name = 'Rueckstoss Gondliere') );
 -- update concert 1 tracklist
 UPDATE Concert SET tracklist = 1 WHERE name = 'Live On Radio Bremen';

-- stuff for concert2:

-- create row for concert2 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Nakano Sun Plaza', 'Tokyo, Japan');
-- create lineup for concert2
INSERT INTO LineupMembers (`concertID`, `members`) VALUES (2, 'Karl Bartos, Florian Schneider, Ralf Hütter, Wolfgang Flür');
-- create tracks played at concert2
INSERT INTO Track (`name`, `releaseName`) VALUES
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
-- add row to Concert for concert2
        INSERT INTO Concert (date, name, location, lineup, tour, media, notes) VALUES
        ('1981/7/9',
        ('Live In Tokyo, Japan Nakano Sun Plaza 09.07.81'),
        (SELECT LocationID FROM `Location` WHERE venueName = 'Nakano Sun Plaza'),
        (SELECT members FROM LineupMembers WHERE `concertID` = 2),
        'Computer World Tour',
        'https://www.youtube.com/watch?v=J0vfwuSVDgw',
        'Concert from the 1981 Computer World tour in which Kraftwerk disassembled their studio to bring with them on tour. The song Its More Fun To Compute is an alternative live version'
     );
-- create tracklist for concert2
INSERT INTO `Tracklist` (concertID, trackNum, track) VALUES
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
 -- update concert 2 tracklist
 UPDATE Concert SET tracklist = 2 WHERE name = 'Live In Tokyo, Japan Nakano Sun Plaza 09.07.81';

-- stuff for concert 3

-- create row for concert3 location
INSERT INTO `Location` (`venueName`, `country`) VALUES ('Forum', 'Leverkusen, Germany');
-- same lineup as concert 2
-- create tracks played at concert3
INSERT INTO Track (`name`, `releaseName`) VALUES
    ('Forum-Intro', 'unreleased'),
    ('Kometenmelodie 1', 'Autobahn'),
    ('Kometenmelodie 2', 'Autobahn'),
    ('Tanzmusik', 'Autobahn'),
    ('Autobahn (40 minute version)', 'Autobahn'),
    ('Mitternacht', 'Autobahn'),
    ('Tongebirge', 'Ralf und Florian'),
    ('Morgenspaziergang', 'Autobahn');


-- add row to concert for concert 3
        INSERT INTO Concert (date, name, location, lineup, tour, media, notes) VALUES
        ('1974/4/22',
        ('Live in Leverkusen 1974'),
        (SELECT LocationID FROM `Location` WHERE venueName = 'Forum'),
        (SELECT members FROM LineupMembers WHERE `concertID` = 2),
        NULL,
        'https://www.youtube.com/watch?v=qcI8pcOy_WU',
        'Contains the longest version of Autobahn clocking in at 40 minutes long. Double the LP version length.'
     );
-- create tracklist 
INSERT INTO `Tracklist` (concertID, trackNum, track) VALUES
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 1, (SELECT trackID FROM Track WHERE name = 'Forum-Intro') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 2, (SELECT trackID FROM Track WHERE name = 'Ruckzuck') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 3, (SELECT trackID FROM Track WHERE name = 'Kometenmelodie 1') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 4, (SELECT trackID FROM Track WHERE name = 'Kometenmelodie 2') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 5, (SELECT trackID FROM Track WHERE name = 'Tanzmusik') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 6, (SELECT trackID FROM Track WHERE name = 'Autobahn (40 minute version)') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 7, (SELECT trackID FROM Track WHERE name = 'Showroom Dummies') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 8, (SELECT trackID FROM Track WHERE name = 'Mitternacht') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 9, (SELECT trackID FROM Track WHERE name = 'Showroom Dummies') ), 
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 10, (SELECT trackID FROM Track WHERE name = 'Tongebirge') ),
    ((SELECT id FROM Concert WHERE name = 'Live in Leverkusen 1974'), 11, (SELECT trackID FROM Track WHERE name = 'Morgenspaziergang') );
 -- update concert 3 tracklist
 UPDATE Concert SET tracklist = 3 WHERE name = 'Live in Leverkusen 1974';