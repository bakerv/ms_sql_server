SELECT EmployeeID, OrderID, OrderDate
FROM Orders
WHERE OrderDate IN (SELECT Distinct EOMONTH(OrderDate) FROM Orders)
Order BY EmployeeID