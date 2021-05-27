--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-triggers.sql

--Student ID: 30600022
--Student Name: Enoch Leow
--Tutorial No: 06_LiveStream

/* Comments for your marker:
Q2 has 2 test harnesses, one for cost_per_hour, and another for seats  
Q3 has 2 test harnesses, one for checking if flight hours were added, and another to check if entered data can be further updated

*/

/* 
    Q1 
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER check_location BEFORE
    INSERT ON charter_leg
    FOR EACH ROW
BEGIN
    IF :new.location_nbr_destination = :new.location_nbr_origin THEN
        raise_application_error(-20000, 'Location of Origin should not be same as Location of Destination');
    END IF;
END;
/

-- Test Harness
-- display before value
SELECT * FROM charter_leg;

INSERT INTO charter_leg values (3, 1, to_date('01/01/2001', 'DD/MM/YYYY'), 
                                   to_date('01/01/2001', 'DD/MM/YYYY'), 
                                   to_date('01/01/2001', 'DD/MM/YYYY'), 
                                   to_date('01/01/2001', 'DD/MM/YYYY'),
                                   100, 100);
                                   
-- display after value                                    
SELECT * FROM charter_leg;

-- closes transaction
rollback;

/* 
    Q2
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER check_charter BEFORE
    INSERT OR UPDATE ON charter
    FOR EACH ROW
DECLARE
    price  helicopter_type.ht_cost_per_hour%type;
    seats  helicopter_type.ht_nbr_seats%type;
BEGIN
    SELECT DISTINCT t.ht_cost_per_hour into price
         FROM helicopter h JOIN helicopter_type t ON h.ht_nbr = t.ht_nbr
         WHERE h.heli_callsign = :new.heli_callsign;
    
    SELECT DISTINCT t.ht_nbr_seats into seats
         FROM helicopter h JOIN helicopter_type t ON h.ht_nbr = t.ht_nbr
         WHERE h.heli_callsign = :new.heli_callsign;
         
    IF :new.charter_cost_per_hour < price THEN
                raise_application_error(-20000, 'Charter’s cost per hour must be equal or higher than the helicopter’s cost per hour');
    END IF;
    
    IF :new.charter_nbr_passengers > seats THEN
                raise_application_error(-20000, 'Charter’s maximum number of passengers must not be above the helicopter’s number of seats');
    END IF;
END;
/

-- Test Harness 1 (FOR COST PER HOUR)
-- display before value
SELECT * FROM charter;

INSERT INTO charter (charter_nbr, charter_cost_per_hour, charter_nbr_passengers, charter_special_reqs, ctype_nbr, heli_callsign, client_nbr, emp_nbr)
             VALUES (2,           10,                    1,                     '',                   10,        'BI-BAC',      1203,       1023);
                                   
-- display after value                                    
SELECT * FROM charter;

-- closes transaction
rollback;

-- Test Harness 2 (FOR SEATS)
-- display before value
SELECT * FROM charter;

INSERT INTO charter (charter_nbr, charter_cost_per_hour, charter_nbr_passengers, charter_special_reqs, ctype_nbr, heli_callsign, client_nbr, emp_nbr)
             VALUES (2,           1000,                  50,                     '',                   10,        'BI-BAC',      1203,       1023);
                                   
-- display after value                                    
SELECT * FROM charter;

-- closes transaction
rollback;



/* 
    Q3
*/
/*Please copy your trigger code and any other necessary SQL statements after this line*/
CREATE OR REPLACE TRIGGER update_hours_flown 
    BEFORE UPDATE OF cl_atd ON charter_leg
    REFERENCING OLD AS old
    NEW AS new
    FOR EACH ROW
DECLARE 
    has_data charter_leg.cl_ata%type; 
    time_flown charter_leg.cl_ata%type; 
    time_flown2 charter_leg.cl_atd%type; 
    identify helicopter.heli_callsign%type;
    charterid charter_leg.charter_nbr%type;   

BEGIN
    has_data := :old.cl_ata;
    time_flown := :new.cl_ata;
    time_flown2 := :new.cl_atd;
    charterid := :old.charter_nbr;
    
    IF has_data IS NOT NULL THEN
                raise_application_error(-20000, 'Actual time of departure and arrival cannot be further updated after being entered');

    ELSE
        SELECT heli_callsign into identify
        FROM charter
        WHERE charter_nbr = charterid;
        
        UPDATE HELICOPTER
        SET heli_hrs_flown = heli_hrs_flown + (24*(time_flown-time_flown2))
        WHERE heli_callsign = identify;
    END IF;
END;
/

-- Test Harness 1 (ADDING HOURS FLOWN)
-- display before value
SELECT * FROM helicopter;

UPDATE charter_leg
    SET
        cl_atd = TO_DATE('01/06/2020 16:03', 'dd/mm/yyyy hh24:mi'),
        cl_ata = TO_DATE('01/06/2020 17:08', 'dd/mm/yyyy hh24:mi')
    WHERE
        cl_leg_nbr = 2
        AND charter_nbr = 1;

-- display after value                                    
SELECT * FROM helicopter;

-- closes transaction
rollback;

-- Test Harness 2 (FOR CHECKING IF ACTUAL TIME CAN BE FURTHER UPDATED)
-- display before value
SELECT * FROM helicopter;
SELECT * FROM charter_leg;

UPDATE charter_leg
    SET
        cl_atd = TO_DATE('01/06/2020 16:03', 'dd/mm/yyyy hh24:mi'),
        cl_ata = TO_DATE('01/06/2020 17:08', 'dd/mm/yyyy hh24:mi')
    WHERE
        cl_leg_nbr = 2
        AND charter_nbr = 1;

-- display after value (entering time)                                    
SELECT * FROM helicopter;
SELECT * FROM charter_leg;

UPDATE charter_leg
    SET
        cl_atd = TO_DATE('02/06/2020 16:03', 'dd/mm/yyyy hh24:mi'),
        cl_ata = TO_DATE('02/06/2020 17:08', 'dd/mm/yyyy hh24:mi')
    WHERE
        cl_leg_nbr = 2
        AND charter_nbr = 1;

-- display after value (updating time)                                    
SELECT * FROM helicopter;
SELECT * FROM charter_leg;

-- closes transaction
rollback;







