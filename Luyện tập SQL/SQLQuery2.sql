-- Truy vấn dữ liệu từ nhiều table
-- Lấy ra thể loại, tên thể lạo và sản phẩm
Select p.CategoryID, c.CategoryID, c.CategoryName, p.ProductName
From [dbo].[Products] as p, [dbo].[Categories]as c
where p.CategoryID = c.CategoryID;
Select o.EmployeeID,e.FirstName,e.LastName,count(o.OrderID) as "Total"
from[dbo].[Orders] as o, [dbo].[Employees] as e
where o.EmployeeID = e.EmployeeID
Group by o.EmployeeID,e.EmployeeID, e.FirstName, e.LastName;
Select c.CustomerID, c.CompanyName,c.ContactName, Count(o.OrderID) as "Total"
from [dbo].[Customers] as c, [dbo].[Orders] as o
where c.CustomerID = o.CustomerID
Group by c.CustomerID, c.CompanyName, c.ContactName ;
-- Sub query đặt trong cặp ngoặc tròn điều kiên nhỏ trong ngoặc
select ProductID, Productname, UnitPrice from dbo.Products;
Select Avg(UnitPrice) from dbo.Products;
-- Lọc nhừng sản phẩm lớn hơn giá trung bình
select ProductID, Productname, UnitPrice from dbo.Products
where UnitPrice >(Select Avg(UnitPrice) from dbo.Products);
Select c.CustomerID, c.CompanyName, Count(o.OrderID) as "Total"
From [dbo].[Customers] as c
Left join [dbo].[Orders] as o
on c.CustomerID = o.CustomerID
Group by c.CustomerID, c.CompanyName
Having  Count(o.OrderID)=0;
-- Sub query
Select distinct c.*
from [dbo].[Orders] as o
Right Join dbo.Customers as c
on c.CustomerID = o.CustomerID
where c.CustomerID in (Select CustomerID from dbo.Orders group by CustomerId having Count(OrderId)=10);
Select ContactName,[CompanyName], City
From [dbo].[Customers]
Where [CompanyName] Like ('a%');
Select c.CustomerID,c.ContactName,c.CompanyName,c.Phone,o.[ShippedDate],Sum(o.Freight) as "Tổng tiền"
from [dbo].[Customers] as c
Join [dbo].[Orders] as o
on c.CustomerID = o.CustomerID
where Year(o.ShippedDate) ='1998' and [ShipCountry] In ('Germany')
Group by c.CustomerID,c.ContactName,c.CompanyName,c.Phone,o.ShippedDate
Having Sum(o.Freight) >100
Order by Sum(o.Freight) ASC;
select c.CustomerID,c.PostalCode,o.OrderDate,sum(o.Freight) as "Tong"
from [dbo].[Customers] as c
join[dbo].[Orders] as o
on c.CustomerID = o.CustomerID
where year(o.OrderDate) ='1998'
Group by c.CustomerID,c.PostalCode,o.OrderDate
Having sum(o.Freight)  >100
Order by o.OrderDate;
select Top 10 [Type_1],AVG([HP]) as HPT,AVG([Attack])as AvU,AvG([Defense])
from [dbo].[pokemon]
Group by [Type_1]

