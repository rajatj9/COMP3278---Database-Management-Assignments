SELECT I.name, I.dept_name 
FROM instructor I
WHERE I.dept_name IN
(
    SELECT D.dept_name from department D
    WHERE D.budget IN (
        SELECT MAX(D1.budget) FROM department D1
    ) 
)
ORDER BY dept_name