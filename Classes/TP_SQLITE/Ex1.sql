DROP TABLE IF EXISTS team;
DROP TABLE IF EXISTS aircraft;
DROP TABLE IF EXISTS pilot;
DROP TABLE IF EXISTS race;
DROP TABLE IF EXISTS participation;
DROP TABLE IF EXISTS duel;

CREATE TABLE team(
name VARCHAR2(50) NOT NULL,
country VARCHAR2(50) NOT NULL,
CONSTRAINT team_pk PRIMARY KEY (name)
);

CREATE TABLE aircraft(
model VARCHAR2(50) NOT NULL,
horsepower  INTEGER CHECK (horsepower > 0),
topspeed  INTEGER CHECK (topspeed  > 0),
width  INTEGER CHECK (width  > 0),
height  INTEGER CHECK (height  > 0),
weight  INTEGER CHECK (weight  > 0),
CONSTRAINT aircraft_pk PRIMARY KEY (model)
);

CREATE TABLE pilot(
num INTEGER NOT NULL,
firstname VARCHAR2(50) NOT NULL,
surname VARCHAR2(50) NOT NULL,
nationality VARCHAR2(50) NOT NULL,
birthday DATE,
name VARCHAR2(50) REFERENCES team(name),
model VARCHAR2(50) REFERENCES aircraft(model),
CONSTRAINT pilot_pk PRIMARY KEY (num),
CONSTRAINT pilot_aircraft_fk1 FOREIGN KEY (model) REFERENCES aircraft(model),
CONSTRAINT pilot_team_fk1 FOREIGN KEY (name) REFERENCES team(name)
);

CREATE TABLE race(
location VARCHAR2(50) NOT NULL,
edition INTEGER NOT NULL,
country VARCHAR2(50) NOT NULL,
date DATE NOT NULL UNIQUE,
gates INTEGER NOT NULL,
eliminations INTEGER DEFAULT 1,
CONSTRAINT race_pk PRIMARY KEY (location,edition)
);

CREATE TABLE participation(
num INTEGER NOT NULL,
location VARCHAR2(32) NOT NULL,
edition INTEGER NOT NULL,
trainingtime INTEGER CHECK (trainingtime > 0),
trainingpos INTEGER NOT NULL CHECK (trainingpos >=1),
trainingpenalty INTEGER,
qualificationtime INTEGER,
qualificationpos INTEGER CHECK (qualificationpos >= 1),
qualificationpenalty INTEGER,
eliminationtime INTEGER,
eliminationpos INTEGER CHECK (eliminationpos >=1),
eliminationpenalty INTEGER, 
CONSTRAINT participation_pk PRIMARY KEY (num,location,edition),
CONSTRAINT participation_pilot_fk1 FOREIGN KEY(location,edition) REFERENCES race (location,edition),
CONSTRAINT participation_race_fk1 FOREIGN KEY (location,edition) REFERENCES race (location,edition),
CONSTRAINT qualification CHECK ((qualificationtime IS NULL OR qualificationpos NOT NULL) AND qualificationtime >0),
CONSTRAINT elimination CHECK ((eliminationtime IS NULL OR eliminationpos NOT NULL) AND eliminationtime>0)
);

CREATE TABLE duel(
numpilot1 NUMBER NOT NULL,
numpilot2 NUMBER NOT NULL,
location varchar(50) NOT NULL,
edition INTEGER NOT NULL,
dueltype varchar(50) NOT NULL,
timepilot1 INTEGER CHECK (timepilot1 > 0),
timepilot2 INTEGER CHECK (timepilot2 > 0),
penaltypilot1 INTEGER NOT NULL,
penaltypilot2 INTEGER NOT NULL,
CONSTRAINT duel_pk PRIMARY KEY (numpilot1 ,numpilot2, location, edition),
CONSTRAINT duel_pilot1_fk1 FOREIGN KEY (numpilot1) REFERENCES pilot(num),
CONSTRAINT duel_pilot2_fk1 FOREIGN KEY (numpilot2) REFERENCES pilot(num),
CONSTRAINT duel_edition_fk1 FOREIGN KEY (location, edition) REFERENCES race(location,edition)
);

