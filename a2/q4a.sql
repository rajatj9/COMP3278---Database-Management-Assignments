SELECT T.course_id, T.sec_id, T.semester, T.year, COUNT(T.ID) as Enrollment 
FROM takes T 
GROUP BY course_id, sec_id, semester, year 
HAVING semester = "Fall" and year = 2009