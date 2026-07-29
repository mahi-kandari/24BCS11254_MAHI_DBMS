
select c.customer_name, o.order_id, c.customer_id, o.product_name, o.order_date, o.quantity from orders as o
left join customers as c
on o.customer_id = c.customer_id;

select p.product_name, c.category_name from products as p
full outer join categories as c
on p.category_id = c.category_id;

select c.category_name, p.product_name, p.price from categories as c
join products as p
on c.category_id = p.category_id;