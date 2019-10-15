SELECT I.ID, I.name
FROM instructor I
WHERE I.ID NOT IN (
                    SELECT T.ID
                    FROM teaches T )