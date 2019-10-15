SELECT T.ID, SUM(C.credits*G.point)/TEMP.total_credits as cGPA
FROM takes T, course C, grade_point G, (
    SELECT T.ID, SUM(C.credits) as total_credits
    FROM takes T, course C
    where T.course_id = C.course_id
    GROUP BY T.ID
) as TEMP
WHERE T.course_id = C.course_id and T.grade = G.grade and TEMP.ID = T.ID
GROUP BY T.ID
ORDER BY cGPA DESC