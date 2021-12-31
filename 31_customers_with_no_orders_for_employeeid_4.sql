SELECT DISTINCT Customers.CustomerID, Orders.CustomerID
FROM Customers LEFT JOIN Orders ON (Customers.CustomerID = Orders.CustomerID)
WHERE Customers.CustomerID NOT IN (SELECT CustomerID FROM Orders WHERE EmployeeID = 4)

SELECT CustomerID
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID
						 FROM Orders
						 WHERE EmployeeID = 4)

SELECT Customers.CustomerID, Orders.CustomerID
FROM Customers LEFT JOIN Orders ON (Customers.CustomerID = Orders.CustomerID
                                    AND Orders.EmployeeID = 4)
WHERE Orders.CustomerID IS NULL