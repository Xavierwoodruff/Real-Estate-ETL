CREATE VIEW cleaned_real_estate_data AS
-- USECASE of CTE to bring both tables together as one dataset table
-- easier usage and querying of the data
WITH cte_real_estate AS(

SELECT 
	serial_number, 
	list_year, 
	date_recorded, 
	town, 
	address, 
	assessed_value, 
	sale_amount, 
	sales_ratio,
	property_type,
	residential_type,
	-- USECASE for the CASE statement fills in missing residential type values that were 
	-- missing from 2001-2006 values where agregated based off the rest of the non null values
CASE 
		WHEN property_type IS NULL AND assessed_value::NUMERIC > 706000 AND sale_amount::NUMERIC > 750000 THEN 'Apartments'
		WHEN property_type IS NULL AND assessed_value::NUMERIC BETWEEN 476001 AND 706000 AND sale_amount::NUMERIC BETWEEN 550000 AND 750000 THEN 'Commercial'
		WHEN property_type IS NULL AND assessed_value::NUMERIC BETWEEN 246001 AND 476000 AND sale_amount::NUMERIC BETWEEN 350000 AND 550000 THEN 'Single Family'
		WHEN property_type IS NULL AND assessed_value::NUMERIC BETWEEN 169001 AND 246000 AND sale_amount::NUMERIC BETWEEN 250000 AND 350000 THEN 'Two Family'
		WHEN property_type IS NULL AND assessed_value::NUMERIC BETWEEN 146001 AND 169000 AND sale_amount::NUMERIC BETWEEN 150000 AND 250000 THEN 'Condo'
		WHEN property_type IS NULL AND assessed_value::NUMERIC BETWEEN 113000 AND 146000 AND sale_amount::NUMERIC BETWEEN 100000 AND 150000 THEN 'Three Family'
		WHEN property_type IS NULL AND sale_amount::NUMERIC < 100000 THEN 'Four Family'
		ELSE property_type
	END AS property_type_edit

FROM(
	-- USECASE for the UNION ALL used to combine the two real estate tables 
	-- together as they have the same columns allowing for a union all
	SELECT*
	FROM real_estate_A
	UNION ALL
	SELECT*
	FROM real_estate_B
	) AS real_estate_table

	-- USECASE
	-- 1. Sales ratio has extreme outliers in its data so i used 4 which relates to buying a house for 1/4 assessed value
	-- 2. Assessed value AND sale_amount where both put to 5000 to rid any values of outlying data 
	-- 3. sale_amount and assessed_value are set to 5 Million or lower to rid outlying data
WHERE sales_ratio BETWEEN 0.25 AND 4 AND assessed_value::NUMERIC > 5000 
	AND sale_amount::NUMERIC > 5000 AND sale_amount::NUMERIC < 3000000 
	AND assessed_value::NUMERIC < 3000000
	
GROUP BY property_type, residential_type, assessed_value, list_year, town, 
		assessed_value, sale_amount, sales_ratio, date_recorded, address, serial_number
)

SELECT 
	serial_number, list_year, 
	date_recorded, town, 
	address, assessed_value, 
	sale_amount, ROUND(sales_ratio, 2), 
	property_type_edit

FROM cte_real_estate
WHERE property_type_edit NOT IN('Commercial', 'Industrial', 'Public Utility', 'Vacant Land') 
ORDER BY list_year ASC;