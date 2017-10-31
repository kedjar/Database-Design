-- Assignment # 4
-- CCCS 330 - Database Design & Business Application Development
-- M’Hand Kedjar

-- STEP 1 & 2
-----------------------------------------------------------------------------------------
------------------CREATING THE TABLES AND DEFINING THE CONSTRAINTS-----------------------
-----------------------------------------------------------------------------------------
CREATE TABLE Location(
LocationID VARCHAR(5),
Address VARCHAR(50),
City VARCHAR(20),
STATE CHAR(2),
Zip CHAR(5),
MangerName VARCHAR(40),
PhoneNumber CHAR(10),
OpeningDate DATE,
CONSTRAINT PK_LocationID PRIMARY KEY(LocationID)
);

CREATE TABLE Instructor(
InstructorID VARCHAR(5),
InstructorFirstName VARCHAR(20),
InstructorLastName VARCHAR(20),
LocationID VARCHAR(5),
FullTime BOOLEAN,
HireDate DATE,
CONSTRAINT PK_InstrctorID PRIMARY KEY(InstructorID),
CONSTRAINT FK_LocationID FOREIGN KEY(LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE ClassSchedule(
ClassID VARCHAR(5),
ClassDescription VARCHAR(50),
LocationID VARCHAR(5),
InstructorID VARCHAR(5),
ClassTime TIME,
ClassPrice DECIMAL(9,2),
NumberOfStudents INT,
CONSTRAINT PK_ClassID PRIMARY KEY(ClassID),
CONSTRAINT FK2_LocationID FOREIGN KEY(LocationID) REFERENCES Location(LocationID),
CONSTRAINT FK2_InstructorID FOREIGN KEY(InstructorID) REFERENCES Instructor(InstructorID)
);

-----------------------------------------------------------------------------------------
-------------------------------INSERTING VALUES INTO THE TABLES--------------------------
-----------------------------------------------------------------------------------------
INSERT INTO Location
VALUES
('l1','1855 Platte River La','Denver','CO','80201','Steph Cook','7028378483','2000-02-01'),
('l2','23 Colorado Blvd','Denver','c0','80201','Ed Jones','7023943984','2001-01-01'),
('l3','101 Main Street','Boulder','Co','80303','Krista Sanchez','7028239231','2001-06-01'),
('L4','99 2nd Street','Aspen','Co','81612', 'Katie Everheart','7023435843','2002-01-01'),
('l5','4534 Olive Mill','Santa Barbara','CA','93101','Paula Garrett','6197984759','2002-04-01'),
('l6','9881 Nautilus','La Jolla','Ca','92038','Tim Ortiz','6192727272','2003-01-01'),
('l7','898 Sinatra Blvd','Las Vegas','NV','89123','Wayne Star','3232344556','2003-07-01');

INSERT INTO Instructor
VALUES
	('T01', 'Tabitha', 'Jardin', 'L1', 'TRUE', '2003-03-01'),
	('t02', 'Wanda', 'Clark', 'L1', 'FALSE', '2001-01-01'),
	('t03', 'Ed', 'Fisher', 'L1', 'TRUE', '2003-12-02'),
	('t04', 'James', 'Elliott', 'L1', 'TRUE', '2005-01-01'),
	('t05', 'Mary', 'Coughlin', 'L2', 'FALSE', '2000-11-01'),
	('t06', 'Carole', 'Powers', 'L2', 'TRUE', '2001-06-01'),
	('t07', 'Isabella', 'Mathews', 'L2', 'TRUE', '2003-11-01'),
	('t08', 'Pamela', 'Grunt', 'L2', 'TRUE', '2003-09-01'),
	('T09', 'Cora', 'Web', 'L3', 'FALSE', '2004-05-01'),
	('t10', 'Jason', 'Nomind', 'L3', 'TRUE', '2005-08-01'),
	('t11', 'Chuck', 'Quigley', 'L3', 'TRUE', '2004-07-01'),
	('t12', 'Bob', 'Sora', 'L3', 'TRUE', '2003-01-01'),
	('t13', 'Bruce', 'Wolf', 'L4', 'FALSE', '2002-04-01'),
	('T14', 'Stephen', 'Hoover', 'L4', 'TRUE', '2002-04-01'),
	('T15', 'Harriott', 'Ray', 'L4', 'TRUE', '2003-07-01'),
	('t16', 'Patricia', 'Fitzgerald', 'L5', 'FALSE', '2005-03-01'),
	('t17', 'Mark', 'Lesswing', 'L5', 'FALSE', '2003-02-01'),
	('t18', 'Pam', 'Beard', 'L5', 'TRUE', '2005-10-01'),
	('t19', 'Gerry', 'Janik', 'L5', 'FALSE', '2004-03-01'),
	('t20', 'David', 'Sibley', 'L6', 'TRUE', '2004-09-01'),
	('T21', 'Alex', 'Bull', 'L6', 'FALSE', '2002-04-01'),
	('T22', 'Sandra', 'Blanie', 'L6', 'TRUE', '2004-12-01'),
	('t23', 'David', 'Bessette', 'L6', 'FALSE', '2004-05-01'),
	('t24', 'Barbara', 'Millett', 'L7', 'TRUE', '2004-08-01'),
	('t25', 'Joyce', 'Kutzkey', 'L7', 'FALSE', '2004-06-01'),
	('T26', 'Wndy', 'Gantt', 'L7', 'FALSE', '2003-10-01');

INSERT INTO ClassSchedule
VALUES
	('c001', 'Intermediate', 'l1', 't01', '6:00', '16', '20'), 
	('c002', 'Beginning', 'l1', 't01', '12:00', '12', '10'),
	('C003', 'Intermediate', 'l1', 't02', '18:00', '16', '13'),
	('c004', 'Advanced', 'l1', 't03', '20:00', '16', '23'),
	('c005', 'Beginning', 'l2', 't05', '6:00', '9', '15'),
	('c006', 'Intermediate', 'l2', 't07', '18:00', '12', '12'),
	('c007', 'Advanced', 'l2', 't08', '20:00', '16', '18'),
	('c008', 'Intermediate', 'l3', 't09', '6:00', '15', '12'),
	('c009', 'Advanced', 'l3', 't10', '12:00', '10', '10'),
	('c010', 'Beginning', 'l3', 't11', '17:30', '13', '20'),
	('c011', 'Advanced', 'l3', 't19', '20:00', '16', '10'),
	('c012', 'Beginning', 'l4', 't13', '7:00', '10', '14'),
	('c013', 'Advanced', 'l4', 't14', '10:00', '14', '10'),
	('c014', 'Advanced', 'l4', 't14', '12:00', '15', '11'),
	('c015', 'Intermediate', 'l4', 't15', '17:00', '11', '15'),
	('c016', 'Beginning', 'l4', 't15', '18:30', '12', '16'),
	('c017', 'Intermediate', 'l4', 't13', '19:00', '11', '15'),
	('c018', 'Beginning', 'l5', 't16', '6:30', '14', '8'),
	('c019', 'Advanced', 'l5', 't17', '12:00', '13', '12'),
	('c020', 'Advanced', 'l5', 't18', '18:00', '14', '17'),
	('c021', 'Intermediate', 'l5', 't19', '20:00', '15', '23'),
	('c022', 'Advanced', 'l6', 't20', '7:00', '10', '25'),
	('C023', 'Beginning', 'L6', 'T21', '13:00', '15', '13'),
	('C024', 'Advanced', 'L6', 'T22', '16:00', '17', '18'),
	('C025', 'Advanced', 'L6', 'T23', '19:00', '12', '13'),
	('C026', 'Beginning', 'L7', 'T24', '7:00', '14', '12');

-----------------------------------------------------------------------------------------
-------------------------------- STEP 3: CREATING VIEWS  --------------------------------
----------------------------------------------------------------------------------------- 
-- 1. You want to have a view that will give access to class time, class description, 
-- and instructor teaching in a particular city? 
CREATE VIEW CityDetails
AS
SELECT ClassTime , ClassDescription,InstructorFirstName, InstructorLastName, City
FROM ClassSchedule, Instructor, Location
WHERE Instructor.InstructorID = ClassSchedule.InstructorID
AND Location.LocationID = ClassSchedule.LocationID;

SELECT ClassTime,ClassDescription,InstructorFirstName,InstructorLastName,City
FROM CityDetails
WHERE City ='Denver';

-- 2. Management is thinking about adding more classes to the schedule, so you want to 
-- investigate which classes yield the most revenue. What is the total revenue by class 
-- description?
CREATE VIEW ClassLevelRevenuDetails
AS
SELECT ClassDescription, SUM(ClassPrice*NumberOfStudents) AS Revenu
FROM ClassSchedule
GROUP BY ClassDescription;

SELECT ClassDescription, Revenu AS "Revenu $"
FROM ClassLevelRevenuDetails;

-- 3. You also want to create a view to find out the revenue by location. In particular 
-- you want to highlight the locations that are doing worst. Management should consider
-- creating marketing campaign for those locations or closing those studios in the future.
CREATE VIEW LocationRevenuDetails
AS
SELECT ClassSchedule.LocationID, City, SUM(ClassPrice*NumberOfStudents) AS Revenu
FROM ClassSchedule, Location
WHERE ClassSchedule.LocationID = Location.LocationID
GROUP BY ClassSchedule.LocationID, City;

SELECT LocationID, City, Revenu AS "Revenu $"
FROM LocationRevenuDetails; 

-- 4. You want to give your top instructors seniority and offer them right of first 
-- refusal to teach any classes that become available. Create a derived table for 
-- the top instructors. Maybe a good amount to be considered is $300.
CREATE VIEW InstructorRevenuDetails
AS
SELECT Instructor.InstructorID, InstructorFirstName, InstructorLastName,
SUM(ClassPrice*NumberOfStudents) AS Revenu
FROM  Instructor, ClassSchedule
WHERE Instructor.InstructorID = ClassSchedule.InstructorID	          
GROUP BY Instructor.InstructorID, InstructorFirstName, InstructorLastName;

CREATE TABLE TopInstructor 
SELECT * FROM InstructorRevenuDetails
WHERE Revenu> 300;

-- 5. You also want to create a view that identifies the classes that produce 
-- the least revenue and notify the studios that these classes will be cancelled.
CREATE VIEW ClassRevenuDetails 
AS
SELECT ClassID, ClassDescription, Address, City, 
SUM(ClassPrice*NumberOfStudents) AS Revenu
FROM  ClassSchedule, Location	          
WHERE Location.LocationID = ClassSchedule.LocationID	          
GROUP BY ClassID, ClassDescription, Address, City;

DELETE FROM ClassSchedule
WHERE ClassID = (SELECT ClassID
FROM ClassRevenuDetails
WHERE Revenu = (SELECT MIN(Revenu) FROM ClassRevenuDetails ));