-- Common table expression (CTE)
with ShortE as (
Select EmployeeID, FirstName, LastName from [dbo].[Employees]
)
Select * from ShortE;
with ProductCategory as (select CategoryID from Products where ProductName ='Chai') 
Select p.CategoryID,p.ProductName
from [dbo].[Products] as p
Join ProductCategory as t
ON t.CategoryID =p.CategoryID;
-- Lấy thông tin order
-- Tính tổng đơn hàng đơn hàng*Tiền/hàng
--Tính tỉ lệ tổng và Freight
with Ordertotal as (Select OrderID, Sum([Quantity] *[UnitPrice]) as "Tổng" from [dbo].[Order Details] as od Group by OrderId)
select o.OrderID,o.OrderDate,o.Freight, ot.Tổng,ot.Tổng/o.Freight as "Ratio"
from [dbo].[Orders] as o
Join Ordertotal as ot 
on ot.OrderID =o.OrderID;
With ctm as( select EmployeeID,Lastname, firstName from [dbo].[Employees] as e)
Select o.EmployeeID,s.FirstName,s.LastName,o.OrderID,o.Freight
from [dbo].[Orders] as o
Join ctm as s
on o.EmployeeID = s.EmployeeID;
with ctc as (select ProductID,SUM(Quantity) as "sl", Sum(UnitPrice*Quantity) as "tổng" from [dbo].[Order Details] group by ProductID)
select p.ProductID,p.ProductName,c.tổng,p.UnitPrice, c.sl
from[dbo].[Products] as p
Join ctc as c
on c.ProductID = p.ProductID
Group by p.ProductID,p.ProductName,c.tổng,p.UnitPrice, c.sl
having c.sl>500
order by p.ProductID asc;
-- Truy vấn đệ quy Mô tả: giống như menu, 1 chủ đề sẽ có nhiều chủ đề nhỏ 1 chủ đề nhỏ sẽ có nhiều chủ đề nhỏ hơn
with bbc as (select [OrderID],[ShippedDate] from [dbo].[Orders])
select od.OrderID,b.ShippedDate,sum(Quantity) AS "tổng",od.UnitPrice
from [dbo].[Order Details] as od
join bbc as b
on b.OrderID = od.OrderID
Group by OD.OrderID,b.ShippedDate,od.UnitPrice;
--Windown Function
-- Sử dụng để xếp hạng Rank, hoặc Tính tổng sum avg count trên 1 cửa sổ, hoặc trẳ về kết quả cho mỗi dòng mà không thay đổi kích thước kết quả vd: First_value, Lag, Lead
-- Xếp hạng sản phẩm theo gí tăng dần
select
p.ProductID, p.ProductName,p.UnitPrice,
Rank () over (order by p.Unitprice DESC) as Ranking
from[dbo].[Products] as p;
-- Sau select cột phải có dáu phấy rồi mới tới Rank
-- Chia nhỏ các vùng catogoryID và sắp xếp thứ hạng theo UnitPrice trong categoryID đó
Select
p.ProductID, p.ProductName,p.UnitPrice,p.CategoryID,
Rank () over (Partition by CategoryID order by p.Unitprice DESC) as Ranking
from[dbo].[Products] as p;
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT);
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);
    select s.ma_lop_hoc, s.ma_sinh_vien, s.ho_ten, s.diem_trung_binh,
    Rank() Over (Partition by s.ma_lop_hoc order by diem_trung_binh DESC) as Ranking
    from [dbo].[sinh_vien] as s
