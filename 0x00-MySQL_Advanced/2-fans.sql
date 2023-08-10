-- ranking data in a table

-- select origin field and sum number of fans
-- based on the origin 
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC
