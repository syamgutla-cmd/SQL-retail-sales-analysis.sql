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

--data cleaning
DELETE FROM retail_sales
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


   ---data exploration

   ---how many sales are done(what happend here is count(*) counts total number of rows in the table giving it alias names same as beside it)
   SELECT COUNT(*) total_sales FROM retail_sales

   --how many customers(count(customer_id) giving the count a argument i give number of rows ignoring the null value ones)
   SELECT COUNT(customer_id) FROM retail_sales 


   --distinct key usage gives the names of distinct names present in that coloumn
   SELECT DISTINCT category FROM retail_sales


   --data analysis & bussiness key problems and answers

   -- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

--Q.1
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

--Q.2
SELECT * FROM retail_sales
WHERE category = 'Clothing'
AND quantiy > 10
AND sale_date::TEXT LIKE '2022-11-__'; --here like operator can only compare string so i converted the date to a string or we can use between operator

--Q.3
SELECT category, SUM(total_sale) as total_sale --using a alias again
FROM retail_sales
GROUP BY category; --group by and distinct works fundamentally different it cant reutrn sums or anything like that but group by can
  
   


