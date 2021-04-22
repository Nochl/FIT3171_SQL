SET ECHO ON

SPOOL week7_schema_alter_output.txt

DROP TABLE ENROLMENT;
DROP TABLE STUDENT;
DROP TABLE UNIT;

/*
Databases Week 7 Tutorial Sample Solution
week7_schema_alter.sql

Author:
--student id: 30600022
--student name: Enoch Leow
*/

-- 7.1
-- DDL for Student-Unit-Enrolment model (using ALTER TABLE)
--

--
-- Place DROP commands at head of schema file
--



-- Create Tables
-- Here using both table and column constraints
--

CREATE TABLE student (
    stu_nbr     NUMBER(8) NOT NULL,
    stu_lname   VARCHAR2(50) NOT NULL,
    stu_fname   VARCHAR2(50) NOT NULL,
    stu_dob     DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

/* Add STUDENT constraints here */

ALTER TABLE STUDENT 
    ADD
    ( CONSTRAINT pk_student PRIMARY KEY (stu_nbr) );

/* Add UNIT data types here */
CREATE TABLE unit (
    unit_code   CHAR(7) NOT NULL,
    unit_name   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

/* Add UNIT constraints here */

ALTER TABLE UNIT 
    ADD
    ( CONSTRAINT pk_unit PRIMARY KEY (unit_code) );

/* Add EMROLMENT attributes and data types here */
CREATE TABLE enrolment (
    enrol_year NUMBER(4) NOT NULL,
    enrol_semester CHAR(1) NOT NULL,
    enrol_mark NUMBER(3),
    enrol_grade CHAR(2),
    stu_nbr NUMBER (8) NOT NULL,
    unit_code CHAR(7) NOT NULL
);

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

/* Add ENROLMENT constraints here */

ALTER TABLE ENROLMENT 
    ADD
        (CONSTRAINT pk_enrolment PRIMARY KEY (stu_nbr, unit_code, enrol_year, enrol_semester), 
         CONSTRAINT fk_student_number FOREIGN KEY (stu_nbr) REFERENCES STUDENT (stu_nbr),
         CONSTRAINT fk_unit_code FOREIGN KEY (unit_code) REFERENCES UNIT (unit_code),
         CONSTRAINT grade_chk CHECK (enrol_grade in ('N', 'P', 'C', 'D', 'HD'))
         );


SPOOL OFF

SET ECHO OFF