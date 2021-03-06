--add set echo and spool command here
SET ECHO ON


/*
Databases Week 10 Tutorial
week10_sql_intermediate.sql

student id: 30600022
student name: Enoch Leow
last modified date: 13/05/2021

*/

/* 1. Find the average mark of FIT2094 in semester 2, 2019. 
Show the average mark with two decimal places. 
Name the output column as ?Average Mark?. */

SELECT avg(e.mark) AS average_mark
FROM uni.enrolment e
WHERE e.unitcode = 'FIT2094';


/* 2. List the average mark for each offering of FIT9136. 
In the listing, include the year and semester number. 
Sort the result according to the year then the semester.*/

SELECT e.ofyear, e.semester, avg(e.mark)
FROM uni.enrolment e
WHERE e.unitcode = 'FIT2094'
GROUP BY e.ofyear, e.semester
ORDER BY e.ofyear, e.semester;


/* 3. Find the number of students enrolled in FIT1045 in the year 2019, 
under the following conditions (note two separate selects are required):
      a. Repeat students are counted each time
      b. Repeat students are only counted once
*/

-- a. Repeat students are counted each time
SELECT count(*)
FROM uni.enrolment e
WHERE e.unitcode = 'FIT1045' AND TO_CHAR(e.ofyear, 'YYYY') = '2019';

  
-- b. Repeat students are only counted once
SELECT count(e.studid)
FROM uni.enrolment e
WHERE e.unitcode = 'FIT1045' AND TO_CHAR(e.ofyear, 'YYYY') = '2019';


/* 4. Find the total number of prerequisite units for FIT5145. */
SELECT count(p.unitcode)
FROM uni.prereq p
WHERE p.unitcode = 'FIT5145';

  
/* 5. Find the total number of prerequisite units for each unit. 
In the list, include the unitcode for which the count is applicable. 
Order the list by unit code.*/
SELECT p.unitcode, count(p.unitcode)
FROM uni.prereq p
GROUP BY p.unitcode
ORDER BY p.unitcode;


/*6. Find the total number of students 
whose marks are being withheld (grade is recorded as 'WH') 
for each unit offered in semester 1 2020. 
In the listing include the unit code for which the count is applicable. 
Sort the list by descending order of the total number of students 
whose marks are being withheld.*/

SELECT e.unitcode, count(e.studid) AS TOT_WIITHHELD
FROM uni.enrolment e
WHERE e.semester = 1 AND TO_CHAR(e.OFYEAR, 'YYYY') = '2020'
GROUP BY e.unitcode
ORDER BY TOT_WIITHHELD DESC;


/* 7. For each prerequisite unit, calculate how many times 
it has been used as a prerequisite (number of times used). 
In the listing include the prerequisite unit code, 
the prerequisite unit name and the number of times used. 
Sort the output by unit name. */



/*8. Display unit code and unit name of units 
which had at least 1 student who was granted deferred exam 
(grade is recorded as 'DEF') in semester 1 2020. 
Order the list by unit code.*/



/* 9. Find the unit/s with the highest number of enrolments 
for each offering in the year 2019. 
Sort the list by semester then by unit code. */




/* 10. Find all students enrolled in FIT3157 in semester 1, 2020 
who have scored more than the average mark for FIT3157 in the same offering? 
Display the students' name and the mark. 
Sort the list in the order of the mark from the highest to the lowest 
then in increasing order of student name.*/



SET ECHO OFF
