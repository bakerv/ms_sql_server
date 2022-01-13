WITH LateOrders (EmployeeID, TotalLateOrders)
	AS
	(
	SELECT Orders.EmployeeID, count(*) as TotalLateOrders
	FROM Orders
	WHERE (Orders.ShippedDate >= Orders.RequiredDate)
	GROUP BY EmployeeID
	),

OrdersTotal (EmployeeID, TotalOrders)
	AS
	(
	SELECT Orders.EmployeeID,
		count(*) as TotalOrders
	FROM Orders
	GROUP BY EmployeeID
	)

SELECT OrdersTotal.EmployeeID, Employees.LastName, TotalOrders,
	(cast(CASE
		WHEN TotalLateOrders IS NULL THEN 0
		ELSE TotalLateOrders
		END as decimal(10,2)) / TotalOrders) AS PercentLate  
FROM LateOrders 
	RIGHT JOIN OrdersTotal ON LateOrders.EmployeeID = OrdersTotal.EmployeeID
	JOIN Employees ON OrdersTotal.EmployeeID = Employees.EmployeeID
ORDER BY EmployeeID ASC;