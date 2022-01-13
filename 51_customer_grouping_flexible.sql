WITH CompanyGroups(CustomerID, CompanyName, OrderTotal)
	AS
	(
	SELECT Orders.CustomerID, Customers.CompanyName, 
		SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS 'Total Order Amount'
	FROM Orders 
		JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
		JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	WHERE YEAR(Orders.OrderDate) = '2016'
	GROUP BY Orders.CustomerID, Customers.CompanyName
	)

SELECT CustomerID, CompanyName, OrderTotal, CustomerGroupName
FROM CompanyGroups
	JOIN CustomerGroupThresholds ON 
		(OrderTotal >= RangeBottom AND OrderTotal <= RangeTop) 