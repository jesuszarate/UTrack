CREATE TABLE Users(
login char(30),
name varchar(40),
userType boolean, 
password varchar(100),
address varchar(50),
phone_num varchar(20),
PRIMARY KEY (login));

INSERT INTO Users
(login, name, userType, password, address, phone_num)
VALUES
('hello', 'helloworld', 'programmer', 'helloworld8', '222 south main', '(801)555-8460');

-----------------------------------------------------------------------------------------------
CREATE TABLE POI(
pid INTEGER,
name VARCHAR(50), 
category VARCHAR(20), 
PRIMARY KEY (pid));

INSERT INTO POI
(pid, name, category)
VALUES
(200, 'Jack Mormon', 'coffee shop');

INSERT INTO POI
(name, category)
VALUES
('Toshs Ramen', 'Restaurant');

-----------------------------------------------------------------------------------------------

CREATE TABLE VisEvent(
vid INTEGER,
cost INTEGER, 
numberofheads INTEGER,
PRIMARY KEY(vid));

INSERT INTO VisEvent
(vid, cost, numberofheads)
VALUES
(300, 20, 2);

-----------------------------------------------------------------------------------------------

CREATE TABLE Visit(
login char(30),
pid INTEGER,
vid INTEGER,
visitdate DATE,
PRIMARY KEY (login, pid, vid),
FOREIGN KEY (login) REFERENCES Users (login),
FOREIGN KEY (pid) REFERENCES POI (pid),
FOREIGN KEY (vid) REFERENCES VisEvent (vid));


INSERT INTO Visit
(login, pid, vid, visitdate)
VALUES
('chuy8jay', 200, 300, to_date(03142016));

ALTER TABLE VisEvent MODIFY COLUMN vid INT auto_increment;
-----------------------------------------------------------------------------------------------

CREATE TABLE Trust(
login1 char(30),
login2 char(30),
isTrusted boolean,
PRIMARY KEY (login1, login2),
FOREIGN KEY (login1) REFERENCES Users (login),
FOREIGN KEY (login2) REFERENCES Users (login));

INSERT INTO Trust
(login1, login2, isTrusted)
VALUES
('chuy8jay', 'jay8chuy', 1);

-----------------------------------------------------------------------------------------------

CREATE TABLE Rates(
login CHAR(30),
fid INTEGER,
rating CHAR(20),
PRIMARY KEY (login,fid),
FOREIGN KEY (login) REFERENCES Users (login),
FOREIGN KEY (fid) REFERENCES Feedback (fid));

INSERT INTO Rates
(login, fid, rating)
VALUES
('chuy8jay', 400, 'Very Good');

-----------------------------------------------------------------------------------------------

CREATE TABLE Feedback(
fid INTEGER,
pid INTEGER NOT NULL,
login char(30) NOT NULL,
text char(100),
fbdate date,
score INTEGER,
PRIMARY KEY (fid),
FOREIGN KEY (pid) REFERENCES POI (pid),
FOREIGN KEY (login) REFERENCES Users (login));


INSERT INTO Feedback
(fid, pid, login, text, fbdate, score)
VALUES
(400, 200, 'chuy8jay', 'Best coffee ever','2016-14-03', 10);

ALTER TABLE Feedback MODIFY COLUMN fid INT auto_increment;
ALTER TABLE Feedback AUTO_INCREMENT=300;
-----------------------------------------------------------------------------------------------

CREATE TABLE Favorites(
pid INTEGER NOT NULL,
login char(30) NOT NULL,
fvdate date,
PRIMARY KEY (pid, login),
FOREIGN KEY (pid) REFERENCES POI (pid),
FOREIGN KEY (login) REFERENCES Users (login));

INSERT INTO Favorites
(pid, login, fvdate)
VALUES
(200, 'chuy8jay', '2016-14-03');

-----------------------------------------------------------------------------------------------

CREATE TABLE Keywords(
wid INTEGER,
word CHAR(50), 
language CHAR(20),
PRIMARY KEY(wid));

INSERT INTO Keywords
(wid, word, language)
VALUES
(500, 'coffee', 'English');


-----------------------------------------------------------------------------------------------

CREATE TABLE HasKeywords(
pid INTEGER,
wid INTEGER,
PRIMARY KEY (pid, wid),
FOREIGN KEY (pid) REFERENCES POI (pid),
FOREIGN KEY (wid) REFERENCES Keywords (wid));

INSERT INTO HasKeywords
(pid, wid)
VALUES
(200, 500);

ALTER TABLE Keywords AUTO_INCREMENT=400;
ALTER TABLE Keywords MODIFY COLUMN wid INT auto_increment;

-----------------------------------------------------------------------------------------------
-- To delete without the constraints
SET foreign_key_checks = 1; 