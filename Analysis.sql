-- SALES DASHBOARD
-- 1. Total Sales (overall and monthly), Month over month change and % change from previous month 
select concat(sum(total_selling_value)/1000, " K") as total_sales_overall
from orders_dates;

select yr_month, sum(total_selling_value) as monthly_sles,
round((sum(total_selling_value)- lag(sum(total_selling_value),1) over(order by year,month))/1000,2) as MOM_rev_change,
round((sum(total_selling_value)- lag(sum(total_selling_value),1) over(order by year,month))*100/
lag(sum(total_selling_value),1) over(order by year,month),1) as MOM_perc_rev_change
from orders_dates
group by yr_month;

-- 2. Total no. of Orders (overall and monthly), Month over month change and % change from previous month 
select count(distinct order_id) as total_orders_overall
from orders_dates;

select yr_month, count(order_id) as monthly_orders,
count(distinct order_id)- lag(count(distinct order_id),1) over(order by year,month) as MOM_orders_change,
round((count(distinct order_id)- lag(count(distinct order_id),1) over(order by year,month))*100/
lag(count(distinct order_id),1) over(order by year,month),1) as MOM_perc_orders_change
from orders_dates
group by yr_month;

-- 3. Total Quantity Sold (overall and monthly), Month over month change and % change from previous month 
select sum(quantity) as total_qt_sold_overall
from orders_dates;

select yr_month, sum(quantity) as monthly_qt_sold,
sum(quantity)- lag(sum(quantity),1) over(order by year,month) as MOM_qt_change,
round((sum(quantity)- lag(sum(quantity),1) over(order by year,month))*100/
lag(sum(quantity),1) over(order by year,month),1) as MOM_perc_qt_change
from orders_dates
group by yr_month;

-- 4. Average Order Value (overall and monthly), Month over month change and % change from previous month 
select sum(total_selling_value)/count(distinct order_id) as aov_overall, avg(total_selling_value)
from orders_dates;

/* Here ORDER_IDs are unique in each row..so in calculating AOV, 
sum(total_selling_value)/count(distinct order_id) and avg(total_selling_value) are the same*/
select yr_month, sum(total_selling_value)/count(distinct order_id) as monthly_qt_sold2,
avg(total_selling_value) as monthly_qt_sold,
avg(total_selling_value)- lag(avg(total_selling_value),1) over(order by year,month) as MOM_qt_change,
round((avg(total_selling_value)- lag(avg(total_selling_value),1) over(order by year,month))*100/
lag(avg(total_selling_value),1) over(order by year,month),1) as MOM_perc_qt_change
from orders_dates
group by yr_month;

-- 5. Product Category and Sub-category wise contribution to total sales.
-- 5. A) Product Category Wise (Overall):
select category, round(sum(total_selling_value)/1000,2) as sales_by_category,
round(sum(total_selling_value)*100/(select sum(total_selling_value) from orders_dates_products),3) as perc_contri_by_category
from orders_dates_products
group by category
order by perc_contri_by_category desc;

-- 5. B) Category and Sub-category Wise(Overall):
select category, sub_category, round(sum(total_selling_value)/1000,2) as sales_by_category,
round(sum(total_selling_value)*100/(select sum(total_selling_value) from orders_dates_products),3) as perc_contri_by_category
from orders_dates_products
group by category, sub_category
order by perc_contri_by_category desc;

-- 5.C) Product Category Wise (Year-Month):
with cte as (
select yr_month, sum(total_selling_value) as monthly_total_sales
from orders_dates_products
group by yr_month
-- order by year,month
)
select cte.*, category, round(sum(total_selling_value)/1000,2) as sales_by_category,
round(sum(total_selling_value)*100/monthly_total_sales,3) as perc_contri_by_category
from cte
join orders_dates_products op on cte.yr_month=op.yr_month
group by cte.yr_month, category
order by year,month, perc_contri_by_category desc;

-- 5.D) Product Category and Sub-category Wise (Year-Month):
with cte as (
select yr_month, sum(total_selling_value) as monthly_total_sales
from orders_dates_products
group by yr_month
-- order by year,month
)
select cte.*, category, sub_category, round(sum(total_selling_value)/1000,2) as sales_by_category,
round(sum(total_selling_value)*100/monthly_total_sales,3) as perc_contri_by_category
from cte
join orders_dates_products op on cte.yr_month=op.yr_month
group by cte.yr_month, category, sub_category
order by year,month, perc_contri_by_category desc;

