--execute data order_details and products
SELECT * FROM portofolio.order_details;
SELECT * FROM portofolio.products;
SELECT * FROM portofolio.propertyinfo;

--combine each data
select 
od.OrderID, od.OrderDate, od.PropertyID, od.Quantity, 
p.ProductID, p.ProductName, p.ProductCategory, p.Price
from order_details od
join products p
on od.productid = p.productid
order by
5;

select 
od.OrderID, od.OrderDate, od.productid, od.Quantity, 
pro.`Prop ID`, pro.PropertyCity, pro.PropertyState
from order_details od
join propertyinfo pro
on od.propertyid = pro.`Prop ID`
order by
5;

select
odp.OrderID, odp.OrderDate, odp.PropertyID, odp.Quantity, odp.ProductID, odp.ProductName, 
odp.ProductCategory, odp.Price,
oprop.PropertyCity, oprop.PropertyState
from od_products odp
join od_prop oprop
on odp.OrderID = oprop.OrderID
order by 1;

--analysis data
select Quantity, sum(price) from cleandata
group by quantity
order by 2 desc;

select orderdate, count(orderdate)
from cleandata
group by
1
order by count(orderdate)
desc;

select orderdate, sum(price), sum(quantity)
from cleandata
group by orderdate
order by 2 desc;
