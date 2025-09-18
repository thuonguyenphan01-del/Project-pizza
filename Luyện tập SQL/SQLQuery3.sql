-- Function (Table Function)
CREATE FUNCTION Taobangfunction()
RETURNS TABLE
AS 
RETURN(
SELECT c.CustomerID,c.Country,o.OrderID,o.ShipCountry,o.RequiredDate
FROM Customers c
Join Orders o
on o.CustomerID = c.CustomerID);

CREATE FUNCTION BangFunction2()
RETURNS @BANG TABLE
(
	OrderID INT,
	CustomerID NCHAR(5),
	Freight Money
)
AS
BEGIN
	INSERT INTO @BANG
	SELECT o.OrderID, c.CustomerID,o.Freight
	FROM Orders o
	JOIN Customers c
	ON c.CustomerID=o.CustomerID;
	RETURN;
END;
--Function trả về mảng Scalar Function
CREATE FUNCTION MANG( @Freight INT)
RETURNS INT
AS 
BEGIN
	DECLARE @OrderID INT;
	SELECT @OrderID = count(o.OrderID)
	FROM Orders o
	WHERE o.Freight > @Freight;
	RETURN @OrderID;
END;
DROP FUNCTION MANG
SELECT dbo.MANG(20) as Orders;
-- Câu lệnh casewhen
SELECT c.CustomerID,c.CompanyName,c.Phone,c.Country,
	CASE
		WHEN c.ContactTitle = 'Owner' THEN N'Chủ doanh nghiệp'
		WHEN C.ContactTitle LIKE '%Sales%' THEN N'Nhân viên Sales'
		WHEN C.ContactTitle IS NULL THEN N'Không có thông tin'
		ELSE N'Nhân viên khác'
	END  AS "Vị trí"
FROM Customers c;
SELECT * FROM Employees
SELECT e.EmployeeID,e.FirstName,e.LastName,
	CASE 
		WHEN e.TitleOfCourtesy LIKE 'Ms.' OR e.Title LIKE  'Mrs.' THEN 'Female'
		WHEN e.TitleOfCourtesy LIKE 'Mr.' THEN 'Male'
		ElSE 'Unknow'
	END AS "Sex"
FROM Employees e