-- 6. Year and Quarter Wise Total Sales
-- Yearly Revenue
select year, sum(total_selling_value)/1000 as yearly_sales
from orders_dates
group by year;

-- Revenue based on Year and Quarter
select year, order_quarter, sum(total_selling_value)/1000 as yr_quarter_sales
from orders_dates
group by year, order_quarter;

-- Daily Sales
select day, sum(total_selling_value) as daily_sales, 
(select sum(total_selling_value)/count(distinct date) as daily_avg_sales from orders_dates)
from orders_dates
group by day
order by day;

with cte as (
select yr_month, sum(total_selling_value)/count(distinct date) as monthly_avg_sales
from orders_dates
group by year,month
)
select cte.yr_month, day, sum(total_selling_value) as daily_sales, monthly_avg_sales,
case when sum(total_selling_value)> monthly_avg_sales then "Above Average" else "Below Average" end as comparison
from cte
join orders_dates od on cte.yr_month=od.yr_month
group by cte.yr_month, day
order by year,month, day;

-- Peak Order Hour
select hour, sum(total_selling_value) as hourly_sales
from orders_dates
group by hour
order by hour;

select yr_month, hour, sum(total_selling_value) as hourly_sales
from orders_dates
group by yr_month, hour
order by year,month, hour;

-- State Wise Total Revenue, Total no. of Orders and AOV
-- Filter data manually based on year and month.
select state, sum(total_selling_value) as total_rev
from orders_dates_customers
group by state
order by total_rev desc;

select state, count(distinct order_id) as total_orders
from orders_dates_customers
group by state
order by total_orders desc;

select state, avg(total_selling_value) as aov
from orders_dates_customers
group by state
order by aov desc;

-- Most discounted categories amd sub-categories
select category, round(avg(discount_percentage),2) as avg_discount_by_categories
from orders_dates_products
group by category
order by avg_discount_by_categories desc;

select category,sub_category, round(avg(discount_percentage),2) as avg_discount_by_subcategories
from orders_dates_products
group by category, sub_category
order by avg_discount_by_subcategories desc;

-- Brands
select brand, sum(total_selling_value) as total_sales, round(avg(rating),2) as avg_rating, 
round(sum(total_selling_value)/sum(quantity),2) as avg_selling_price, sum(quantity) as total_qt_sold
from orders_dates_products
group by brand
order by total_sales desc;

-- Delivery Status
select delivery_status, count(distinct order_id) as order_count,
count(distinct order_id)*100/(select count(distinct order_id) from orders_dates) as pct_of_orders
from orders_dates
group by delivery_status
order by pct_of_orders desc;

-- products most sold and total sales 
select product_name, sum(quantity) as qt_sold
from orders_dates_products
group by product_name
order by qt_sold desc;

select product_name, sum(total_selling_value) as total_sales_by_product
from orders_dates_products
group by product_name
order by total_sales_by_product desc;

-- Total no of Customers
select count(distinct customer_id) as total_customers
from orders_dates_customers;

-- New and repeat customers

with first_purchase as (
select customer_id, min(order_date) as first_order_date
from orders_dates_customers
group by customer_id
)
,cte2 as(
select odc.yr_month,  odc.customer_id, odc.order_date, fp.first_order_date,
 case when odc.order_date= fp.first_order_date then odc.customer_id else null end as new_customers,
 case when odc.order_date <> fp.first_order_date then odc.customer_id else null end as repeat_customers
from first_purchase fp
right join orders_dates_customers odc on fp.customer_id=odc.customer_id
)
select yr_month, count(distinct new_customers) as new,
count(distinct repeat_customers) as repeated
from cte2
group by yr_month;

with first_purchase as (
select customer_id, min(order_date) as first_order_date
from orders_dates_customers
group by customer_id
)
 ,cte2 as (
select odc.year, odc.month, odc.yr_month, count(distinct odc.customer_id) as total_customers, 
count(distinct case when odc.order_date= fp.first_order_date then odc.customer_id else null end) as new_customers,
count(distinct case when month(odc.order_date)<>month(fp.first_order_date) then odc.customer_id else null end) as repeat_customers
from first_purchase fp
right join orders_dates_customers odc on fp.customer_id=odc.customer_id
group by odc.yr_month
order by year, month
)
select yr_month, total_customers,new_customers,repeat_customers,
(total_customers-lag(total_customers,1) over(order by year, month))*100/lag(total_customers,1) over(order by year, month) as mom_chg,
(new_customers-lag(new_customers,1) over(order by year, month))*100/lag(new_customers,1) over(order by year, month) as mom_chg_new,
(repeat_customers-lag(repeat_customers,1) over(order by year, month))*100/lag(repeat_customers,1) over(order by year, month) as mom_chg_repeat
from cte2 ;

-- Total customers by year and quarter
select year, order_quarter, count(distinct customer_id) as total_customers
from orders_dates_customers
group by year, order_quarter;

-- Daily no of Customers
select day, count(distinct customer_id) as total_customers
from orders_dates_customers
group by day;

select yr_month,day, count(distinct customer_id) as total_customers
from orders_dates_customers
group by year, month, day
order by year, month, day;

select customer_segment, sum(total_selling_value) as total_rev, 
count(distinct customer_id) as total_customers,
avg(total_selling_value) as aov,
count(distinct order_id) as total_orders,
sum(quantity) as qt_sold
from orders_dates_customers
group by customer_segment
order by total_rev desc;

select payment_method, 
sum(total_selling_value) as total_rev, 
round(sum(total_selling_value)*100/(select sum(total_selling_value) from bigbasket_orders_table),2) as rev_pct,
avg(total_selling_value) as aov,
round(avg(total_selling_value)*100/(select avg(total_selling_value) from bigbasket_orders_table),2) as aov_pct,
count(distinct order_id) as total_orders,
round(count(distinct order_id)*100/(select count(distinct order_id) from bigbasket_orders_table),2) as orders_pct
from orders_dates_customers
group by payment_method
order by total_orders desc;

-- Top 10% customers based on total orders and revenue generated
with cte as (
select customer_id, customer_name, sum(total_selling_value) as sales, count(distinct order_id) as total_orders,
ntile(10) over(order by sum(total_selling_value) desc) as flag
from orders_dates_customers
group by customer_id, customer_name
)
select *
from cte 
where flag=1;

with cte as (
select customer_id, customer_name, count(distinct order_id) as total_orders,
ntile(10) over(order by count(distinct order_id) desc) as flag
from orders_dates_customers
group by customer_id, customer_name
)
select *
from cte 
where flag=1;

-- Using Percent Rank
with cte as (
select customer_id, customer_name, sum(total_selling_value) as sales, count(distinct order_id) as total_orders,
percent_rank() over(order by sum(total_selling_value) desc) as flag
from orders_dates_customers
group by customer_id, customer_name
)
select *
from cte 
where flag<=0.1;

-- Customer who generated highest revenue
with cte as (
select customer_id, customer_name, sum(total_selling_value) as total_rev,
dense_rank() over(order by sum(total_selling_value) desc) as rnk
from orders_dates_customers
group by customer_id, customer_name
)
select customer_id, customer_name, total_rev
from cte
where rnk=1;

with cte as (
select yr_month,customer_id, customer_name, sum(total_selling_value) as total_rev
from orders_dates_customers
group by yr_month,customer_id, customer_name
order by year,month, total_rev desc
)
, cte_rank as (
select *,
dense_rank() over(partition by yr_month order by total_rev desc) as rnk
from cte)
select * from cte_rank
where rnk=1;

with cte as (
select customer_id, customer_name, sum(total_selling_value) as total_rev,
dense_rank() over(order by sum(total_selling_value) desc) as rnk
from orders_dates_customers
group by customer_id, customer_name
)
select customer_id, customer_name, total_rev
from cte
where rnk=1;

with cte as (
select yr_month,customer_id, customer_name, count(distinct order_id) as total_orders,sum(total_selling_value) as total_rev
from orders_dates_customers
group by yr_month,customer_id, customer_name
order by year,month, total_orders desc
)
, cte_rank as (
select *,
dense_rank() over(partition by yr_month order by total_orders desc) as rnk
from cte)
select * from cte_rank
where rnk=1;

with cte as (
select yr_month,customer_id, customer_name, sum(total_selling_value) as total_rev,count(distinct order_id) as total_orders
from orders_dates_customers
group by yr_month,customer_id, customer_name
order by year,month, total_rev desc
)
, cte_rank as (
select *,
dense_rank() over(partition by yr_month order by total_rev desc) as rnk
from cte)
select * from cte_rank
where rnk=1;