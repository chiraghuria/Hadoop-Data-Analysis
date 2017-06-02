create external table project_customer_upsale.customers(first_name string,last_name string, email string, photo_url string, state string, phone string, 
		date string, product string, amount int, product_code int, quantity_purchased int)
row format delimited
fields terminated by '\t'
location '/user/cloudera/Projects/Project_CustomerCrossSell/';

select * from customers limit 10;

-----spending capacity analysis----

create table spending_capacity
as
select customers.first_name, customers.last_name, SUM(customers.product_amount*customers.quantity_purchased) as amount_spent
from customers
group by first_name, last_name
order by amount_spent desc;

select * from spending_capacity;


----potential customers analysis----

create table potential_customers
as
select first_name, last_name, COUNT(quantity_purchased) as no_of_items_purchased, SUM(product_amount*quantity_purchased) as amount_spent
from customers
group by first_name, last_name
order by no_of_items_purchased desc, amount_spent desc;

select * from potential_customers;

