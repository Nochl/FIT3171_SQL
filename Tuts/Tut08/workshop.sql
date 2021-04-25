SELECT
    studid, studfname || ' ' || studlname AS name, unitcode, to_char(ofyear, 'YYYY') AS year, semester

FROM
    uni.student natural join uni.enrolment

WHERE
    mark IS NULL

ORDER BY
    unitcode, studid;