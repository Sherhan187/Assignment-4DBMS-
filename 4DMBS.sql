 
CREATE TABLE Artist ( 
  artID INT NOT NULL, 
  artName VARCHAR(255) NOT NULL, 
  CONSTRAINT pk_artist PRIMARY KEY (artID), 
  CONSTRAINT ck_artist UNIQUE (artName) 
); 
 
CREATE TABLE CD ( 
  cdID serial NOT NULL,
  artID INT NOT NULL, 
  cdTitle VARCHAR(255) NOT NULL, 
  cdPrice REAL NOT NULL, 
  cdGenre VARCHAR(255) NULL, 
  cdNumTracks INT NULL, 
  CONSTRAINT pk_cd PRIMARY KEY (cdID), 
  CONSTRAINT  fk_cd_art  FOREIGN  KEY  (artID)  REFERENCES  Artist 
(artID) 
); 


-- 1 insert (OUTPUTS)
INSERT INTO Artist (artID, artName) Values 
(6,'Animal Collective'), (3, 'Deadmau5'),
(7, 'Kings of Leon'), (4, 'Mark Ronson'),(5, 'Mark Ronson & The Business Intl'),
(8, 'Maroon 5'), (2, 'Mr. Scruff'), (1, 'Muse');

SELECT * FROM Artist order by artID;

INSERT INTO CD (artID, cdTitle, cdPrice, cdGenre)
VALUES (1, 'Black Holes and Revelations', 9.99, 'Rock'),
(1, 'The Resistance ', 11.99, 'Rock'),
(2, 'Ninja Tuna ', 9.99, 'Electronica '),
(3, 'For Lack of a Better Name ', 9.99, 'Electro House '),
(4, 'Record Collection ', 11.99, 'Alternative Rock'),
(5, 'Version', 12.99, 'Pop'),
(6, 'Merriweather Post Pavilion', 12.99, 'Electronica '),
(7, 'Only By The Night', 9.99, 'Rock '),
(7, 'Come Around Sundown', 12.99, 'Rock'),
(8, 'Hands All Over', 11.99, ' Pop ');

SELECT *FROM CD;

---Exercise1
SELECT * FROM Artist order by artID;
---SELECTING SPECIFIC COLUMNS
SELECT cdTitle AS Title, cdGenre AS Genre FROM CD;

---Exercise2
---Output1
SELECT artName FROM Artist;
---Ouput2
SELECT cdGenre FROM CD;
---Output 3
SELECT cdTitle,cdPrice FROM CD;
SELECT DISTINCT cdGenre AS Genre FROM CD;
---Output 4
SELECT DISTINCT ON (artID) artID, cdGenre FROM CD ORDER BY artID,cdGenre;
---USING WHERE CLAUSES
 SELECT * FROM CD WHERE cdPrice > 10.00;
 SELECT * FROM CD WHERE cdGenre = 'Rock';
 SELECT * FROM CD WHERE cdGenre <> 'Rock';
---Output 5
SELECT * FROM CD WHERE cdGenre = 'Electronica ';
---Output 6
SELECT cdTitle,cdPrice FROM CD WHERE cdPrice < 10.00;
---example AND OR NOT
SELECT * FROM CD WHERE (cdPrice < 10.00) AND NOT (cdGenre ='Rock');

---Ouput 7
SELECT * FROM CD WHERE (cdGenre = 'Pop') OR (cdPRice > 10.00);

---Ouput 8
SELECT cdTitle,cdPrice FROM CD WHERE (cdGenre = 'Rock') AND (cdPrice > 10.00)
AND (cdPrice < 12.00);

---Output 9
SELECT cdTitle,cdGEnre,cdPrice FROM CD WHERE (cdPrice < 10.00)
AND ((cdGenre = 'Rock') OR (cdGenre = 'Electronica '));
---SELECTING FROM MULTIPLE TABLES
SELECT * FROM Artist, CD;

---Output 10
SELECT * FROM Artist, CD WHERE (Artist.artID = CD.artID);

---Output 11
SELECT cdTitle FROM Artist, CD  ORDER BY artName = 'Muse';

---Ouput 12
SELECT DISTINCT ON (artName) artName FROM Artist,CD WHERE (cdGenre = 'Rock');

---Ouput 13
SELECT DISTINCT ON (artName) artName, cdTitle, cdGenre FROM Artist, CD
WHERE (cdPrice < 12.00);

---Output 14
SELECT * FROM Artist, CD WHERE (Artist.artID = CD.artID);
SELECT cdTitle FROM Artist, CD  ORDER BY artName = 'Muse';
SELECT DISTINCT ON (artName) artName FROM Artist,CD WHERE (cdGenre = 'Rock');
SELECT DISTINCT ON (artName) artName, cdTitle, cdGenre FROM Artist, CD
WHERE (cdPrice < 12.00);
