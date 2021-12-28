SELECT Products.ProductID, Products.ProductName,
Suppliers.CompanyName
FROM Products JOIN Suppliers 
ON Products.SupplierID = Suppliers.SupplierID