INSERT INTO team VALUES ('Matador', 'Great Britain');
INSERT INTO team VALUES ('Red Bull', 'Austria');
INSERT INTO team VALUES ('Cobra', 'USA');
INSERT INTO team VALUES ('Mediterranean Racing Team', 'Spain');
INSERT INTO team VALUES ('Lobo', 'Germany');
INSERT INTO team VALUES ('Breitling', 'Great Britain');
INSERT INTO team VALUES ('Dragon', 'Russia');

INSERT INTO aircraft VALUES ('Edge 540', 310, 426, 7.34, 2.8, 530);
INSERT INTO aircraft VALUES ('Extra 300S', 300, 407, 7.5, 2.62, 655);
INSERT INTO aircraft VALUES ('Extra 300SR', 340, 407, 8, 2.6, 550);
INSERT INTO aircraft VALUES ('MX2', 330, 426, 7.3, 1.83, 579);

INSERT INTO pilot VALUES (1, 'Kirby', 'Chambliss', 'USA', strftime('59.10.18','YY.MM.DD'), 'Red Bull', 'Edge 540');
INSERT INTO pilot VALUES (2, 'Peter', 'Besenyei', 'Hungary', strftime('56.06.08','YY.MM.DD'), 'Red Bull', 'Edge 540');
INSERT INTO pilot VALUES (3, 'Mike', 'Mangold', 'USA', strftime('55.10.10','YY.MM.DD'), 'Cobra', 'Edge 540');
INSERT INTO pilot VALUES (28, 'Hannes', 'Arch', 'Austria', strftime('67.09.22','YY.MM.DD'), 'Cobra', 'Edge 540');
INSERT INTO pilot VALUES (10, 'Nigel', 'Lamb', 'Great Britain', strftime('57.08.17','YY.MM.DD'), 'Breitling', 'MX2');
INSERT INTO pilot VALUES (7, 'Klaus', 'Schrodt', 'Germany', strftime('46.09.14','YY.MM.DD'), 'Lobo', 'Extra 300S');
INSERT INTO pilot VALUES (69, 'Frank', 'Versteegh', 'Netherlands', strftime('54.09.19','YY.MM.DD'), 'Lobo', 'Edge 540');
INSERT INTO pilot VALUES (18, 'Sergey', 'Rakhmanin', 'Russia', strftime('61.10.18','YY.MM.DD'), 'Dragon', 'Edge 540');
INSERT INTO pilot VALUES (99, 'Michael', 'Goulian', 'USA', strftime('68.09.04','YY.MM.DD'), 'Dragon', 'Edge 540');
INSERT INTO pilot VALUES (19, 'Steve', 'Jones', 'Great Britain', strftime('60.01.05','YY.MM.DD'), 'Matador', 'Edge 540');
INSERT INTO pilot VALUES (55, 'Paul', 'Bonhomme', 'Great Britain', strftime('64.09.22','YY.MM.DD'), 'Matador', 'Edge 540');
INSERT INTO pilot VALUES (27, 'Nicolas', 'Ivanoff', 'France', strftime('67.07.04','YY.MM.DD'), 'Mediterranean Racing Team', 'Extra 300SR');
INSERT INTO pilot VALUES (36, 'Alejandro', 'Maclean', 'Spain', strftime('69.08.06','YY.MM.DD'), 'Mediterranean Racing Team', 'Edge 540');

INSERT INTO race VALUES ('Porto', 2007, 'Portugal', '07-09-01', 5, 1);
INSERT INTO race VALUES ('Budapest', 2007, 'Hungary', '07-08-20', 6, 1);
INSERT INTO race VALUES ('London', 2007, 'Great Britain', '07-07-29', 7, 0);
INSERT INTO race VALUES ('Monument Valley', 2007, 'USA', '07-05-12', 8, 1);

