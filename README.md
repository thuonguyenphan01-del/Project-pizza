# Project-pizza
Mô tả: Project báo cáo doanh thu và các sản phẩm bán chạy trong năm 2015 tại một cửa hàng pizza,

Describe: Revenue Report Project and Best-Selling Products in 2015 at a Pizza Store.
SQL: Clean data, Check NULL data and Duplicated Data, add columns, find Data Insights.
Power BI: Visualization Data

<img width="1365" height="783" alt="Dashboard Pizza_Project 1" src="https://github.com/user-attachments/assets/dd0364db-70c1-4e7c-ab59-8e53d6d63a99" />
Các chỉ số Tổng quan:
- Total Revenue: 817.86K
- Average Order Value (AOV): 38.31
- Total Pizzas Sold: 49.574K
- Total Orders: 21.35K
- Average Pizza per Order: 2.32.
=> Mỗi đơn hàng sẽ đặt từ 2 pizza trở lên.


Thời gian đơn được đặt hàng nhiều
- Daily Trend: số đơn cao nhất vào Thứ Sáu (~3.5K đơn), thấp nhất vào Chủ Nhật (~2.6K đơn).
- Monthly Trend: Tháng 7 đạt đỉnh 1935 đơn, thấp nhất là Tháng 2 (~1685 đơn).
=> Biết được xu hướng đặt hàng nên tập trung tung khuyến mãi hoặc marketing mạnh để tăng doanh thu.


Mặt hàng được ưa chuộng theo size và category
- Category: Classic Pizza đóng góp doanh thu và số lượng đơn cao nhất.
- Size: Cỡ L (Large) đóng góp nhiều nhất vào doanh thu. Size M và L chiếm hơn 70% tổng đơn.
  => Khách hàng có xu hướng đặt Pizza theo nhóm và không quá chú trọng các loại pizza phức tạp (Classic pizza được yêu thích nhất).
 => Classic Pizza (size L) là sản phẩm “best-seller”. Tăng số lượng các sản phẩm Classic Pizza và ưu tiên các bán pizza size L. Có thể tạo thêm nhiều loại pizza mới thuộc thể loại classic và marketing phù hợp.



Data Insight:
- According to the Dashboard, clearly we can indentify the peak sales periods is Firday and July. Recommend to boost the marketing program and Sales Deals program in those periods. it's opportunity to maximize revenue
- Pizza size L and M contribute more than 70% Total Order. This show that customers tend to order Pizza for groups. From the imforamtion about the peak period, in Friday people order Pizza a lot and the best seller is Pizza size L, we can predict that is the time people don't want to cook instead of that, they want fast meal with pizza (Normally, People work from Mon to Fri)
- Classic Pizza is frequently customers Priority choice for Pizza Category. Maybe it can tell us, people dont't really fond of Fancy or New ingredient Pizza. They just want the classic Pizza. Understand that, Company can focus on Classic Pizza with Classic Ingredients, and also can Create new Classic Pizza to promote the Sales Performance

  <img width="1372" height="791" alt="image" src="https://github.com/user-attachments/assets/5ee15775-6082-4f7f-82b9-2625219d9aba" />

Các sản phẩm Best seller.
- Theo Doanh thu: The Thai Chicken Pizza.
- Theo Số lượng bán: The Classic Deluxe Pizza.
- Theo Tổng đơn hàng: The Classic Deluxe Pizza.
  => Doanh thu cao nhất The Thai Chicken Pizza -> Gía cao hơn vốn đem lại lợi nhuận tốt.
  => Theo số lượng bán và số đơn hàng thì The Classic Deluxe Pizza đứng đầu -> Được yêu thích hơn.

