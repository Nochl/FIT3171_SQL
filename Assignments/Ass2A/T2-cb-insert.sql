--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: 30600022
--Student Name: Enoch Leow
--Tutorial No: 06_LiveStream

/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the
supplied T2-cb-insert.sql file script file, and SQL commands which will
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e.
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- INSERTING into ANIMAL (wild)
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000001, 'M', NULL, 'AUS10', 'Myrmecobius', 'fasciatus');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000002, 'F', NULL, 'AUS10', 'Myrmecobius', 'fasciatus');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000003, 'M', NULL, 'AUS30', 'Sarcophilus', 'harrisii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000004, 'F', NULL, 'AUS30', 'Sarcophilus', 'harrisii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000005, 'F', NULL, 'SAF20', 'Diceros', 'bicornis');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000006, 'F', NULL, 'AUS40', 'Lasiorhinus', 'krefftii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000007, 'M', NULL, 'AUS40', 'Lasiorhinus', 'krefftii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000008, 'M', NULL, 'SAF20', 'Diceros', 'bicornis');

-- INSERTING into BREEDING_EVENT
Insert into BREEDING_EVENT (BREVENT_ID, BREVENT_DATE, MOTHER_ID, FATHER_ID) values (000001,TO_DATE('01-01-2020','DD-MM-YYYY'),000002,000001);
Insert into BREEDING_EVENT (BREVENT_ID, BREVENT_DATE, MOTHER_ID, FATHER_ID) values (000002,TO_DATE('15-04-2020','DD-MM-YYYY'),000006,000007);
Insert into BREEDING_EVENT (BREVENT_ID, BREVENT_DATE, MOTHER_ID, FATHER_ID) values (000003,TO_DATE('21-09-2020','DD-MM-YYYY'),000004,000003);
Insert into BREEDING_EVENT (BREVENT_ID, BREVENT_DATE, MOTHER_ID, FATHER_ID) values (000004,TO_DATE('21-11-2020','DD-MM-YYYY'),000005,000008);

-- INSERTING into ANIMAL (bred)
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000009, 'M', 000001, 'AUS10', 'Myrmecobius', 'fasciatus');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000010, 'M', 000002, 'AUS40', 'Lasiorhinus', 'krefftii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000011, 'F', 000003, 'AUS30', 'Sarcophilus', 'harrisii');
Insert into ANIMAL (ANIMAL_ID, ANIMAL_SEX, BREVENT_ID, CENTRE_ID, SPEC_GENUS, SPEC_NAME) values (000012, 'M', 000004, 'SAF20', 'Diceros', 'bicornis');

commit;
