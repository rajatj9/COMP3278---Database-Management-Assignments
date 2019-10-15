SELECT T.ID ,I.name, COUNT(T.ID) as course_count
FROM instructor I, teaches T
WHERE I.ID = T.ID
GROUP BY T.ID
HAVING course_count in (
    SELECT MAX(TEMP.course_count_tmp) FROM (
        SELECT T1.ID, COUNT(*) as course_count_tmp
        FROM teaches T1
        GROUP BY ID
    ) as TEMP
) 