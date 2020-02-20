-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT 
    ProductName
   , Category.CategoryName
 FROM Product
 JOIN Category ON Product.CategoryId = Category.Id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT 
    o.id
    ,Shipper.CompanyName
 FROM [order] AS o
JOIN Shipper ON o.ShipVia = Shipper.id
WHERE o.OrderDate < '2012-08-09'
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
Select 
    o.id
    ,p.ProductName as 'Product Name'
    ,od.Quantity as 'Quantity' 
from [Order]as o 
join OrderDetail as od on o.id = od.OrderId 
join Product as p on od.ProductId = p.id
where o.id = 10251;
ORDER BY p.ProductName ASC
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT 
    o.Id as OrderId
   ,Customer.CompanyName
   ,Employee.LastName
FROM [Order] as o
JOIN Customer ON o.CustomerId = Customer.Id
join Employee on Employee.Id = o.EmployeeId