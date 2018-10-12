
-- create table for concert
DROP TABLE IF EXISTS Concert;
CREATE TABLE `Concert` (
    `id` int(11) AUTO_INCREMENT,
    `date` int(11) NOT NULL,
    `tracklist` varchar(255) DEFAULT NULL REFERENCES `Tracklist` (`tracklistID`),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- create table for track
DROP TABLE IF EXISTS Track;
CREATE TABLE `Track`(
    `trackID` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`trackID`)
) ENGINE=InnoDB;
-- add tracks to table
INSERT INTO Track (`name`) VALUES ('Heavy Metal Kids'), ('Stratovarius');

-- create table for tracklist
DROP TABLE IF EXISTS Tracklist;
CREATE TABLE `Tracklist` (
    `tracklistID` int(11) AUTO_INCREMENT,
    `concertID` int(11) NOT NULL REFERENCES `Concert` (`id`),
    `trackID` varchar(255) NOT NULL REFERENCES `Track` (`trackID`),
    `trackNum` int(11) NOT NULL,
    PRIMARY KEY (`tracklistID`)
)ENGINE=InnoDB;
-- add to tracklist
INSERT INTO Tracklist (concertID, trackID, trackNum) VALUES
    (1, 1, (SELECT trackID FROM Track WHERE name = 'Heavy Metal Kids') ),
    (1, 2, (SELECT trackID FROM Track WHERE name = 'Stratovarius') );

-- add row to Concert for concert1
INSERT INTO Concert (date,  tracklist) VALUES ('1971', (SELECT concertID FROM Tracklist WHERE concertID = 1))
