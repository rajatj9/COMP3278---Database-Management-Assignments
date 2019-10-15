SELECT T.ID, SUM(C.credits) as total_credits
FROM takes T, course C
where T.course_id = C.course_id
GROUP BY T.ID