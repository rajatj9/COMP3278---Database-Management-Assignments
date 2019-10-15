SELECT I.ID, I.name
FROM instructor I
WHERE I.salary in (SELECT MAX(I2.salary) from instructor I2)