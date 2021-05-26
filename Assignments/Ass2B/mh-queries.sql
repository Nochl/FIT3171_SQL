--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 30600022
--Student Name: Enoch Leow
--Tutorial No: 06_LiveStream

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT e.ht_nbr, e.emp_nbr, m.emp_lname, m.emp_fname, to_char(e.end_last_annual_review, 'Day DD MON YYYY' ) AS REVIEW_DATE
FROM mh.endorsement e JOIN mh.employee m ON e.emp_nbr = m.emp_nbr
WHERE e.end_last_annual_review > to_date('31/03/2020', 'DD/MM/YYYY')
ORDER BY review_date ASC;


/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT c.charter_nbr, c.client_nbr, l.client_lname, l.client_fname, c.charter_special_reqs
FROM mh.charter c JOIN mh.client l ON c.client_nbr = l.client_nbr
WHERE c.charter_special_reqs IS NOT NULL
ORDER BY c.charter_nbr ASC;

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT c.charter_nbr, (e.client_lname || ' ' || e.client_fname) as FULLNAME, c.charter_cost_per_hour
FROM mh.charter c JOIN mh.client e ON c.client_nbr = e.client_nbr
WHERE (c.charter_cost_per_hour < 1000 OR c.charter_special_reqs IS NULL) AND c.charter_nbr IN
    (SELECT a.charter_nbr
    FROM mh.charter_leg a JOIN mh.location o ON a.location_nbr_destination = o.location_nbr
    WHERE o.location_name = 'Mount Doom')
ORDER BY FULLNAME DESC;


/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT t.ht_nbr, t.ht_name, count(h.heli_callsign)
FROM mh.helicopter_type t JOIN mh.helicopter h ON t.ht_nbr = h.ht_nbr
GROUP BY t.ht_nbr, t.ht_name
HAVING count(h.heli_callsign) > 1;


/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT t.location_nbr, t.location_name, count(h.cl_leg_nbr) AS TIMES_USED
FROM mh.location t JOIN mh.charter_leg h ON t.location_nbr = h.location_nbr_origin
GROUP BY t.location_nbr, t.location_name
HAVING count(h.cl_leg_nbr) > 1
ORDER BY TIMES_USED ASC;


/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

