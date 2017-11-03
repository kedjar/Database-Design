-- Assignment # 3
-- CCCS 330 - Database Design & Business Application Development
-- M’Hand Kedjar

-- Part A: TinyVideo is a small movie rental company with a single store. TinyVideo needs a database system to track the rental of movies to its members. TinyVideo can own several copies (VIDEO) of each movie (MOVIE). For example, the store may have 10 copies of the movie “Twist in the Wind”. “Twist in the Wind” would be one MOVIE and each copy would be a VIDEO. A rental transaction (RENTAL) involves one or more videos being rented to a member (MEMBERSHIP). A video can be rented many times over its lifetime, therefore, there is a M:N relationship between RENTAL and VIDEO. DETAILRENTAL is the bridge table to resolve this relationship. The complete ERD is provided below

-- 1. Write the SQL code to create the table structures for the entities shown in Figure below. The structures should contain the attributes specified in the ERD. Use data types that would be appropriate for the data that will need to be stored in each attribute. Enforce primary key and foreign key constraints as indicated by the ERD.
CREATE TABLE MEMBERSHIP(
MEM_NUM INTEGER PRIMARY KEY,
MEM_FNAME VARCHAR(15) NOT NULL,
MEM_LNAME VARCHAR(15) NOT NULL,
MEM_STREET VARCHAR(30),
MEM_CITY VARCHAR(15),
MEM_STATE CHAR(2),
MEM_ZIP CHAR(5),
MEM_BALANCE NUMBER);

CREATE TABLE RENTAL(
RENT_NUM INTEGER PRIMARY KEY,
RENT_DATE DATE,
MEM_NUM INTEGER,
FOREIGN KEY (MEM_NUM) REFERENCES MEMBERSHIP);

CREATE TABLE PRICE(
PRICE_CODE INTEGER PRIMARY KEY,
PRICE_DESCRIPTION VARCHAR(30),
PRICE_RENTFEE NUMBER,
PRICE_DAILYLATEFEE INTEGER);

CREATE TABLE MOVIE(
MOVIE_NUM INTEGER PRIMARY KEY,
MOVIE_TITLE VARCHAR(30),
MOVIE_YEAR INTEGER,
MOVIE_COST NUMBER, 
MOVIE_GENRE VARCHAR(15),
PRICE_CODE INTEGER,
FOREIGN KEY (PRICE_CODE) REFERENCES PRICE);

CREATE TABLE VIDEO(
VID_NUM INTEGER PRIMARY KEY,
VID_INDATE DATE,
MOVIE_NUM INTEGER,
FOREIGN KEY (MOVIE_NUM) REFERENCES MOVIE);

CREATE TABLE DETAILRENTAL(
RENT_NUM INTEGER NOT NULL,
VID_NUM INTEGER NOT NULL,
DETAIL_FEE NUMBER,
DETAIL_DUEDATE DATE,
DETAIL_RETURNDATE DATE,
DETAIL_DAILYLATEFEE INTEGER,
PRIMARY KEY (RENT_NUM,VID_NUM),
FOREIGN KEY (RENT_NUM) REFERENCES RENTAL,
FOREIGN KEY (VID_NUM) REFERENCES VIDEO);

-- 2. The following tables provide a very small portion of the data that will be kept in the database. This data needs to be inserted into the database for testing purposes. Write the INSERT commands necessary to place the following data in the tables that were created in problem 2.
INSERT ALL
INTO MEMBERSHIP VALUES(102,'Tami','Dawson','2632 Takli Circle','Norene','TN',37136,11)
INTO MEMBERSHIP VALUES(103,'Curt','Knight','4025 Cornell Court','Flatgap','KY',41219,6)
INTO MEMBERSHIP VALUES(104,'Jamal','Melendez','788 East 145th Avenue','Quebeck','TN',38579,0)
INTO MEMBERSHIP VALUES(105,'Iva','Mcclain','6045 Musket Ball Circle','Summit','KY',42783,15)
INTO MEMBERSHIP VALUES(106,'Miranda','Parks','4469 Maxwell Place','Germantown','TN',38183,0)
INTO MEMBERSHIP VALUES(107,'Rosario','Elliott','7578 Danner Avenue','Columbia','TN',38402,5)
INTO MEMBERSHIP VALUES(108,'Mattie','Guy','4390 Evergreen Street','Lily','KY',40740,0)
INTO MEMBERSHIP VALUES(109,'Clint','Ochoa','1711 Elm Street','Greeneville','TN',37745,10)
INTO MEMBERSHIP VALUES(110,'Lewis','Rosales','4524 Southwind Circle','Counce','TN',38326,0)
INTO MEMBERSHIP VALUES(111,'Stacy','Mann','2789 East Cook Avenue','Murfreesboro','TN',37132,8)
INTO MEMBERSHIP VALUES(112,'Luis','Trujillo','7267 Melvin Avenue','Heiskell','TN',37754,3)
INTO MEMBERSHIP VALUES(113,'Minnie','Gonzales','6430 Vasili Drive','Williston','TN',38076,0)
SELECT * FROM DUAL;

