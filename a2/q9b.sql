SELECT * 
FROM failures F
WHERE F.ID in (
    SELECT TEMP.ID
    FROM failures TEMP
    GROUP BY TEMP.ID
    HAVING COUNT(*) >= 2
)