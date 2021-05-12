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

DROP SEQUENCE env_seq;

CREATE SEQUENCE env_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE environment (
  env_id			 NUMBER(6)     NOT NULL,
  env_name           VARCHAR2(40)  NOT NULL
);

COMMENT ON COLUMN environment.env_id IS
    'Identifier for the environment';
    
COMMENT ON COLUMN environment.env_name IS
    'Name of the environment';    

INSERT INTO environment (env_id, env_name) values (env_seq.nextval, 'Zoo');
INSERT INTO environment (env_id, env_name) values (env_seq.nextval, 'Wildlife Park');
INSERT INTO environment (env_id, env_name) values (env_seq.nextval, 'Sanctuary');
INSERT INTO environment (env_id, env_name) values (env_seq.nextval, 'Nature Reserve');
INSERT INTO environment (env_id, env_name) values (env_seq.nextval, 'Other');

ALTER TABLE centre
    ADD env_id NUMBER(6) DEFAULT 5 NOT NULL;

COMMENT ON COLUMN centre.env_id IS
    'Identifier for the environment';
    
UPDATE centre 
SET env_id = (CASE 
                      WHEN centre.centre_name LIKE '%Zoo%'
                        THEN 1
                      WHEN centre.centre_name LIKE '%Park%'
                        THEN 2
                      WHEN centre.centre_name LIKE '%Sanctuary%'
                        THEN 3
                      WHEN centre.centre_name LIKE '%Reserve%'
                        THEN 4                       
                    END);    