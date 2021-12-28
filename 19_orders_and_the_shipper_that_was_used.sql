SELECT Orders.OrderID, CONVERT(date,Orders.OrderDate) AS 'OrderDate',
Shippers.CompanyName
FROM Orders JOIN Shippers ON (Orders.ShipVia = Shippers.ShipperID)
WHERE Orders.OrderID < 10270
