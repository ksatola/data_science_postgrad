USE Northwind

-- Napisz polecenie zwracajace nazwy produktow i firmy je dostarczajace
-- tak, aby produkty bez dostarczycieli i dostarczyciele bez produktow nie pojawiali sie w wyniku
SELECT S.CompanyName, P.ProductName
FROM Products AS P
    INNER JOIN Suppliers S
        ON P.SupplierID = S.SupplierID
--GROUP BY S.CompanyName, P.ProductName

-- Napisz polecenie zwracajace jako wynik nazwy klientow, ktorzy zlozyli zamowienia
-- po 01 marca 1998
SELECT C.CompanyName, O.OrderDate
FROM Customers C
    INNER JOIN Orders O on C.CustomerID = O.CustomerID
WHERE O.OrderDate > '1998-03-01'

-- Napisz polecenie zwracajace _wszystkich_ klientow z datami zamowien
SELECT C.CompanyName, O.OrderDate
FROM Customers C
LEFT OUTER JOIN Orders O
    ON C.CustomerID = O.CustomerID

-- Wybierz nazwy i ceny produktow o cenie jednostkowej pomiedzy 20.00 a 30.00,
-- dla kazdego produktu podaj dane adresowe dostawcy
SELECT P.ProductName, P.UnitPrice, S.ContactName, S.Address
FROM Products AS P
    INNER JOIN Suppliers S
        ON P.SupplierID = S.SupplierID
--WHERE P.UnitPrice > 20.00 AND P.UnitPrice < 30.00
WHERE P.UnitPrice BETWEEN 20 AND 30

-- Wybierz nazwy produktow oraz inf. o stanie magazynu
-- dla produktow dostarczanych przez firme 'Tokyo Traders'
SELECT P.ProductName, P.UnitsInStock, S.CompanyName
FROM Products AS P
    INNER JOIN Suppliers S
        ON P.SupplierID = S.SupplierID
WHERE S.CompanyName = 'Tokyo Traders'

-- Czy sa jacys klienci, ktorzy nie zlozyli zadnego zamowienia w 1997 roku,
-- jesli tak, to pokaz ich dane adresowe
SELECT C.CompanyName, O.OrderDate, C.ContactName, C.Address
FROM Customers AS C
    LEFT OUTER JOIN Orders O
        ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) <> 1997

-- Wybierz nazwy i numery telefonow dostawcow, dostarczajacych produkty,
-- ktorych aktualnie nie ma w magazynie
SELECT S.CompanyName, S.Phone, P.UnitsInStock
FROM Suppliers AS S
    INNER JOIN Products P
        ON S.SupplierID = P.SupplierID
WHERE P.UnitsInStock = 0

-- Napisz polecenie wyswietlajace CROSS JOIN miedzy shippers i suppliers,
-- uzyteczne dla listowania wszystkich mozliwych sposobow
-- w jaki dostawcy moga dostarczac swoje produkty
SELECT Suppliers.CompanyName, Shippers.CompanyName
FROM Suppliers
    CROSS JOIN Shippers

-- Napisz polecenie zwracajace liste produktow zamawianych w dniu 1996-07-08
SELECT P.ProductName, OrderDate
FROM Products P
    INNER JOIN [Order Details] OD
        ON P.ProductID = OD.ProductID
    INNER JOIN Orders O
        ON OD.OrderID = O.OrderID
WHERE OrderDate = '1996-07-08'

-- 30-join.pdf 23/32