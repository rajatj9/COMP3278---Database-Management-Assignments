SELECT S.course_id, S.sec_id, S.building, S.room_number, C.capacity, TEMP.Enrollment
FROM section S, classroom C,(SELECT T.course_id, T.sec_id, T.semester, T.year, COUNT(T.ID) as Enrollment 
                            FROM takes T 
                            GROUP BY course_id, sec_id, semester, year 
                            HAVING semester = "Fall" and year = 2009) as TEMP
WHERE S.course_id = TEMP.course_id and S.sec_id = TEMP.sec_id and S.year = TEMP.year and 
S.semester = TEMP.semester and S.building = C.building and S.room_number = C.room_number
and TEMP.Enrollment > 0
