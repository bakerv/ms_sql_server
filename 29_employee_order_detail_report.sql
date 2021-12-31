SELECT Orders.EmployeeID, Employees.LastName, Orders.OrderID,
Products.ProductName, OrderDetails.Quantity
FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