Top 5 các sản phẩm được yêu thích:
- Theo Doanh thu: Thai Chicken, Barbecue Chicken, California Chicken, Classic Deluxe, Spicy Italian.
- Theo Số lượng: Classic Deluxe, Barbecue Chicken, Hawaiian, Pepperoni, Thai Chicken.
- Theo Tổng đơn: Classic Deluxe, Hawaiian, Pepperoni, Barbecue Chicken, Thai Chicken.
=> Chicken Pizza và Classic Deluxe luôn ổn định trong top ngoài ra Hawaiian và Barbecue Chicken cũng đạt kết quả tốt.
=> Đẩy mạnh các sản phẩm này nhằm nâng cao doanh thu và số lượng bán ra

Sản phẩm bán tệ nhất:
-The Brie Carre Pizza bán tệ nhất ở 3 hạng mục số lượng, đơn hàng và doanh thu.
=> Loại bỏ hoặc đưa ra chính sách marketing phù hợp hoặc cải tiến công thức.

Top 5 các sản phẩm bán tệ nhất:
- Theo Doanh thu: Spinach Pesto, Mediterranean, Spinach Supreme, Green Garden, Brie Carre.
- Theo Số lượng: Soppressata, Spinach Supreme, Calabrese, Mediterranean, Brie Carre.
- Theo Tổng đơn: Chicken Pesto, Calabrese, Spinach Supreme, Mediterranean, Brie Carre.
=>Nhóm pizza rau củ (Spinach, Mediterranean, Green Garden) thường nằm cuối bảng → có thể ít khách chuộng.

Kết luận:
- Giữ vững nhóm bán chạy: Thai Chicken, Classic Deluxe, Barbecue Chicken, Hawaiian, Pepperoni.
- Xem xét lại nhóm bán kém: Brie Carre, Spinach Supreme, Mediterranean, Calabrese.
- Có thể tăng marketing hoặc khuyến mãi cho nhóm yếu.
- Tập trung phát triển và upsell nhóm best sellers vì chúng đem lại cả doanh thu và số lượng ổn định.


Data Insights:

Best-Selling Products
- By Revenue: The Thai Chicken Pizza.
- By Quantity Sold: The Classic Deluxe Pizza.
- By Total Orders: The Classic Deluxe Pizza.
=> The Thai Chicken Pizza generates the highest revenue → higher price likely brings better profit.
=> By quantity sold and total orders, The Classic Deluxe Pizza ranks first → indicating stronger customer preference.

Top 5 Popular Products
- By Revenue: Thai Chicken, Barbecue Chicken, California Chicken, Classic Deluxe, Spicy Italian.
- By Quantity: Classic Deluxe, Barbecue Chicken, Hawaiian, Pepperoni, Thai Chicken.
- By Total Orders: Classic Deluxe, Hawaiian, Pepperoni, Barbecue Chicken, Thai Chicken.
=> Chicken Pizzas and the Classic Deluxe consistently stay in the top rankings, while Hawaiian and Barbecue Chicken also perform well.
=>Focus on boosting these products to further increase both revenue and sales volume.

Worst-Selling Product
- The Brie Carre Pizza performs the worst across all three categories: revenue, quantity, and total orders.
=> Consider removing it, launching targeted marketing campaigns, or improving its recipe.

Bottom 5 Worst-Selling Products
- By Revenue: Spinach Pesto, Mediterranean, Spinach Supreme, Green Garden, Brie Carre.
- By Quantity: Soppressata, Spinach Supreme, Calabrese, Mediterranean, Brie Carre.
- By Total Orders: Chicken Pesto, Calabrese, Spinach Supreme, Mediterranean, Brie Carre.
=> Vegetable-based pizzas (Spinach, Mediterranean, Green Garden) often fall at the bottom → lower customer appeal.

Conclusion
- Maintain strong performers: Thai Chicken, Classic Deluxe, Barbecue Chicken, Hawaiian, Pepperoni.
- Reassess weak performers: Brie Carre, Spinach Supreme, Mediterranean, Calabrese.
- Consider marketing campaigns or promotions for low-performing products.
- Focus on developing and upselling best-sellers, as they provide both stable revenue and high sales volume.








  








