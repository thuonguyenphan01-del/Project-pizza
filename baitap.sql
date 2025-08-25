-- Tính tổng revenue: Tổng tiền các đơn giá 
--Check dữ liệu null
select *
from [dbo].[pizza_sales]
where [total_price] is null;-- Không có dữ liệu null
Select * from [dbo].[pizza_sales]
select sum([total_price]) as "Total revenue"
from [dbo].[pizza_sales] as p;
-- Tính trung bình giá mỗi đơn hàng 
select sum(p.total_price)/Count(distinct([order_id])) as "AVG total price"
from [dbo].[pizza_sales] as p
-- Tổng số pizza được bán
select sum(p.quantity) as "Total pizzas sold"
from [dbo].[pizza_sales] p
-- Tổng số đơn hàng được bán
select count(distinct([order_id])) as "Total orders"
from [dbo].[pizza_sales] p
-- Tính trung bình số pizza bán trên mỗi đơn hàng
select Round(cast(sum(p.quantity) as decimal (10,2))/ cast(count(distinct([order_id])) as decimal(10,2)),2) as "AVG pizza per order"
from [dbo].[pizza_sales] p
-- Tạo danh sách tổng đơn hàng theo  ngày trong tuần
select DATENAME(DW, [order_date]) as "Datename", sum(distinct([order_id])) as Total_order
from [dbo].[pizza_sales]
group by DATENAME(DW, [order_date])
order by Total_order;
-- Tương tự cho tháng 
select Datename(month,[order_date]) as "Datename Month",sum(distinct([order_id])) as Total_order
from [dbo].[pizza_sales]
group by Datename(month,[order_date]); 
-- sắp xếp thứ tự loại pizza bán nhiều nhất
select [pizza_name_id],[pizza_name], sum([quantity]) as "Tổng", dense_rank() over(order by sum([quantity]) DESC) as "Xếp hạng"
from [dbo].[pizza_sales] 
group by [pizza_name_id],[pizza_name]
-- sắp xếp thứ tự số lượng các loại pizza đã bán trong tháng 2
select [pizza_name_id],[pizza_name], sum([quantity]) as "Tổng", dense_rank() over(order by sum([quantity]) DESC) as "Xếp hạng"
from [dbo].[pizza_sales] 
where month([order_date])='2'
group by [pizza_name_id],[pizza_name];
-- xếp hạng top 5 các loại pizza bán trong từng tháng
With b as (select [pizza_name],month([order_date]) as monthtotal, sum([quantity]) as selltotal from [dbo].[pizza_sales] group by [pizza_name],month([order_date])),
a as
(select b.pizza_name, b.monthtotal,b.selltotal,DENSE_RANK() over (partition by b.monthtotal order by b.selltotal DESC) as Rankx from b)
select a.pizza_name,a.monthtotal,a.selltotal,a.Rankx
from a
where a.Rankx <=5;
--% top 5 các kích thước pizza bán ra
Select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal (10,2)) as "PCT%"
from [dbo].[pizza_sales]
GROUP BY pizza_size
order by pizza_size
-- chọn ra top 5 loại pizza có( doanh số nhiều nhất
select top 5 [pizza_name], sum([total_price]) as Total_Revenue
from [dbo].[pizza_sales]
group by [pizza_name]
order by sum([total_price]);
--top 5 pizza doanh thu thấp nhất
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
-- các thể loại pizza theo doanh thu tháng 2 
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
-- top 5 pizza theo số lượng
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
-- Chọn các đơn hàng có mã bắt đầu C
select *
from pizza_sales 
where pizza_category like 'C%'
-- chọn các đơn hàng trong nguyên liệu có Sliced Ham
select *
from pizza_sales 
where pizza_ingredients like '%Sliced Ham%'
--Tìm các đơn hàng được đặt vào buổi tối từ 18:00 đến 23:00
select *
from pizza_sales 
where [order_time] between '18:00:00' And '23:00:00'
-- Tìm các đơn hàng có trên 3 nguyên liệu
with a as (select [pizza_name_id],[pizza_name],[pizza_ingredients],[pizza_category],(DATALENGTH([pizza_ingredients]) - DATALENGTH(REPLACE([pizza_ingredients], N',', N''))) / 2 as soluong
from pizza_sales )
select a.pizza_name_id,a.pizza_name,a.pizza_ingredients,a.soluong,a.pizza_category
from a
where a.soluong >2 
order by a.soluong;
-- Xếp hạng pizza có nhiều nguyên liệu nhất theo từng thể loại
with a as (select [pizza_name],[pizza_ingredients],[pizza_category],(DATALENGTH([pizza_ingredients]) - DATALENGTH(REPLACE([pizza_ingredients], N',', N''))) / 2 as soluong
from pizza_sales 
group by [pizza_name],[pizza_ingredients],[pizza_category])
select a.pizza_name,a.pizza_ingredients,a.pizza_category, DENSE_RANK() over (partition by a.pizza_category order by  a.soluong DESC) as Xephang
from a
where a.soluong >2;
--thêm cột datename vào bảng (các ngày thứ trong tuần)
alter table [dbo].[pizza_sales]
add Datenames varchar(50);
update [dbo].[pizza_sales]
Set [Datenames] = DATENAME(DW, [order_date]);
select * from [dbo].[pizza_sales];
alter table [dbo].[pizza_sales]
add SoNglieu smallint;
update [dbo].[pizza_sales]
Set SoNglieu = ((DATALENGTH([pizza_ingredients]) - DATALENGTH(REPLACE([pizza_ingredients], N',', N''))) / 2)+1
select *
from [dbo].[pizza_sales]
where [total_price] is null or [order_id] is null 






