SELECT T.ID 
FROM takes T, course C, teaches Te
WHERE T.course_id = C.course_id and C.course_id  = Te.course_id and Te.ID IN (
    SELECT I.ID FROM instructor I WHERE I.name = "Einstein"
)
