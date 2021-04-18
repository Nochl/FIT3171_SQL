--student id: 30600022
--student name: Enoch Leow

DROP TABLE TEAM;
DROP TABLE EMPLOYEE;


CREATE TABLE EMPLOYEE (
    emp_no NUMBER(5) NOT NULL,
    emp_fname VARCHAR2(30),
    emp_lname VARCHAR(30),
    emp_street VARCHAR2(50) NOT NULL,
    emp_town VARCHAR(30) NOT NULL,
    emp_pcode CHAR(4) NOT NULL,
    emp_dob DATE NOT NULL,
    emp_taxno VARCHAR(20),
    team_no NUMBER(3),
    mentor_no NUMBER(5),
    CONSTRAINT pk_employee PRIMARY KEY (emp_no)
);

CREATE TABLE TEAM (
    team_no NUMBER(3) NOT NULL,
    emp_no NUMBER(5),
    CONSTRAINT pk_team PRIMARY KEY (team_no) 
);

ALTER TABLE EMPLOYEE 
    ADD
        ( CONSTRAINT fk_employee_mentor FOREIGN KEY (mentor_no) REFERENCES EMPLOYEE (emp_no),
         CONSTRAINT fk_employee_team FOREIGN KEY (team_no) REFERENCES TEAM (team_no));
          
          
ALTER TABLE TEAM 
    ADD
        ( CONSTRAINT fk_team_emp FOREIGN KEY (emp_no) REFERENCES EMPLOYEE (emp_no));
        
