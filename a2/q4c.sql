SELECT T.course_id, T.sec_id, COUNT(T.ID) as Enrollment 
FROM takes T 
GROUP BY course_id, sec_id, semester, year 
HAVING semester = "Fall" and year = 2009 and Enrollment IN (
    SELECT MAX(TEMP2.Enrollment)
    FROM (
        SELECT T1.course_id, T1.sec_id, T1.semester, T1.year, COUNT(T1.ID) as Enrollment 
        FROM takes T1
        GROUP BY course_id, sec_id, semester, year 
        HAVING semester = "Fall" and year = 2009
    ) as TEMP2
)