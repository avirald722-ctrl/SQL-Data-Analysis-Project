create database window_function;
use window_function;
create table products(
product_id int primary key,
category varchar(50),
price int
);

insert into products values
(1,'electronics',40000),
(2,'electronics',50000),
(3,'clothing',1000),
(4,'clothing',2000),
(5,'furniture',10000),
(6,'furniture',15000),
(7,'furniture',20000);
 select * from products;
 
 -- select column name
 -- fun()([partition by clause]
 --      [order by clause])
 
 -- Aggregate function.
 -- use sum.
 select category,price,
 sum(price) over(partition by category) 'sum_of_price'
 from products;
 
 -- order_by.
 select category,price,
 sum(price) over(partition by category order by price) 'sum_of_price',
 min(price)over(partition by category) 'min_price',
 max(price)over(partition by category) 'max_price',
 avg(price)over(partition by category) 'avg_price'
 from products;
 
 -- ranking function
 select*,
 row_number()over(order by price)'row_number_ranking',
  rank()over(order by price) 'rank function',
  dense_rank()over(order by price) 'dense function'
  from products;
  