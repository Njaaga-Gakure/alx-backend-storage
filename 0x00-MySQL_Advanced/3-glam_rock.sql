-- List bands in a table

-- Select band_names form a table
-- columns to list is the band name and the lifespan
-- where the lifespan is gotten from the difference
-- between split and formed.
-- If split is NULL, the default value is 2022
SELECT band_name, COALESCE(split, 2022) - formed AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC
