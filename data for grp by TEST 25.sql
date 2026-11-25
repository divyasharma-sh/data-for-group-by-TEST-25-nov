drop database if exists groupby_exercise;
create database groupby_exercise;
use groupby_exercise;

create table sales (
order_id int primary key,
order_date date,
region varchar(20),
category varchar(30),
salesperson varchar(30),
quantity int,
amount decimal(10,2)
);

insert into sales (order_id, order_date, region, category, salesperson, quantity, amount) values
(1, '2026-01-05', 'North', 'Laptop', 'Amit', 2, 120000.00),
(2, '2026-01-08', 'North', 'Mobile', 'Neha', 5, 75000.00),
(3, '2026-01-12', 'South', 'Laptop', 'Ravi', 1, 62000.00),
(4, '2026-01-15', 'East', 'Accessories', 'Pooja', 8, 16000.00),
(5, '2026-01-18', 'West', 'Mobile', 'Karan', 3, 48000.00),
(6, '2026-01-22', 'North', 'Accessories', 'Amit', 10, 22000.00),
(7, '2026-01-25', 'South', 'Mobile', 'Ravi', 4, 60000.00),
(8, '2026-01-28', 'East', 'Laptop', 'Pooja', 2, 118000.00),
(9, '2026-02-02', 'West', 'Accessories', 'Karan', 6, 15000.00),
(10, '2026-02-05', 'North', 'Laptop', 'Neha', 1, 65000.00),
(11, '2026-02-09', 'South', 'Accessories', 'Ravi', 12, 24000.00),
(12, '2026-02-12', 'East', 'Mobile', 'Pooja', 3, 51000.00),
(13, '2026-02-15', 'West', 'Laptop', 'Karan', 2, 126000.00),
(14, '2026-02-18', 'North', 'Mobile', 'Amit', 6, 90000.00),
(15, '2026-02-22', 'South', 'Laptop', 'Ravi', 2, 124000.00),
(16, '2026-02-25', 'East', 'Accessories', 'Pooja', 5, 11000.00),
(17, '2026-03-01', 'West', 'Mobile', 'Karan', 4, 64000.00),
(18, '2026-03-04', 'North', 'Accessories', 'Neha', 7, 17500.00),
(19, '2026-03-08', 'South', 'Mobile', 'Ravi', 5, 78000.00),
(20, '2026-03-12', 'East', 'Laptop', 'Pooja', 1, 60000.00),
(21, '2026-03-16', 'West', 'Accessories', 'Karan', 9, 21000.00),
(22, '2026-03-20', 'North', 'Laptop', 'Amit', 3, 186000.00),
(23, '2026-03-24', 'South', 'Accessories', 'Ravi', 6, 13500.00),
(24, '2026-03-28', 'East', 'Mobile', 'Pooja', 7, 112000.00);

select * from sales;

-- 1. ques
select region, count(*) as total_orders
from sales
group by region;

-- 2. ques
select category, sum(amount) as total_sales
from sales
group by category;

-- 3. ques
select salesperson, avg(amount) as avg_amount
from sales
group by salesperson;

-- 4. ques
select region, sum(quantity) as total_quantity
from sales
group by region;

-- 5. ques
select region, category, sum(amount) as total_sales
from sales
group by region, category;

-- 6. ques
select region, category, salesperson, count(*) as total_orders, sum(amount) as total_sales
from sales
group by region, category, salesperson;

-- 7. ques
select region, count(*) as total_orders
from sales
group by region
having count(*) > 5;

-- 8. ques
select category, sum(amount) as total_sales
from sales
group by category
having sum(amount) > 150000;

-- 9. ques
select salesperson, avg(amount) as avg_amount
from sales
group by salesperson
having avg(amount) > 60000;

-- 10. ques
select region, category, sum(quantity) as total_quantity
from sales
group by region, category
having sum(quantity) >= 12;

-- 11. ques
select region, salesperson, sum(amount) as total_sales
from sales
where order_date >= '2026-02-01'
group by region, salesperson
having sum(amount) > 100000;

-- 12. ques
select region, category, salesperson, count(*) as total_orders, sum(quantity) as total_quantity, sum(amount) as total_sales
from sales
group by region, category, salesperson
having sum(amount) >= 50000
order by total_sales desc;