INSERT ALL
INTO RENTAL VALUES(1001,TO_DATE('01/03/2012','DD/MM/YY'),103)
INTO RENTAL VALUES(1002,TO_DATE('01/03/2012','DD/MM/YY'),105)
INTO RENTAL VALUES(1003,TO_DATE('02/03/2012','DD/MM/YY'),102)
INTO RENTAL VALUES(1004,TO_DATE('02/03/2012','DD/MM/YY'),110)
INTO RENTAL VALUES(1005,TO_DATE('02/03/2012','DD/MM/YY'),111)
INTO RENTAL VALUES(1006,TO_DATE('02/03/2012','DD/MM/YY'),107)
INTO RENTAL VALUES(1007,TO_DATE('02/03/2012','DD/MM/YY'),104)
INTO RENTAL VALUES(1008,TO_DATE('03/03/2012','DD/MM/YY'),105)
INTO RENTAL VALUES(1009,TO_DATE('03/03/2012','DD/MM/YY'),111)
SELECT * FROM DUAL;

INSERT ALL
INTO PRICE VALUES(1,'Standard',2,1)
INTO PRICE VALUES(2,'New Release',3.5,3)
INTO PRICE VALUES(3,'Discount',1.5,1)
INTO PRICE VALUES(4,'Weekly Special','1',0.5)
SELECT * FROM DUAL;

INSERT ALL
INTO MOVIE VALUES(1234,'The Cesar Family Christmas',2007,39.95,'FAMILY',2)
INTO MOVIE VALUES(1235,'Smokey Mountain Wildlife',2004,59.95,'ACTION',1)
INTO MOVIE VALUES(1236,'Richard Goodhope',2008,59.95,'DRAMA',2)
INTO MOVIE VALUES(1237,'Beatnik Fever',2007,29.95,'COMEDY',2)
INTO MOVIE VALUES(1238,'Constant Companion',2008,89.95,'DRAMA',2)
INTO MOVIE VALUES(1239,'Where Hope Dies',1998,25.49,'DRAMA',3)
INTO MOVIE VALUES(1245,'Time to Burn',2005,45.49,'ACTION',1)
INTO MOVIE VALUES(1246,'What He Doesn''t Know',2006,58.29,'COMEDY',1)
SELECT * FROM DUAL;

INSERT ALL 
INTO VIDEO VALUES(54321,TO_DATE('18/06/2010','DD/MM/YY'),1234)
INTO VIDEO VALUES(54324,TO_DATE('18/06/2011','DD/MM/YY'),1234)
INTO VIDEO VALUES(54325,TO_DATE('18/06/2011','DD/MM/YY'),1234)
INTO VIDEO VALUES(34341,TO_DATE('22/01/2009','DD/MM/YY'),1235)
INTO VIDEO VALUES(34342,TO_DATE('22/01/2009','DD/MM/YY'),1235)
INTO VIDEO VALUES(34366,TO_DATE('02/03/2010','DD/MM/YY'),1236)
INTO VIDEO VALUES(34367,TO_DATE('02/03/2010','DD/MM/YY'),1236)
INTO VIDEO VALUES(34368,TO_DATE('02/03/2010','DD/MM/YY'),1236)
INTO VIDEO VALUES(34369,TO_DATE('02/03/2010','DD/MM/YY'),1236)
INTO VIDEO VALUES(44392,TO_DATE('21/10/2011','DD/MM/YY'),1237)
INTO VIDEO VALUES(44397,TO_DATE('21/10/2011','DD/MM/YY'),1237)
INTO VIDEO VALUES(59237,TO_DATE('14/02/2010','DD/MM/YY'),1237)
INTO VIDEO VALUES(61388,TO_DATE('25/01/2010','DD/MM/YY'),1239)
INTO VIDEO VALUES(61353,TO_DATE('28/01/2010','DD/MM/YY'),1245)
INTO VIDEO VALUES(61354,TO_DATE('28/01/2010','DD/MM/YY'),1245)
INTO VIDEO VALUES(61367,TO_DATE('30/07/2010','DD/MM/YY'),1246)
INTO VIDEO VALUES(61369,TO_DATE('30/07/2010','DD/MM/YY'),1246)
SELECT * FROM DUAL;

