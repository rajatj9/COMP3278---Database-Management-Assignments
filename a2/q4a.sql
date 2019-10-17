SELECT S.course_id, S.sec_id, COUNT(T.ID)
FROM section S LEFT OUTER JOIN takes T
ON  T.sec_id = S.sec_id AND T.course_id = S.course_id  AND S.year = T.year AND T.semester = S.semester
WHERE S.year = 2009 and S.semester = "FALL"
GROUP BY course_id, sec_id
