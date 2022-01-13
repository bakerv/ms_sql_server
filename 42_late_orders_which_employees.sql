SELECT Orders.EmployeeID, Employees.LastName,
COUNT(Orders.EmployeeID) as TotalLateOrders
FROM Orders JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE (Orders.ShippedDate >= Orders.RequiredDate)
GROUP BY Orders.EmployeeID, Employees.LastName
ORDER BY TotalLateOrders Desc