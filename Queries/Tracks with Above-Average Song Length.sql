SELECT tr.name, tr.milliseconds 
FROM track Tr
WHERE tr.milliseconds > (
    SELECT AVG(TI.milliseconds) 
    FROM track TI
)
ORDER BY tr.milliseconds DESC;