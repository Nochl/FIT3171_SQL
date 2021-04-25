SELECT
    s.studid, s.studfname AS NAME, e.unitcode, e.ofyear, e.semester
FROM 
    (uni.student s JOIN uni.enrolment e ON s.studid = e.studid)
WHERE
    e.mark IS NULL
ORDER BY
    unitcode DESC, studid DESC;