-- Windown funtion giúp làm việc trên từng cửa sổ, từng bảng
-- Dùng hàm Lag để lấy thông tin đơn dặt hàng
-- Trả về lần đặt trước đó là ngày bao nhiêu
--Dense_Rank trả về các thứ hạng bằng nhau ở giá trị
Select o.CustomerID, o.OrderDate,[RequiredDate],
Lag(OrderDate) over( Partition by CustomerID order by OrderDate ASC) as "Prev"
from [dbo].[Orders] as o;
-- Kiểu câu lệnh DMl
-- Update cập nhật bảng
-- Insert into chèn vào bảng
-- delete xóa dữ liệu
-- select trích xuất dữ liệu
--Các lệnh DDL bao gồm:
--Lệnh CREATE: Tạo một bảng, một View của bảng, hoặc đối tượng khác trong Database. +Index cho 1 cột +Constant tạo liên kêt 
--Lệnh ALTER: Sửa đổi một đối tượng Database đang tồn tại, ví dụ như một bảng.
--Lệnh RENAME: Đổi tên một đối tượng trong Database
-- Lệnh TRUNCATE: Xóa tất cả các bản ghi của một Table
--Lệnh DROP: Xóa toàn bộ một bảng, một View của bảng hoặc đối tượng khác trong một Database.  + index cho 1 cột +Constant xóa liên kêt 
-- DCL grant trao quyền sử dụng cho người dùng, revoke thu hồi
Create Table [nhan vien](
Ma_NV INT NOT NULL PRIMARY KEY,
Ho_Ten varchar(50) NOT NULL,
Phai VARCHAR(10),
NgaySinh DATE,
DiaChi VARCHAR(255),
SDT VARCHAR(10));
Alter table [nhan vien]
Add Email VARCHAR(100);
Alter table [nhan vien]
Alter column Email VARCHAR(150);
--Drop column xóa cột
-- constraint thêm ràng buộc UNIQUE hay Primary key
ALTER TABLE [dbo].[nhan vien]
ADD CONSTRAINT NgaySinhCheck CHECK (NgaySinh < GETDATE());
-- dùng insert into để thêm dữ liệu
INSERT INTO [dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
VALUES ('KH123', 'TITV.VN', 'Le Nhat Tung', '0123456789');
-- tạo bảng mới với điều kiện
SELECT *
INTO HighValueProducts
FROM Products
WHERE [UnitPrice]>50;
-- Khi phân tích dữ liệu cần phần loại đúng TINT mẫu 255, INT mẫu mấy tỉ đó không nhớ, thời gian cụ thể giờ phút,char chuổi cố định, varchar chuỗi có độ dài khác nhau
SELECT *
INTO Customers_1
FROM Customers;
delete from [dbo].[Customers_1] where CustomerID like 'ALFKI';
EXEC sp_rename '[Customers_1].Fax', 'fax', 'COLUMN';--Đổi tên cột

-- Câu lệnh update Update tablename set column = value 1, column=value 2.. where condition
SELECT *
INTO [dbo].[Products_1]
FROM [dbo].[Products]; 
UPDATE [dbo].[Products_1]
SET [ProductName]='Máy tính xách tay mới', [UnitPrice]=999.99
WHERE [ProductID]=7;
UPDATE [dbo].[Products_1]
SET  [UnitPrice]=[UnitPrice]*1.1;--Update toàn bộ sản phẩm
-- index cấu trúc để truy cập dự liệu nhanh nhất
-- Truy soát thông thường theo từng dòng
-- index giống như mục lục nơi mà có sẵn bảng đồ và khoanh vùng
with Ordertotal as (Select OrderID, Sum([Quantity] *[UnitPrice]) as "Tổng" from [dbo].[Order Details] as od Group by OrderId)
select o.OrderID,o.OrderDate,o.Freight, ot.Tổng,ot.Tổng/o.Freight as "Ratio"
Into [dbo].[o1]
from [dbo].[Orders] as o
Join Ordertotal as ot 
on ot.OrderID =o.OrderID
--Tạo Index tìm kiếm dữ liệu theo dạng cây dữ liuee vd: tím số 2 2<100 =>Tìm trong khoảng 100, 2<50 Tìm trong khoảng 50, 2<25 tìm trong khoảng 25...
-- create Index idx_CústomerID
-- On dbo.xxx (CustomerID);
-- Lưu ý với dữ liệu nhỏ không nên dùng index
-- View trong database:Trình bày theo mong muốn của ta truy cập mục view sau khi chạy code
-- cú pháp 
--create [or alter] View [scheme_name] view name [ column1,2..]
--[with <view attrirude> [,...n]
-- as selec_ statement
--[with check option];
create view monthlysale as
SELECT 
  YEAR([OrderDate]) as "Năm",
  MONTH([OrderDate]) as "Tháng",
  COUNT([OrderID]) as "Số lượng đơn hàng"
FROM
  [dbo].[Orders]
GROUP BY YEAR([OrderDate]), MONTH([OrderDate]);
Drop view monthlysale;
---with check optiion để insert hoặc add
Create view kh_hang as
select
p.CategoryID,Count(p.ProductID) as "sl"
from [dbo].[Products] p
Group by P.CategoryID;
--T-SQL ngôn ngữ truy vấn mở rộng
-- sql nguyên bản chỉ có những lệnh cơ bản 
-- T-sql là những cú pháp bổ sung thêm chỉ có ở sql server Error handing (sửa lỗi), Trigger, khai báo biến
-- Khai báo biến 
Declare @CustomerName Nvarchar(50)
declare @Ordertatle Money
--Găn giá trị vào biến
Set @CustomerName ='John Doe';
-- sử dụng biến trong store Procedure
CREATE PROCEDURE GetProductByName
	@ProductName NVARCHAR(100)
AS
BEGIN
	SELECT * FROM [dbo].[Products] P
	WHERE P.ProductName = @ProductName
END;
EXEC GetProductByName @ProductName='Chai';
EXEC GetProductByName @ProductName='Chang';
EXEC GetProductByName @ProductName='Ikura';
-- Chèn dữ liệu mới vào bảng
Create Procedure D1customer
@CustomerID NVARCHAR(5),
@CompanyName Nvarchar(48),
@ContactName Nvarchar (30),
@ContactTitle Nvarchar(30)
as
begin
Insert into [dbo].[Customers] ([CustomerID],[CompanyName],[ContactName],[ContactTitle])
Values (@CustomerID,Upper(@CompanyName),@ContactName,@ContactTitle)
End
EXEC D1customer @CustomerID='NE11N', @CompanyName='titv.vn', @ContactName='Tung Le',@ContactTitle='Mr.'
 ;--xóa 1 thủ tục đã tồn tại
-- Update giá hàng thoe customerID và số tiền tăng
Create Procedure DProduct
@ProductID int,
@Unitpriceincrease Decimal(10,2) --decimal số thực
as
begin
Update [dbo].[Products]
set 
UnitPrice = UnitPrice + @Unitpriceincrease
where [ProductID] = @ProductID
END;
EXEC DProduct @ProductId=1,@Unitpriceincrease=100;--Lệnh EXEC được dùng để thực thi một thủ tục được lưu trữ hoặc một chuỗi SQL được truyền vào thủ tục đó.
EXEC DProduct @ProductId=2,@Unitpriceincrease=2;
drop Procedure DProduct;
Create Procedure ECustomer
@CustomerID Nvarchar(50),
@CompanyNamePlus Nvarchar(100)
as
begin 
Update [dbo].[Customers]
set
CompanyName = CONCAT(CompanyName,@CompanyNamePlus)
where CustomerID = @CustomerID
End;
Drop Procedure ECustomer;
EXEC ECustomer @CustomerID='ALFKI', @CompanyNamePlus =U;
--KHuyết điểm của store proceduce  chỉ nên sử dụng lặp đi laqpj lại0
-- viết procedure cập nhật hàng tồn kho
Create Procedure CAPNHAT
@ProductID int,
@UnitInStock smallint
as
begin 
Update[dbo].[Products]
set 
[UnitsInStock] = @UnitInStock
where [ProductID] =@ProductID
End;
EXEC CAPNHAT @ProductID = 2, @UnitinStock = 567;
--Trigger trong database các thủ tục như store Procedure nhưng khi có điều kiện xảy ra
--BEFORE | AFTER | INSTEAD OF: Xác định thời điểm mà Trigger sẽ kích hoạt trước hoặc sau khi sự kiện xảy ra.
CREATE TRIGGER MakeProductNameUpperCase
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	FROM inserted i -- Dòng vừa thêm vào dòng thứ i
	WHERE Products.ProductID = i.ProductID
END

INSERT [dbo].[Products]([ProductName], [SupplierID], [CategoryID])
VALUES ('test name', 1, 1)
--Tạo trigger sau khi thêm cột mới vào thì sẽ chủ động tăng leen 1 giá trị ở Uniprice nếu Unitprice thêm vào lớn hơm 100
CREATE TRIGGER Themdulieu
ON [dbo].[Products_1]
After insert
AS
BEGIN
	UPDATE Products_1
	SET [UnitPrice] = [UnitPrice] + 1
	FROM [dbo].[Products_1]
	WHERE [UnitPrice] >100
END
Drop Trigger Themdulieu -- Loại bỏ trigger
SET IDENTITY_INSERT [dbo].[Products_1] ON
Insert [dbo].[Products_1]([ProductID],[ProductName],[UnitPrice],[Discontinued])
VALUES (78,'nho',101,1);
Create Trigger hoa
on [dbo].[pokemon]
After insert
As
Begin
update [dbo].[pokemon]
set [Type_1] = CONCAT([Type_1],'H')
from[dbo].[pokemon]
where [HP]>100
end
--câu điều kiện if else
--if điều kiện Print lệnh in else thì ...
--begin các lệnh số lệnh không giới 
Begin Transaction --Bắt đầu ghi lệnh
Update [dbo].[Products_1]
set [UnitPrice] =[UnitPrice]*1.1 
where [UnitPrice] <90
Save Transaction;--Lưu điểm thay đổi
COMMIT TRANSACTION;--Hoàn tất lưu giữ
RollBack Transaction;--Quay lại trước khi thực hiện lệnh
-- một số hàm hay: Daydiff thời gian giữa 2 ngày
select [OrderID],[RequiredDate],[ShippedDate], DATEDIFF(DAY,[ShippedDate],[RequiredDate]) as "chenh"
from [dbo].[Orders]
Print Sysdatetime();--Trả về ngày của hệ thống
Select p.CategoryID, Count([ProductID]) as "sl", Sum([UnitPrice]) as "tổng"
from[dbo].[Products] as p
Group by p.CategoryID
--Tạo CTE