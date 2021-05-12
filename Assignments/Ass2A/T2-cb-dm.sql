--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 30600022
--Student Name: Enoch Leow
--Tutorial No: 06_LiveStream

/* Comments for your marker:




*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)
DROP SEQUENCE animal_seq;
DROP SEQUENCE breed_seq;

CREATE SEQUENCE animal_seq
    START WITH 500
    INCREMENT BY 1;

CREATE SEQUENCE breed_seq
    START WITH 500
    INCREMENT BY 1;


-- (ii)
UPDATE animal
SET CENTRE_ID = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME='Kruger National Park')
WHERE CENTRE_ID = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME='SanWild Wildlife Sanctuary');

DELETE FROM centre
WHERE CENTRE_NAME = 'SanWild Wildlife Sanctuary';


-- (iii)
INSERT into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values 
(animal_seq.nextval, 'F', NULL, (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME='Australia Zoo'), 
(SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
(SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));

Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values 
(animal_seq.nextval, 'M', NULL, (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME='Werribee Open Range Zoo'), 
(SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
(SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));


-- (iv)
Insert into BREEDING_EVENT (BREVENT_ID, BREVENT_DATE, MOTHER_ID, FATHER_ID) values 
(breed_seq.nextval,
  TO_DATE('10-02-2021','DD-MM-YYYY'), 
  (SELECT ANIMAL_ID FROM animal WHERE SPEC_GENUS = (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND 
                                      SPEC_NAME  = (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND
                                      CENTRE_ID  = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Australia Zoo')),  

  (SELECT ANIMAL_ID FROM animal WHERE SPEC_GENUS = (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND 
                                      SPEC_NAME  = (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND
                                    CENTRE_ID  = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Werribee Open Range Zoo')));
                                        



Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values 
(animal_seq.nextval, 
  'F', 
  (SELECT BREVENT_ID FROM breeding_event WHERE BREVENT_DATE = TO_DATE('10-02-2021','DD-MM-YYYY') AND 
                                               MOTHER_ID  = (SELECT ANIMAL_ID FROM animal WHERE SPEC_GENUS = (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND 
                                                                                                SPEC_NAME  = (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND
                                                                                                CENTRE_ID  = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Australia Zoo'))),

  (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Australia Zoo'), 
  (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil'), 
  (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil'));




Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values 
(animal_seq.nextval, 
  'M', 
  (SELECT BREVENT_ID FROM breeding_event WHERE BREVENT_DATE = TO_DATE('10-02-2021','DD-MM-YYYY') AND 
                                               FATHER_ID  = (SELECT ANIMAL_ID FROM animal WHERE SPEC_GENUS = (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND 
                                                                                                SPEC_NAME  = (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil') AND
                                                                                                CENTRE_ID  = (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Werribee Open Range Zoo'))),

  (SELECT CENTRE_ID FROM centre WHERE CENTRE_NAME = 'Australia Zoo'), 
  (SELECT SPEC_GENUS FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil'), 
  (SELECT SPEC_NAME FROM species WHERE SPEC_POPULAR_NAME = 'Tasmanian Devil'));
    
commit;    