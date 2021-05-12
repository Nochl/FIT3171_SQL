--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: 30600022
--Student Name: Enoch Leow
--Tutorial No: 06_LiveStream

/* Comments for your marker:




*/

/*
Task 3:

Make the listed changes to the "live" database
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)
ALTER TABLE centre
    ADD centre_count NUMBER(6,0) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN centre.centre_count IS
    'The total number of offspring which are born at each centre';

-- (b)

ALTER TABLE animal
    ADD animal_alive CHAR(1) DEFAULT 'Y' NOT NULL;
    
ALTER TABLE animal
    ADD CHECK ( animal_alive IN ( 'Y', 'N' ) );    

COMMENT ON COLUMN animal.animal_alive IS
    'Is the animal alive or not';

-- changing alive status of existing bred animal to dead

UPDATE animal
SET ANIMAL_ALIVE = 'N'
WHERE ANIMAL_ID = 503;

/*
---Implimentation---
I implimented death as a new attribute called 'animal_alive' 
- Has default value of 'Y" 
- Has a check wherre the value must be either 'Y' or 'N' (representing yes/no)

---Justification---
I chose to add a new attribute for this function because:
- avoids any delete anomalies (if we were to delete dead animals)
- allows us to keep data of dead animals (compared to if we deleted them)
*/


-- (c)


