-- What is the average price of all products? 
select avg(price) from products;

-- What is the average price of all products that are on sale?
select avg(price) from products
where onsale = true; -- could use 1 or true

-- What is the total quantity of all orders? 
select sum(quantity) from sales;

-- What is the average quantity per order? 
select avg(quantity) from sales;

-- What is the total revenue from orders?
select sum(quantity * priceperunit) from sales;

-- What is the average revenue per order?
select avg(quantity * PricePerUnit) from sales;

