SELECT Orders.CustomerID, Customers.CompanyName, Orders.OrderID,
TotalOrderAmount = SUM(OrderDetails.UnitPrice * OrderDetails.Quantity)
FROM Orders 
JOIN Customers ON (Orders.CustomerID = Customers.CustomerID)
JOIN OrderDetails ON (Orders.OrderID = OrderDetails.OrderID)
WHERE YEAR(Orders.OrderDate) = '2016'
GROUP BY Orders.CustomerID, Customers.CompanyName, Orders.OrderID
HAVING SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) > 10000
ORDER BY TotalOrderAmount DESC
