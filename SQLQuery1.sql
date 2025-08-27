-- Viết câu lệnh sql lấy tên tất cả sản phẩm
Select [ProductName] from [dbo].[Products];
-- Tên sản phẩm, giá bán mỗi đơn vị, số lượng sản phẩm mỗi đơn vị
Select [ProductName], [UnitPrice], [QuantityPerUnit] from [dbo].[Products];
Select [CompanyName], [Country] from [dbo].[Customers];
Select * from [dbo].[Products];
-- Chọn thành phần không trùng nhau
Select distinct PostalCode from Suppliers;
Select distinct [BirthDate] from [dbo].[Employees];
-- Chọn số lượng thành phần mong muốn
Select top 5 * from [dbo].[Customers];
Select top 20 percent * from [dbo].[Employees];
Select distinct top 5 [CustomerID] from [dbo].[Orders];
Select distinct top 40 percent [CategoryID] from [dbo].[Products];
-- Đặt biệt danh dùng as
Select [CompanyName] as "Tên công ty" , [PostalCode] as "Mã bưu điện" from [dbo].[Customers];
Select [LastName] as "Họ" from [dbo].[Employees];
Select top 15 [o].* from [dbo].[Orders] as "o";
Select [LastName] from [dbo].[Employees];
-- Tính toán giá trị Min, Max, AVG
Select Min([UnitPrice]) as [MinPrice] from [dbo].[Products];
Select AVG([UnitPrice]) from [dbo].[Products];
Select avg([UnitPrice]) as [AVGPrice], Sum([UnitPrice]) as [SumPrice] from [dbo].[Products];
SELECT AVG([Quantity]) as [CL] from [dbo].[Order Details];
-- SELECT Chọn gì->FROM từ bảng nào ->ORDER BY theo cột nào ASC(tăng dần mặc định)|DESC(Giamr dần)
SELECT *
FROM [dbo].[Suppliers]
ORDER BY [CompanyName] ASC;
SELECT * FROM [dbo].[Products] ORDER BY [UnitPrice] ASC;
SELECT * FROM [Dbo].[Orders] ORDER BY  [ShipCity] ASC;
-- Các phép tính toán +,-,*,/, % (Chia lấy số dư)
SELECT [ProductID], [ProductName], ([UnitsInStock]-[UnitsOnOrder]) as "Tồn kho" from [dbo].[Products];
SELECT *, ([UnitPrice]*[Quantity]) AS "Thành tiền" from [dbo].[Order Details];
-- Where mệnh đề điều kiện 
SELECT * from [dbo].[Employees] where [City] ='London' order by [LastName] ASC;
SELECT Count(*) as "Giao chậm"  from [dbo].[Orders] where [ShippedDate] >[RequiredDate] ;
Select Count(*) from [dbo].[Order Details] where [Discount] > 0.1;
-- Not - Phủ định, AND, OR
select * from [dbo].[Products] where [UnitsInStock] <100 or UnitsInStock >50;
-- Từ khóa Between Giua 2 gia tri Select from where collum between giá trị 1 and giá trị 2
select * from dbo.Products where UnitPrice between 20 and 50;
Select top 2 * from dbo.Products where UnitPrice between 20 and 30;
Select * from [dbo].[Customers] where [ContactName] between 'A' and 'C';
Select distinct ContactName from [dbo].[Customers] where [ContactName] between 'A' and 'C';
Select SUM(UnitPrice) as "Tổng" from dbo.Products where UnitPrice between 20 and 50;
--Toán tử Like: Select from where Like (% đại diện cho 1, 0, hoặc nhiều ký tự, _ đại diện cho 1 ký tự)
select * from dbo.Customers where Country like 'A%';
select * from dbo.Orders where ShipCity like '%A%';-- Có xuất hiện chữ A
select * from dbo.Orders where ShipCity like 'A%';
select * from dbo.Orders where ShipCity like 'A_____';--Bắt đầu bằng chữ A có 6 ký tự
-- Ký tự đại diện % Đại diện cho 0,1,hoặc bất kỳ ký tự nào, _ đại diện cho 1 ký tự, [] h[oa]t tìm các ký tự chứa o,a; h[^oa]t tìm các chữ không o và a; - dải ký tự từ x-y
select * from dbo.Customers where ContactName like '[a-c]%';
select * from dbo.Customers where ContactName like '[ad]%';
select * from dbo.Customers where ContactName like '[^a]%';
select * from dbo.Customers where ContactName like '[a]_%';
select Count([City]) as "Thành phố" from dbo.Customers where ContactName like '[a-c]%';
select * from dbo.Customers where ContactName like '[a][^n]%';
select * from dbo.Customers where ContactName like '[a][n]%';
-- Sư dụng từ khóa IN giá trị muốn lọc thay cho OR
select * from [dbo].[Orders] where [ShipCountry] In ('germany','UK');
Select * from dbo.Orders where ShipCountry Not In ('Germany');--Phủ định, không nằm trong Germany
select * from [dbo].[Employees] where [TitleOfCourtesy] In ('Ms.','Mrs.');
-- IS NULL không tồn tại - Is Not null có tồn tai
Select Count(*) as "Chưa được giao" from dbo.Orders where [ShippedDate] is NULL;
Select * from dbo.Customers where Region is not null;
Select CustomerId from dbo.Customers where Region is not null;
Select CustomerId from dbo.Customers where Region is not null and  CustomerID like 'H%' ;
-- Grop by nhóm dữ liệu theo nhiều trường
Select CustomerID, Count(OrderID) as "Total" from [dbo].[Orders] group by  [customerID] ;
Select SupplierID, AVG(UnitPrice) as "trung bình" from [dbo].[Products] group by SupplierID; 
Select ProductName, MAX(UnitPrice) as "Tổng" from dbo.Products group by ProductName;
Select ProductName,CategoryID, SUM(UnitPrice) as "Tổng" from dbo.Products group by ProductName, CategoryID Order by ProductName ASC;
-- Hàm thời gian DAY,YEAR,MONTH
Select CustomerID, Year([RequiredDate]) as "Year" from [dbo].[Orders] where Year([RequiredDate]) = 1997 
group by CustomerID, Year([RequiredDate]);
Select * from [dbo].[Orders] where Year([ShippedDate]) = 1997 AND Month([ShippedDate])= 10;
Select CustomerID, Month([OrderDate]) as "Tháng", Count(*) as "Số lượng đăt hàng" from [dbo].[Orders] where Year([OrderDate]) = 1998 Group by CustomerID, Month([OrderDate])
Order by Month([OrderDate]);
Select * from [dbo].[Orders] where Month([ShippedDate])=5 and Year([ShippedDate])=1998 Order by CustomerID ASC;
Select * from [dbo].[Orders] where [ShippedDate] Between '1998-05-01' and '2000-05-01' Order by CustomerID ASC;
Select CustomerID, ShippedDate from [dbo].[Orders] where [ShippedDate] Between '1997-05-01' and '1998-05-01' Group By CustomerID, ShippedDate Order by CustomerID ASC;
Select CustomerID, ShippedDate from [dbo].[Orders] where Year([ShippedDate])=1997 Group by CustomerID, ShippedDate order by CustomerID ASC;
-- Sử dụng mệnh hàm Having dùng cho cột đã group by, Where không sử dụng được khi đã dùng hàm sum,count....
Select CustomerID, Count([orderID]) as "Tổng đơn" from dbo.Orders Group by CustomerID Having Count([OrderID]) >20 Order by Count([OrderID]) DESC;
Select SupplierID, SUM([UnitsInStock]) as "Tổng kho", AVG([UnitPrice]) as "trung bình giá" from [dbo].[Products] Group by SupplierID Having SUM([UnitsInStock])>30 and AVG([UnitPrice])<50 ;
Select Sum([Freight]), Month([ShippedDate]) from [dbo].[Orders] where [ShippedDate] between '1996-07-01' and '1996-12-31' group by Month([ShippedDate]) order by Month([ShippedDate]) DESC;
Select Sum(Freight), Month(ShippedDate) from dbo.Orders where[ShippedDate] between '1996-07-01' and '1996-12-31'group by Month([ShippedDate]) Having Sum(Freight)>1500 order by Month([ShippedDate]) DESC;
-- Ôn tập
Select CustomerID, Count(OrderID) as "Total" from dbo.Orders Group by CustomerID Having Count(OrderID)>20 Order by Count(OrderID) ASC;
select [ShipCity], Sum([Freight]) as "Tổng tiền" from [dbo].[Orders] where [ShipCity]like 'a%' Group by ShipCity Having Sum([Freight])>1000;
Select top 2 CustomerID, ShipCity from [dbo].[Orders] where [ShipCity]like 'a%' Group by CustomerID, ShipCity;
Select CustomerID, ShipCity, Count(OrderID) from dbo.Orders group by CustomerId, ShipCity having Count(OrderId)>20 order by Count(orderID) DESC;
-- Kết nối các bảng tính qua where
Select c.CustomerID,c.ContactName,c.Phone,o.ShippedDate,o.RequiredDate, Sum(o.Freight) from dbo.orders as o, dbo.Customers as c 
where c.CustomerID = o.CustomerID and Year(Shippeddate) = 1998 group by c.CustomerID,c.Phone, c.ContactName, o.RequiredDate, o.ShippedDate having Sum(o.Freight)>100 
order by Sum(o.Freight) DESC;
Select p.SupplierID, p.CompanyName, count(r.ProductID) as "Số lượng"
from [dbo].[Suppliers] as p,[dbo].[Products] as r
where p.SupplierID = r.SupplierID
group by p.SupplierID, p.CompanyName
Order by count(r.ProductID) ASC;
Select  c.CategoryID, c.CategoryName, p.ProductName,p.UnitPrice,p.QuantityPerUnit --Sum()
from dbo.Categories as c, [dbo].[Products] as p
where c.CategoryID = p.CategoryID and c.CategoryName ='Seafood' and P.UnitPrice >20
group by  c.CategoryID, c.CategoryName, p.ProductName,p.UnitPrice,p.QuantityPerUnit
order by p.UnitPrice DESC;
--Union và Union all kết hợp các dữ liệu đã tính toán
Select OrderID,Od.UnitPrice
from [dbo].[Order Details] as Od
where  Od.UnitPrice between 100 and 200;
Select od.OrderID
from [dbo].[Order Details] as Od
where od.Quantity In (10,20);
Select Od.OrderID
from [dbo].[Order Details] as Od
where  Od.UnitPrice between 100 and 200 and od.Quantity In (10,20);
Select distinct Od.OrderID
from [dbo].[Order Details] as Od
where  Od.UnitPrice between 100 and 200 or od.Quantity In (10,20);
Select Od.OrderID
from [dbo].[Order Details] as Od
where  Od.UnitPrice between 100 and 200 or od.Quantity In (10,20);
-- Union để rút gọn các câu điều kiện tương tự nhau Thảo mãn 1 trong 2 điều kiện Phần giao nhau giữa 2 điều kiện (thỏa mãn cả 2 điều kiện) bị đếm 2 lần - loại bỏ 1 lần
-- distinct Không được lặp lại - Union 
-- Union all cho phép lặp lại
Select OrderID
from [dbo].[Order Details] as Od
where  Od.UnitPrice between 100 and 200
Union 
Select od.OrderID
from [dbo].[Order Details] as Od
where od.Quantity In (10,20);
--câu truy vấn Join, left join, right join, full join, Inner Join
-- Join trả về dữ liệu trùng nhau, ý nghĩa gần giống như truy vấn dữ liệu từ nhiều table
select c.CategoryID, c.CategoryName,p.ProductID,p.ProductName
from [dbo].[Categories] as c
inner join [dbo].[Products] as p
on c.CategoryID = p.CategoryID;
select c.CategoryID, c.CategoryName,Sum(p.ProductID)
from [dbo].[Categories] as c
inner join [dbo].[Products] as p
on c.CategoryID = p.CategoryID
Group by  c.CategoryID, c.CategoryName
Order by Sum(p.ProductID) DESC;
-- câu lệnh left join trả lại giá trị chung của 2 bảng và giá trị từ bảng bên phải
select c.CategoryID, c.CategoryName,Count(p.ProductName)
from [dbo].[Categories] as c
Left join [dbo].[Products] as p
on c.CategoryID = p.CategoryID
Group by  c.CategoryID, c.CategoryName
Order by Count(p.ProductName) DESC;
--Asian food và vietnamese food không có trong bảng Products
-- Right join trả lại giá trị chung của 2 bảng và giá trị bảng bên trái (Sau từ right join) - bảng customer có Company name mà Orders không có
select o.OrderID, c.CompanyName
from [dbo].[Orders] as o
Right join [dbo].[Customers] as c
on o.CustomerID = c.CustomerID;
-- Full join tất cả các giá trị trùng nhau và không trùng nhau của cả hai bên sẽ hiện lên
select o.OrderID, c.CompanyName
from [dbo].[Orders] as o
Full join [dbo].[Customers] as c
on o.CustomerID = c.CustomerID;
--Thứ tự viết select where from Join-on Group-by Having Order-by
-- In ('Germany') ở trong Đức hoặc thêm not để phủ định
-- where Year(ShippedDate) = "1998" điều kiện
-- Like tên cột ('a%'), % tất cả các ký tự, 1 hoặc 0h hoặc vô số ký tự, _ 1 ký tự, [] chứa ký tự trong ngoặc, [^} không chứa ký tự trong ngoặc
-- Union ghép các lệnh truy vấn với các giá trị không trùng lặp



