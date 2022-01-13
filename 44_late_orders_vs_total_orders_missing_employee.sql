WITH LateOrders (EmployeeID, TotalLateOrders)
	AS
	(
	SELECT Orders.EmployeeID, 
		COUNT(*) as TotalLateOrders
	FROM Orders
	WHERE (Orders.ShippedDate >= Orders.RequiredDate)
	GROUP BY EmployeeID
	),

OrdersTotal (EmployeeID, TotalOrders)
	AS
	(
	SELECT Orders.EmployeeID,
		COUNT(*) as TotalOrders
	FROM Orders
	GROUP BY EmployeeID
	)

SELECT OrdersTotal.EmployeeID, Employees.LastName, TotalOrders, TotalLateOrders
FROM LateOrders 
	 RIGHT JOIN OrdersTotal ON LateOrders.EmployeeID = OrdersTotal.EmployeeID
	JOIN Employees ON OrdersTotal.EmployeeID = Employees.EmployeeID
ORDER BY EmployeeID ASC;