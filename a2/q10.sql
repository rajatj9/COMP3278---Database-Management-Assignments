SELECT I.name, I.salary
FROM instructor I
WHERE I.ID IN
(SELECT T.ID 
FROM teaches T, section S, time_slot TIME
WHERE T.course_id = S.course_id AND 
T.sec_id = S.sec_id AND T.semester = S.semester
AND T.year = S.year AND S.time_slot_id = TIME.time_slot_id
AND TIME.start_hr >= 18) 
