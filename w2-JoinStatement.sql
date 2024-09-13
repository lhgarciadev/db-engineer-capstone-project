SELECT 
    Customers.CustomerID, 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName,
    Orders.OrderID, 
    Orders.TotalCost, 
    Menus.MenuName, 
    MenuItems.CourseName, 
    MenuItems.Starter
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN Menus ON Menus.MenuID = Orders.MenuID
JOIN MenuItems ON MenuItems.MenuID = Menus.MenuID
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost ASC;
