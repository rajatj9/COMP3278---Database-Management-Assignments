SELECT DISTINCT S.name
FROM takes T, student S
where S.ID = T.ID and T.course_id LIKE "CS-%" 