SELECT Top 2 Percent OrderID
FROM OrderDetails
GROUP BY OrderID
Order BY newid()