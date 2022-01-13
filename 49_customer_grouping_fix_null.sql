SELECT Orders.CustomerID, Customers.CompanyName, 
	SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS 'Total Order Amount',
	CASE
		WHEN SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) <= 1000
		THEN 'Low'
		WHEN SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) > 1000
			AND SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) <=5000
		THEN 'Medium'
		WHEN SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) >5000
			AND SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) <=10000
		THEN 'High'
		WHEN SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) > 10000
		THEN 'Highest'
	END AS 'Customer Group'
FROM Orders 
	JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE YEAR(Orders.OrderDate) = '2016'
GROUP BY Orders.CustomerID, Customers.CompanyName
ORDER BY CustomerID ASC;