INSERT INTO participation VALUES (2, 'Porto', 2007, 11047, 1, 0, 11111, 5, 0, 11200, 5, 0);
INSERT INTO participation VALUES (1, 'Porto', 2007, 11050, 2, 0, 11049, 2, 0, 11204, 6, 0);
INSERT INTO participation VALUES (55, 'Porto', 2007, 11086, 3, 0, 11099, 3, 0, 11108, 3, 0);
INSERT INTO participation VALUES (27, 'Porto', 2007, 11119, 4, 0, 11109, 4, 0, 11146, 4, 0);
INSERT INTO participation VALUES (36, 'Porto', 2007, 11276, 5, 0, 11786, 12, 3, 11258, 8, 0);
INSERT INTO participation VALUES (99, 'Porto', 2007, 11389, 6, 0, 11680, 11, 3, 11427, 9, 0);
INSERT INTO participation VALUES (10, 'Porto', 2007, 11453, 7, 0, 11423, 7, 0, 11239, 7, 0);
INSERT INTO participation VALUES (69, 'Porto', 2007, 11670, 8, 3, 11581, 10, 0, 11591, 11, 0);
INSERT INTO participation VALUES (7, 'Porto', 2007, 11934, 9, 0, 11841, 13, 0, null, null, null);
INSERT INTO participation VALUES (28, 'Porto', 2007, 12377, 10, 0, 11264, 7, 0, 11621, 12, 3);
INSERT INTO participation VALUES (18, 'Porto', 2007, 13048, 11, 15, 11453, 9, 0, 11504, 10, 0);
INSERT INTO participation VALUES (3, 'Porto', 2007, null, 12, -1, 11125, 6, 0, 11065, 2, 0);
INSERT INTO participation VALUES (19, 'Porto', 2007, null, 13, -1, 11083, 2, 0, 11032, 1, 0);
INSERT INTO participation VALUES (3, 'Budapest', 2007, 11240, 1, 0, 11278, 1, 0, 11374, 1, 0);
INSERT INTO participation VALUES (1, 'Budapest', 2007, 11427, 2, 0, 11342, 2, 0, 11383, 2, 0);
INSERT INTO participation VALUES (19, 'Budapest', 2007, 11471, 3, 0, 11397, 3, 0, 11485, 5, 0);
INSERT INTO participation VALUES (55, 'Budapest', 2007, 11503, 4, 0, 11401, 4, 0, 11441, 3, 0);
INSERT INTO participation VALUES (2, 'Budapest', 2007, 11757, 5, 0, 11563, 7, 0, 11459, 4, 0);
INSERT INTO participation VALUES (10, 'Budapest', 2007, 11768, 6, 0, 11524, 5, 0, 11525, 6, 0);
INSERT INTO participation VALUES (28, 'Budapest', 2007, 11895, 7, 0, 11649, 8, 0, 11889, 10, 0);
INSERT INTO participation VALUES (69, 'Budapest', 2007, 11941, 8, 0, 12012, 11, 0, 11838, 8, 0);
INSERT INTO participation VALUES (36, 'Budapest', 2007, 11984, 9, 3, 11676, 9, 0, 11835, 7, 3);
INSERT INTO participation VALUES (27, 'Budapest', 2007, 12081, 10, 3, 11553, 6, 0, null, 12, -1);
INSERT INTO participation VALUES (18, 'Budapest', 2007, 12181, 11, 0, 12024, 12, 0, 11909, 11, 0);
INSERT INTO participation VALUES (99, 'Budapest', 2007, 12269, 12, 3, 11805, 10, 0, 11885, 9, 0);
INSERT INTO participation VALUES (7, 'Budapest', 2007, 12307, 13, 0, 12437, 13, 0, null, null, null);
INSERT INTO participation VALUES (3, 'London', 2007, 12756, 1, 0, 12598, 1, 0, 12769, 2, 0);
INSERT INTO participation VALUES (55, 'London', 2007, 13028, 2, 0, 13004, 3, 3, 12757, 1, 0);
INSERT INTO participation VALUES (1, 'London', 2007, 13677, 3, 6, 13030, 6, 0, 13087, 7, 3);
INSERT INTO participation VALUES (10, 'London', 2007, 13815, 4, 3, 13014, 5, 0, 12975, 5, 0);
INSERT INTO participation VALUES (27, 'London', 2007, 13988, 5, 6, 13072, 8, 0, 13507, 9, 6);
INSERT INTO participation VALUES (2, 'London', 2007, 14808, 6, 12, 12861, 2, 0, 12792, 3, 0);
INSERT INTO participation VALUES (69, 'London', 2007, 14840, 7, 12, 13649, 10, 3, 13079, 6, 0);
INSERT INTO participation VALUES (28, 'London', 2007, 15024, 8, 15, 13006, 4, 0, 13729, 11, 6);
INSERT INTO participation VALUES (19, 'London', 2007, 15350, 9, 24, 13035, 7, 0, 13090, 8, 3);
INSERT INTO participation VALUES (36, 'London', 2007, null, 10, -1, 13181, 9, 0, 12879, 4, 0);
INSERT INTO participation VALUES (18, 'London', 2007, null, 11, -1, 13966, 11, 3, 13602, 10, 3);
INSERT INTO participation VALUES (7, 'London', 2007, null, 12, -1, 14346, 12, 0, 14130, 12, 0);
INSERT INTO participation VALUES (2, 'Monument Valley', 2007, 10023, 1, 0, 5908, 2, 0, 10276, 7, 3);
INSERT INTO participation VALUES (55, 'Monument Valley', 2007, 10131, 2, 0, 5818, 1, 0, 10001, 1, 0);
INSERT INTO participation VALUES (3, 'Monument Valley', 2007, 10257, 3, 0, 10057, 4, 0, 10147, 5, 0);
INSERT INTO participation VALUES (1, 'Monument Valley', 2007, 10269, 4, 0, 10003, 3, 0, 10046, 3, 0);
INSERT INTO participation VALUES (19, 'Monument Valley', 2007, 10528, 5, 0, 10082, 5, 0, 10200, 6, 0);
INSERT INTO participation VALUES (36, 'Monument Valley', 2007, 10602, 6, 0, 10189, 6, 0, 10017, 2, 0);
INSERT INTO participation VALUES (10, 'Monument Valley', 2007, 11119, 7, 0, 10591, 9, 0, 10362, 8, 0);
INSERT INTO participation VALUES (69, 'Monument Valley', 2007, 11217, 8, 3, 10224, 7, 0, 10055, 4, 0);
INSERT INTO participation VALUES (99, 'Monument Valley', 2007, 11296, 9, 6, 10890, 11, 3, 10716, 11, 3);
INSERT INTO participation VALUES (28, 'Monument Valley', 2007, 11312, 10, 3, 10815, 10, 3, 10512, 10, 0);
INSERT INTO participation VALUES (7, 'Monument Valley', 2007, 11596, 11, 0, 11569, 13, 3, null, null, null);
INSERT INTO participation VALUES (18, 'Monument Valley', 2007, 11936, 12, 9, 10570, 8, 0, 10473, 9, 0);
INSERT INTO participation VALUES (27, 'Monument Valley', 2007, 12000, 13, 3, 11523, 12, 0, 11113, 12, 0);

