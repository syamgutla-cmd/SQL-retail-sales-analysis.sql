# SQL-retail-sales-analysis.sql
---create database
CREATE DATABASE sql_project_p1;

--create table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales1(
				transaction_id INT,
				sale_date DATE,
				sale_time TIME,
				customer_id INT,
				male VARCHAR(15),
				age INT,
				category VARCHAR(11),
				quantiy INT,
				price_per_unit FLOAT,
				cogs FLOAT,
				total_sale FLOAT

);
SELECT * FROM retail_sales
LIMIT 10

SELECT COUNT(*) FROM retail_sales


ALTER TABLE retail_sales1
RENAME TO retail_sales;

ALTER TABLE retail_sales
RENAME COLUMN male TO is_male;

ALTER TABLE retail_sales
ALTER COLUMN is_male TYPE BOOLEAN
USING(
      CASE 
	     WHEN LOWER(is_male) = 'male' THEN true
		 ELSE false
      END
);

-----
SELECT * FROM retail_sales
WHERE transaction_id IS NULL;


------
SELECT * FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR is_male IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
