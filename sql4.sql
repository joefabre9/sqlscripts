use bestbuy;
-- What is the total revenue from on sale products sold?
select sum(quantity * priceperunit) from sales as s
inner join products as p on p.ProductID = s.ProductID
where p.onsale = true;

-- What is the total revenue from games?
select sum(quantity * priceperunit) from sales as s
inner join products as p on p.ProductID = s.ProductID
inner join categories as c on c.CategoryID = p.CategoryID
where c.name = 'games';

-- What is the total quantity of games sold?
select sum(quantity) from sales as s
inner join products as p on p.ProductID = s.ProductID
inner join categories as c on c.CategoryID = p.CategoryID
where c.name = 'games';

-- How many products have no sales? !!Get Mike's input.
SELECT (p.Name), s.ProductID FROM products AS p
left JOIN sales AS s ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

-- What is the average rating for game reviews? Cat to Prod and Prod to Rev
select avg(rating) from reviews as r
inner join products as p on p.ProductID = r.ProductID 
inner join categories as c on c.CategoryID = p.CategoryID
where c.name = 'games';

-- Which category has the 2nd most sales (by quantity)? Cat and Sal
select count(s.quantity), c.categoryid, c.name from sales as s
inner join products as p
on s.productid = p.ProductID
inner join categories as c
on p.CategoryID = c.CategoryID
group by c.CategoryID
order by count(s.quantity) desc
limit 2;

-- How many unique products were sold during 2015 with a price greater than 50?
select count(distinct p.ProductID) as cp from products as p
inner join sales as s
on p.ProductID = s.ProductID
where s.Date like '%2015%' and price >= 50;

-- Which department has the lowest revenue?
select d.name as Department, sum(quantity * priceperunit) as Revenue from sales as s
inner join products as p on p.ProductID = s.ProductID
inner join categories as c on c.CategoryID = p.CategoryID
inner join departments as d on d.departmentid = c.departmentid
where  (Quantity * priceperunit) = (select min(quantity * priceperunit) from sales)
group by d.name;

-- What is the first name of the employee with the most sales of small electronics (by revenue)?
select e.FirstName as fn, sum(s.quantity * s.priceperunit) as tr from sales as s
inner join products as p on p.ProductID = s.ProductID
inner join categories as c on c.CategoryID = p.CategoryID
inner join departments as d on d.departmentid = c.departmentid
inner join employees as e on e.employeeid = s.EmployeeID
where d.name = 'small electronics'
group by e.FirstName
order by tr desc
limit 1;