INSERT INTO duel VALUES (36, 19, 'Porto', 2007, 'QuarterFinal', 11328, 11093, 0, 0);
INSERT INTO duel VALUES (2, 27, 'Porto', 2007, 'QuarterFinal', 11176, 11228, 0, 0);
INSERT INTO duel VALUES (1, 55, 'Porto', 2007, 'QuarterFinal', 11155, 11120, 0, 0);
INSERT INTO duel VALUES (10, 3, 'Porto', 2007, 'QuarterFinal', 11249, 11205, 0, 0);
INSERT INTO duel VALUES (2, 19, 'Porto', 2007, 'SemiFinal', 11101, 11100, 0, 0);
INSERT INTO duel VALUES (3, 55, 'Porto', 2007, 'SemiFinal', 11049, 11100, 0, 0);
INSERT INTO duel VALUES (55, 2, 'Porto', 2007, 'MinorFinal', 11011, 11075, 0, 0);
INSERT INTO duel VALUES (19, 3, 'Porto', 2007, 'Final', 11000, 11038, 0, 0);
INSERT INTO duel VALUES (69, 3, 'Budapest', 2007, 'QuarterFinal', 11883, 11370, 0, 0);
INSERT INTO duel VALUES (19, 2, 'Budapest', 2007, 'QuarterFinal', 11477, 11431, 0, 0);
INSERT INTO duel VALUES (10, 55, 'Budapest', 2007, 'QuarterFinal', 11591, 11507, 0, 0);
INSERT INTO duel VALUES (36, 1, 'Budapest', 2007, 'QuarterFinal', 11663, 11299, 0, 0);
INSERT INTO duel VALUES (2, 3, 'Budapest', 2007, 'SemiFinal', 11904, 11385, 3, 0);
INSERT INTO duel VALUES (55, 1, 'Budapest', 2007, 'SemiFinal', 11463, 11313, 0, 0);
INSERT INTO duel VALUES (55, 2, 'Budapest', 2007, 'MinorFinal', 11478, 11499, 0, 0);
INSERT INTO duel VALUES (3, 1, 'Budapest', 2007, 'Final', 11285, 11503, 0, 0);
INSERT INTO duel VALUES (19, 55, 'London', 2007, 'QuarterFinal', 12773, 12552, 0, 0);
INSERT INTO duel VALUES (10, 36, 'London', 2007, 'QuarterFinal', 13013, 12817, 0, 0);
INSERT INTO duel VALUES (69, 2, 'London', 2007, 'QuarterFinal', 13122, 12579, 0, 0);
INSERT INTO duel VALUES (1, 3, 'London', 2007, 'QuarterFinal', 12736, 12579, 0, 0);
INSERT INTO duel VALUES (36, 55, 'London', 2007, 'SemiFinal', 12837, 12678, 0, 0);
INSERT INTO duel VALUES (2, 3, 'London', 2007, 'SemiFinal', 12547, 12479, 0, 0);
INSERT INTO duel VALUES (2, 36, 'London', 2007, 'MinorFinal', 12614, 12985, 0, 0);
INSERT INTO duel VALUES (3, 55, 'London', 2007, 'Final', 12582, 12725, 0, 0);
INSERT INTO duel VALUES (10, 55, 'Monument Valley', 2007, 'QuarterFinal', 10573, 10256, 0, 0);
INSERT INTO duel VALUES (3, 69, 'Monument Valley', 2007, 'QuarterFinal', 5840, 10336, 0, 0);
INSERT INTO duel VALUES (19, 1, 'Monument Valley', 2007, 'QuarterFinal', null, 10291, -1, 0);
INSERT INTO duel VALUES (2, 36, 'Monument Valley', 2007, 'QuarterFinal', 5927, 10518, 0, 3);
INSERT INTO duel VALUES (3, 55, 'Monument Valley', 2007, 'SemiFinal', 10057, 5906, 0, 0);
INSERT INTO duel VALUES (2, 1, 'Monument Valley', 2007, 'SemiFinal', 10246, 10255, 0, 0);
INSERT INTO duel VALUES (3, 1, 'Monument Valley', 2007, 'MinorFinal', 10109, null, 0, -1);
INSERT INTO duel VALUES (2, 55, 'Monument Valley', 2007, 'Final', 5987, 10084, 0, 0);
