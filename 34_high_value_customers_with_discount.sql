SELECT Orders.CustomerID, Customers.CompanyName,
'Totals Without Discount' = SUM(OrderDetails.UnitPrice * OrderDetails.Quantity),
'Totals With Discount' = SUM((OrderDetails.UnitPrice * OrderDetails.Quantity)
                           * (1 - OrderDetails.Discount)) 
FROM Orders 
JOIN Customers ON (Orders.CustomerID = Customers.CustomerID)
JOIN OrderDetails ON (Orders.OrderID = OrderDetails.OrderID)
WHERE YEAR(Orders.OrderDate) = '2016'
GROUP BY Orders.CustomerID, Customers.CompanyName
HAVING SUM((OrderDetails.UnitPrice * OrderDetails.Quantity)
         * (1 - OrderDetails.Discount))  > 15000
ORDER BY 'Totals With Discount' DESC