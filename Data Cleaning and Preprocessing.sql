create database if not exists SQLPortfolioProject;
use SQLPortfolioProject;

rename table `bigbasket date table csv` to BigBasket_date_table;
rename table `bigbasket customer details csv` to BigBasket_customer_details;
rename table `bigbasket product details csv` to BigBasket_product_details;
rename table `bigbasket orders table csv` to BigBasket_orders_table;

INSERT INTO BigBasket_product_details 
(`index`, product_id, `Product Name`, category, sub_category, brand, sale_price, market_price, `type`, rating)
VALUES 
(27567, 
 'PID-1029567', 
 'boAt Lunar Vista Smart Watch With 1.52" HD Display, Advanced BT Calling, Heart Rate & SpO2 Monitoring - Metal Silver, 1 pc', 
 'Electronics & Devices', 
 'Smart Wearables', 
 'boAt', 
 1499, 
 8499, 
 'Smartwatches', 
 4.7);

select *
from bigbasket_product_details
where product_id='PID-1029567';

CREATE TABLE dates (
    order_date        VARCHAR(30),
    date              VARCHAR(30),
    year              INT,
    month             INT,
    `year_month`      VARCHAR(10),
    order_quarter     INT,
    day               INT,
    day_name          VARCHAR(10),
    hour              INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/BIGBASKET DATE TABLE csv.csv'
INTO TABLE dates
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_date, date, year, month, `year_month`, order_quarter, day, day_name, hour);

SHOW VARIABLES LIKE 'secure_file_priv';

/* Since order_date and date column formats did not match the same supported by MySQL, so in CREATE TABEL statement, I
 had to specify these columns as VARCHAR first to be able to store the raw text without errors , then converted them into DATE 
 using STR-TO-DATE that is supported by sql and then changed the data type to DATE/DATETIME.
	Instead If I imported the entire table without a CREATE TABLE statement and just modified the data type of these columns
to DATE/DATETIME, then I perform fewer steps...so that is easier*/

drop table dates;

-- Checking for the presence of null and duplicate values
select * 
from bigbasket_product_details
where product_id is null;

select product_id, product_name, sale_price, market_price, count(*) 
from bigbasket_product_details
group by product_id, product_name, sale_price, market_price
having count(*)>1;

select * 
from bigbasket_customer_details
where customer_id is null;

select customer_id, customer_name, count(*)
from bigbasket_customer_details
group by customer_id, customer_name
having count(*)>1;

select * 
from bigbasket_orders_table
where order_id is null;

select order_id, customer_id, product_id, order_date, count(*) 
from bigbasket_orders_table
group by order_id, customer_id, product_id, order_date
having count(*)>1;

select * 
from bigbasket_date_table
where order_date is null;

select order_date, count(*)
from bigbasket_date_table
group by order_date
having count(*)>1;

-- 
describe bigbasket_customer_details;

ALTER TABLE bigbasket_customer_details
RENAME COLUMN ï»¿customer_id TO customer_id,
RENAME COLUMN `Phone No.` TO phone;

UPDATE bigbasket_customer_details
SET registration_date= str_to_date(registration_date,'%d/%m/%Y');

-- Alter column data types in the customers table
ALTER TABLE bigbasket_customer_details
MODIFY COLUMN customer_id VARCHAR(20),
MODIFY COLUMN customer_name VARCHAR(30),
MODIFY COLUMN phone VARCHAR(20),
MODIFY COLUMN area VARCHAR(30),
MODIFY COLUMN state VARCHAR(20),
MODIFY COLUMN pincode int,
MODIFY COLUMN registration_date DATE,
MODIFY COLUMN customer_segment VARCHAR(10),
MODIFY COLUMN total_orders INT;

-- Update phone numbers to include '+' at the beginning if missing
UPDATE bigbasket_customer_details
SET phone = CONCAT('+', phone)
WHERE phone NOT LIKE '+%';

-- DATA TRANSFORMATION

describe bigbasket_date_table;

UPDATE bigbasket_date_table
SET `date`= str_to_date(`date`,'%Y-%m-%d'),
order_date = str_to_date(order_date, '%d/%m/%Y %H:%i');

ALTER TABLE bigbasket_date_table
MODIFY COLUMN order_date DATETIME,
MODIFY COLUMN `date` DATE,
MODIFY COLUMN `year-month` VARCHAR(10),
MODIFY COLUMN `day name` VARCHAR(15),
MODIFY COLUMN hour INT;

