/*
Mohammad Shahid Foy
Homework2
CS 3810
Mrs. Cohen
*/

CREATE TABLE Countries (
	name VARCHAR(20) PRIMARY KEY,
	latitude INT,
	longitude INT,
	area INT,
	population INT,
	gdp BIGINT,
	gdpYear INT
);

CREATE TABLE Borders (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20) references Countries(name),
	neighbor VARCHAR(20) references Countries(name)
);

/* inserts Countries */

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Germany', 900, 5100, 357022, 80594017, 3979000000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Netherlands', 545, 5230, 41543, 17084719, 870800000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Belgium', 400, 5050, 30528, 11491346, 508600000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Luxemburg', 610, 4945, 2586, 594130, 58740000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Poland', 2000, 5200, 312685, 38476269, 1052000000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Czech Republic', 1530, 4945, 78867, 10674723, 350900000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Austria', 1320, 4720, 83871, 8754413, 416600000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('France', 200, 4600, 643801, 67106161, 2699000000000, 2016);

INSERT INTO Countries (name, latitude, longitude, area, population, gdp, gdpYear)
VALUES ('Switzerland', 800, 4700, 41277, 8236303, 496300000000, 2016);

/* inserts Borders */

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Netherlands');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Belgium');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Luxemburg');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Poland');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Czech Republic');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Austria');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'France');

INSERT INTO Borders (name, neighbor)
VALUES ('Germany', 'Switzerland');

INSERT INTO Borders (name, neighbor)
VALUES ('Netherlands', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Netherlands', 'Belgium');

INSERT INTO Borders (name, neighbor)
VALUES ('Belgium', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Belgium', 'Netherlands');

INSERT INTO Borders (name, neighbor)
VALUES ('Belgium', 'Luxemburg');

INSERT INTO Borders (name, neighbor)
VALUES ('Belgium', 'France');

INSERT INTO Borders (name, neighbor)
VALUES ('Luxemburg', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Luxemburg', 'Belgium');

INSERT INTO Borders (name, neighbor)
VALUES ('Luxemburg', 'France');

INSERT INTO Borders (name, neighbor)
VALUES ('Poland', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Poland', 'Czech Republic');

INSERT INTO Borders (name, neighbor)
VALUES ('Czech Republic', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Czech Republic', 'Poland');

INSERT INTO Borders (name, neighbor)
VALUES ('Czech Republic', 'Austria');

INSERT INTO Borders (name, neighbor)
VALUES ('Austria', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Austria', 'Czech Republic');

INSERT INTO Borders (name, neighbor)
VALUES ('Austria', 'Switzerland');

INSERT INTO Borders (name, neighbor)
VALUES ('France', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('France', 'Belgium');

INSERT INTO Borders (name, neighbor)
VALUES ('France', 'Luxemburg');

INSERT INTO Borders (name, neighbor)
VALUES ('France', 'Switzerland');

INSERT INTO Borders (name, neighbor)
VALUES ('Switzerland', 'Germany');

INSERT INTO Borders (name, neighbor)
VALUES ('Switzerland', 'France');

INSERT INTO Borders (name, neighbor)
VALUES ('Switzerland', 'Austria');

/* query to display all countries that border Germany */
SELECT neighbor FROM Borders WHERE name='Germany';

/* selects countries with population of 35 million */
SELECT name FROM Countries WHERE population > 35000000;

/* 
 selects countries with population of 10 million 
 and borders germany
*/
SELECT Countries.name FROM Countries 
INNER JOIN Borders ON Countries.name = Borders.name 
WHERE Borders.neighbor = 'Germany' AND Countries.population > 35000000;