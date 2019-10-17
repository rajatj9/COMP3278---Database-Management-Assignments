CREATE VIEW failures
AS (
	SELECT T.ID, T.course_id, T.sec_id, T.semester, T.year, T.grade
    FROM takes T
    WHERE T.grade = 'F'
    AND (T.ID, T.course_id, T.sec_id) NOT IN
    (
        SELECT TEMP.ID, TEMP.course_id, TEMP.sec_id
        FROM takes TEMP
        WHERE (TEMP.grade != 'F') 
        AND ((TEMP.year > T.year) OR
            (
                (TEMP.year = T.year) AND (
                    ((TEMP.semester = 'Summer') AND (T.semester = 'Spring'))
                    OR ((TEMP.semester = 'Fall') AND (T.semester = 'Summer'))
                    OR ((TEMP.semester = 'Fall') AND (T.semester = 'Spring'))
                )
            )
        )
        AND TEMP.ID = T.ID
        AND TEMP.course_id = T.course_id
        AND TEMP.sec_id = T.sec_id
    )
)