ALTER TABLE bigbasket_date_table
RENAME COLUMN ï»¿order_date TO order_date,
RENAME COLUMN `year-month` TO `year_month`,
RENAME COLUMN `day name` TO `day_name`,
RENAME COLUMN `order quarter` TO `order_quarter`,
RENAME COLUMN `order_datetime` TO `order_date`,
RENAME COLUMN `order_date` TO `date`;

describe bigbasket_orders_table;

ALTER TABLE bigbasket_orders_table
ADD COLUMN `sl no.` int auto_increment unique first;

update bigbasket_orders_table
set order_date = str_to_date(order_date, '%d/%m/%Y %H:%i'),
promised_delivery_time=str_to_date(promised_delivery_time, '%d/%m/%Y %H:%i'),
actual_delivery_time=str_to_date(actual_delivery_time, '%d/%m/%Y %H:%i');

alter table bigbasket_orders_table
rename column discount_perentage to discount_percentage,
rename column `sl no` TO sl_no;

ALTER TABLE bigbasket_orders_table
MODIFY COLUMN customer_id VARCHAR(20),
MODIFY COLUMN product_id VARCHAR(20),
MODIFY COLUMN sale_price DECIMAL(10,2),
MODIFY COLUMN market_price DECIMAL(10,2),
MODIFY COLUMN total_selling_value DECIMAL(10,2),
MODIFY COLUMN total_market_value DECIMAL(10,2),
MODIFY COLUMN discount_percentage DECIMAL(5,2),
MODIFY COLUMN order_date DATETIME,
MODIFY COLUMN promised_delivery_time DATETIME,
MODIFY COLUMN actual_delivery_time DATETIME,
MODIFY COLUMN delivery_status VARCHAR(40),
MODIFY COLUMN payment_method VARCHAR(20),
MODIFY COLUMN Delivery_Partner_ID VARCHAR(20),
MODIFY COLUMN Store_id VARCHAR(20);

UPDATE bigbasket_orders_table
SET discount_percentage = REPLACE(discount_percentage, '%', '');

update bigbasket_orders_table
set discount_percentage=0
where order_id= 4113927200 ;

describe bigbasket_product_details;

ALTER TABLE bigbasket_product_details
ADD COLUMN `index` int auto_increment unique first;

ALTER TABLE bigbasket_product_details
MODIFY COLUMN product_id VARCHAR(50),
MODIFY COLUMN `Product Name` VARCHAR(255),
MODIFY COLUMN category VARCHAR(100),
MODIFY COLUMN sub_category VARCHAR(100),
MODIFY COLUMN brand VARCHAR(100),
MODIFY COLUMN sale_price DECIMAL(10,2),
MODIFY COLUMN market_price DECIMAL(10,2),
MODIFY COLUMN type VARCHAR(50),
MODIFY COLUMN rating DECIMAL(10,1);

ALTER TABLE bigbasket_product_details
RENAME COLUMN `Product Name` TO `product_name`,
RENAME COLUMN type to `product_type`,
RENAME COLUMN `index` TO `index_no`;

-- Creating some VIEWS to make calculations easier and avoid joining tables every time.

create or replace view all_tables_combined as
select bo.*,
bp.index_no, product_name, category, sub_category, brand, product_type, rating,
bc.customer_name, phone, area, state, pincode, registration_date, customer_segment, total_orders, 
bd.date, year, month, `year_month`, order_quarter, day, day_name, hour
from bigbasket_orders_table bo
join bigbasket_product_details bp on bo.product_id=bp.product_id
join bigbasket_customer_details bc on bo.customer_id=bc.customer_id
join bigbasket_date_table bd on bo.order_date=bd.order_date
order by sl_no;

create or replace view orders_dates_products as 
select bo.*,
bp.index_no, product_name, category, sub_category, brand, product_type, rating,
bd.date, year, month, `year_month`, order_quarter, day, day_name, hour
from bigbasket_orders_table bo
join bigbasket_product_details bp on bo.product_id=bp.product_id
join bigbasket_date_table bd on bo.order_date=bd.order_date;

create or replace view orders_dates_customers as 
select bo.*,
bc.customer_name, phone, area, state, pincode, registration_date, customer_segment, total_orders, 
bd.date, year, month, `year_month`, order_quarter, day, day_name, hour
from bigbasket_orders_table bo
join bigbasket_customer_details bc on bo.customer_id=bc.customer_id
join bigbasket_date_table bd on bo.order_date=bd.order_date;

create or replace view orders_dates as 
select bo.*,
bd.date, year, month, `year_month`, order_quarter, day, day_name, hour
from bigbasket_orders_table bo
join bigbasket_date_table bd on bo.order_date=bd.order_date;