INSERT ALL
INTO DETAILRENTAL VALUES(1001,34342,2,TO_DATE('04/03/2012','DD/MM/YY'),TO_DATE('02/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1001,61353,2,TO_DATE('04/03/2012','DD/MM/YY'),TO_DATE('03/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1002,59237,3.5,TO_DATE('04/03/2012','DD/MM/YY'),TO_DATE('04/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1003,54325,3.5,TO_DATE('04/03/2012','DD/MM/YY'),TO_DATE('09/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1003,61369,2,TO_DATE('06/03/2012','DD/MM/YY'),TO_DATE('09/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1003,61388,0,TO_DATE('06/03/2012','DD/MM/YY'),TO_DATE('09/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1004,44392,3.5,TO_DATE('05/03/2012','DD/MM/YY'),TO_DATE('07/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1004,34367,3.5,TO_DATE('05/03/2012','DD/MM/YY'),TO_DATE('07/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1004,34341,2,TO_DATE('07/03/2012','DD/MM/YY'),TO_DATE('07/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1005,34342,2,TO_DATE('07/03/2012','DD/MM/YY'),TO_DATE('05/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL VALUES(1005,44397,3.5,TO_DATE('05/03/2012','DD/MM/YY'),TO_DATE('05/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1006,34366,3.5,TO_DATE('05/03/2012','DD/MM/YY'),TO_DATE('04/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL(RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_DAILYLATEFEE) VALUES(1006,61367,2,TO_DATE('07/03/2012','DD/MM/YY'),1)
INTO DETAILRENTAL(RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_DAILYLATEFEE) VALUES(1007,34368,3.5,TO_DATE('05/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1008,34369,3.5,TO_DATE('05/03/2012','DD/MM/YY'),TO_DATE('05/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL(RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_DAILYLATEFEE) VALUES(1009,54324,3.5,TO_DATE('05/03/2012','DD/MM/YY'),3)
INTO DETAILRENTAL VALUES(1001,34366,3.5,TO_DATE('04/03/2012','DD/MM/YY'),TO_DATE('02/03/2012','DD/MM/YY'),3)
SELECT * FROM DUAL;

-- We do a select from each table to verify that the data have been entered correctly. 

-- 3. Write the SQL command to change the price code for all Action movies to price code 3.
UPDATE MOVIE
SET PRICE_CODE = 3
WHERE MOVIE_GENRE = 'ACTION';

-- 4. Write a single SQL command to increase all price rental fee values by $0.50.
UPDATE PRICE
SET PRICE_RENTFEE = PRICE_RENTFEE + 0.50;

-- 5. Write the SQL command to save the changes made to the PRICE and MOVIE tables in Problems 4-6.
COMMIT;

-- 6. Write a query to display the movie year, movie title, and movie cost sorted by movie year in descending order (result shown in Figure below).
SELECT MOVIE_YEAR, MOVIE_TITLE, MOVIE_COST
FROM MOVIE
ORDER BY MOVIE_YEAR DESC;

-- 7. Write a query to display the movie title, movie year, and movie cost for all movies that contain the word “hope” anywhere in the title. Sort the results in ascending order by title (result shown in figure below).
SELECT MOVIE_YEAR, MOVIE_TITLE, MOVIE_COST
FROM MOVIE
WHERE LOWER(MOVIE_TITLE) LIKE '%hope%'
ORDER BY MOVIE_TITLE;

-- 8. Write a query to display the movie number, movie title, movie cost, and movie genre for all movies that are either action or comedy movies and that have a cost that is less than $50. Sort the results in ascending order by genre. (Result shown in Figure below.)
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE
FROM MOVIE
WHERE (MOVIE_GENRE = 'ACTION' OR MOVIE_GENRE = 'COMEDY')
AND MOVIE_COST < 50
ORDER BY MOVIE_GENRE;

-- The question 8 was unclear, we have also the second possibility:
SELECT MOVIE_NUM, MOVIE_TITLE, MOVIE_COST, MOVIE_GENRE
FROM MOVIE
WHERE (MOVIE_GENRE = 'ACTION')
OR( MOVIE_GENRE = 'COMEDY' AND MOVIE_COST < 50) 
ORDER BY MOVIE_GENRE;

-- 9. Write a query to display the average cost of all of the movies (result shown in Figure below).
SELECT AVG(MOVIE_COST) AS "Average Movie Cost"
FROM MOVIE;

-- 10. Write a query to display the movie genre and average price rental fee for movies in each genre that have a price (result shown in Figure below).
SELECT MOVIE_GENRE, ROUND(AVG(PRICE_RENTFEE),2) AS "Average Rental Fee"
FROM MOVIE, PRICE
WHERE MOVIE.PRICE_CODE = PRICE.PRICE_CODE
GROUP BY MOVIE_GENRE;

-- 11. Write a query to display the movie title, movie year, and movie cost for all movies that have a cost between $44.99 and $49.99 (result shown in Figure below).
SELECT MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST
FROM MOVIE
WHERE MOVIE _COST BETWEEN 44.99 AND 49.99;

-- 12. Write a query to display the membership number, first name, last name, and balance of the memberships that have a rental (result shown in Figure below).
SELECT MEMBERSHIP.MEM_NUM, MEM_FNAME, MEM_LNAME, MEM_BALANCE
FROM MEMBERSHIP, RENTAL
WHERE MEMBERSHIP.MEM_NUM = RENTAL.MEM_NUM;
-- 13. Write a query to display the rental number, rental date, video number, movie title, due date, and return date for all videos that were returned after the due date. Sort the results by rental number and movie title (result shown in Figure below).
SELECT RENTAL.RENT_NUM, RENT_DATE, VIDEO.VID_NUM, MOVIE_TITLE, DETAIL_DUEDATE, DETAIL_RETURNDATE
FROM RENTAL, VIDEO, MOVIE, DETAILRENTAL
WHERE DETAILRENTAL.RENT_NUM = RENTAL.RENT_NUM
AND VIDEO.VID_NUM = DETAILRENTAL.VID_NUM
AND MOVIE.MOVIE_NUM = VIDEO.MOVIE_NUM
AND DETAIL_RETURNDATE > DETAIL_DUEDATE
ORDER BY RENTAL.RENT_NUM, MOVIE_TITLE;

-- 14. Write a query to display the membership number, last name, and total rental fees earned from that membership (result shown in Figure below). The total rental fee is the sum of all of the detail fees (without the late fees) from all movies that the membership has rented.
SELECT MEMBERSHIP.MEM_NUM, MEM_FNAME, MEM_LNAME, SUM(DETAIL_FEE) AS "Rental Fee Revenue"
FROM MEMBERSHIP, DETAILRENTAL, RENTAL
WHERE MEMBERSHIP.MEM_NUM = RENTAL.MEM_NUM
AND RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM 
GROUP BY MEMBERSHIP.MEM_NUM, MEM_FNAME, MEM_LNAME;

-- PART B: The following problems expand on the Tiny Video case from Part A. To complete the following problems, it is necessary to have first completed the table creation and data entry requirements specified in Problems 1 and 2 in part A. After each command 15 – 19 please have a display to show the results
-- 15. Alter the DETAILRENTAL table to include a derived attribute named DETAIL_DAYSLATE to store integers up to 3 digits. The attribute should accept null values.
ALTER TABLE DETAILRENTAL
ADD (DETAIL_DAYSLATE NUMBER(3,0));

-- 16. Alter the VIDEO table to include an attribute named VID_STATUS to store character data up to 4 characters long. The attribute should not accept null values. The attribute should have a constraint to enforce the domain (“IN”, “OUT”, and “LOST”), and have a default value of “IN”.
ALTER TABLE VIDEO
ADD (VID_STATUS VARCHAR(4) 
DEFAULT 'IN' NOT NULL 
CHECK(VID_STATUS IN ('IN', 'OUT', 'LOST')));

-- 17. Update the VID_STATUS attribute of the VIDEO table using a sub query to set the VID_STATUS to “OUT” for all videos that have a null value in the DETAIL_RETURNDATE attribute of the DETAILRENTAL table.
UPDATE VIDEO
SET VID_STATUS = 'OUT'
WHERE VIDEO.VID_NUM IN(
SELECT VIDEO.VID_NUM FROM VIDEO , DETAILRENTAL 
WHERE VIDEO.VID_NUM = DETAILRENTAL.VID_NUM
AND DETAILRENTAL.DETAIL_RETURNDATE IS NULL);

-- 18. Alter the PRICE table to include an attribute named PRICE_RENTDAYS to store integers up to 2 digits. The attribute should not accept null values, and should have a default value of 3.
ALTER TABLE PRICE
ADD (PRICE_RENTDAYS NUMBER(2,0) DEFAULT 3 NOT NULL);

-- 19. Update the PRICE table to place the values shown in the following table in the PRICE_RENTDAYS attribute.
UPDATE PRICE
SET PRICE_RENTDAYS = CASE PRICE_CODE
WHEN 1 THEN 5
WHEN 2 THEN 3
WHEN 3 THEN 5
WHEN 4 THEN 7
END
WHERE PRICE_CODE IN (1, 2, 3, 4);

-- 20. Create a sequence named rent_num_seq to start with 1100, increment by 1, and not cache any values. Add a couple rows with the next sequence value and display the table new values
CREATE SEQUENCE RENT_NUM_SEQ START WITH 1100 INCREMENT BY 1 NOCACHE;

INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('3/10/2012','DD/MM/YY'), 103);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('5/10/2012','DD/MM/YY'), 105);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('7/10/2012','DD/MM/YY'), 102);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('11/10/2012','DD/MM/YY'), 110);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('13/10/2012','DD/MM/YY'), 111);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('17/10/2012','DD/MM/YY'), 107);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('19/10/2012','DD/MM/YY'), 104);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('23/10/2012','DD/MM/YY'), 105);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('29/10/2012','DD/MM/YY'), 111);
INSERT INTO RENTAL VALUES(RENT_NUM_SEQ.NEXTVAL, TO_DATE('3/11/2012','DD/MM/YY'), 103);

-- 21. Create a stored procedure named prc_new_rental to insert new rows in the RENTAL table. The procedure should satisfy the following conditions.
-- a. The membership number will be provided as a parameter.
-- b. Use a Count() function to verify that the membership number exists in the MEMBERSHIP table. If it does not exist, then a message should be displayed stating that the membership does not exist and no data should be written to the database.

CREATE OR REPLACE PROCEDURE PRC_NEW_RENTAL(p_MEM_NUM IN NUMBER) AS
C1 NUMBER := 0;
BEGIN
SELECT COUNT(*) INTO C1
FROM MEMBERSHIP 
WHERE MEMBERSHIP.MEM_NUM = p_MEM_NUM;
IF(C1) = 0 THEN
DBMS_OUTPUT.PUT_LINE('Error: member does not exist!');
ELSE
INSERT INTO RENTAL 
VALUES(RENT_NUM	_SEQ.NEXTVAL, 
                 TO_DATE(SYSDATE,'MM/DD/YY'),   
                 p_MEM_NUM);            	
END IF;
END;
/

-- To execute the procedure:
BEGIN
   PRC_NEW_RENTAL(120);
END;

BEGIN
   PRC_NEW_RENTAL(105);
END;
SELECT * FROM RENTAL
ORDER BY RENT_NUM;

--22 Some transactions done by myself. 
-- In the following, I’m inserting some data about myself as a member. After each query, we do a select to make sure all the data are correctly inserted. 
INSERT INTO 
MEMBERSHIP(MEM_NUM, MEM_FNAME, MEM_LNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, MEM_BALANCE)
VALUES(100,'M''Hand','Kedjar','5-1825 Daniel Street','Longueuil','QC','00000',32);
	
INSERT INTO 
MOVIE(MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE)
VALUES(1000, 'Stargate', 1994, 24.99, 'ACTION', 1);

INSERT INTO 
VIDEO(VID_NUM, VID_INDATE, MOVIE_NUM)
VALUES(10000,TO_DATE('09/08/2003','DD/MM/YY'),1000);

INSERT INTO 
RENTAL(RENT_NUM, RENT_DATE, MEM_NUM)
VALUES(1112,TO_DATE('14/11/2012','DD/MM/YY'),100); 

INSERT INTO DETAILRENTAL(RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DAILYLATEFEE)
VALUES(1112,10000,2,TO_DATE('21/11/2012','DD/MM/YY'),NULL,1);

	

