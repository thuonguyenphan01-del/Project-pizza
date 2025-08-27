print("Hello world", end=":") #Hiển thị không xuống dòng "="
print("titv")
print('name={0}, surname={1}'.format('TITV', 'vn'))#Nhớ dấu chấm nha
###
print("uyen vuiv vui");print("hello");
# ốn chạy trong terminal nhớ đánh py trước nhớ có dấu ; và tren cùng 1 dòng
soluong = 25; print(f"ban da múa {soluong}")
print("Họ có bao nhiêu:")
#float: số có dấu phẩy
Bánh = 3.5;print(f"bạn đã ăn {Bánh}")
#BALOEN True or FALSE
is_student = True
if is_student:
    print("you are student")
else:
    print("You are NOT student");
# mad libs
adjective1 = input("enter your adjective:")
noun = input("enter your noun:")
print(f"today i feel {adjective1} about {noun}")
#area calculator
lenght = float(input("enter the lenght:"))
width = float(input("enter:"));
height = float(input("enter:"));
area = lenght * width* height;
print(f"area:{round(area)}")
#if else
age =int(print("enter your age:"));
if age >=18:
    print("you are sign up")
elif age <0:
    print("you are not born yet")
elif age > 100:
    print("you are too old for this")
else:
    print("you are not old enough for this");
#baloen
online = False;
if online:
    print("đi ngủ đi!!!")
else:
    print("Mơ ác mộng nhé!!!")
#Dùng round để làm tròn các con số
#weight converter
weight = float(input("enter your wieght:"))
Unit = input("kg or Lb:")
print = (f"your weight: {weight}{Unit}")
#weather
nhiet_do = int(input("nhiệt độ là:"))
if nhiet_do >=40 or nhiet_do <= 10:
    print("Thời tiết khó chịu")
else:
    print("Thời tiết ổn")
#Condition expression
# if condition else
num = 5
print("Positive" if num >0 else "Negative")
# use string method
name=str(input("enter your name:"))
result =len(name)
print(result)
#name =name.capitalize()
name=input("enter your name:")
#result =name.find("u")
#result =name.rfind("u")
#name =name.capitalize()
#name =name.upper(),count()-đếm đối tượng, replace("","")- thay thees ký tự
print(name)
#tạo validation cho biến
user_name = input("Enter a usename:")
if len(user_name) >12 and not user_name.find("") == -1 and not user_name.isalpha():
    print(f"welcome {user_name}")
else:
    print("không dùng được username này!!")
#while loop
n = int(input("Nhập giá trị n:"))
while n <5:
    print("Chưa thỏa điều kiện")
    n= n+1
else:
    print("Đã thỏa điều kiện!!")
#Index [start:end:step]
Creadit_number = '1234_5678_3478'
print(Creadit_number[0:5]) #In các dãy số từ thứ tự 0 đến 4
print(Creadit_number[::3]) #In các số cách nhay 3 số
print(Creadit_number[::-1]) #In các số theo hướng ngược lại
#Tạo email slicer program
email = input("Enter your email")
index = email.index("@")
user = email[:index]
Domain =email [index:]
#hoặc có thể dùng email[:email.index('@')]
#Format specifier = (value:flag)
price1= 3.233446
print(f"Gía 1 là {price1:.2f}") #làm tròn số thứ 2
print(f"Gía 1 là {price1:10}")#10 chữ số
print(f"Gía 1 là {price1:-}")# gía trị âm
print(f"Gía 1 là {price1:^10}")#căm giữa
print(f"Gía 1 là {price1:>10}")
print(f"Gía 1 là {price1:<10}")
#compoud interest calculator
principle = 0
rate =0
time =0
while principle <= 0:
    principle = float(input("enter your amounts: "))
    if principle <=0:
        print("Principle không thể bé hơn 0");
while rate <= 0:
    rate = float(input("enter your amounts: "))
    if rate <=0:
        rate ("rate không thể bé hơn 0");
while time <= 0:
    time = int(input("enter your amounts: "))
    if time <=0:
        time ("rate không thể bé hơn 0");
total = principle *pow((1 + rate/100),time)
print(total);
#for loop
for x in range(1,12):
    print(x);
for x in reverse(range(1,12)):
    print(x)
#nested for loop
for x in range(1,10):
    for y in range(3):
        print(y)
    print();
row = int(input("Nhập vào hàng:"))
Column = int(input("nhập cột vào đây"))
symbol = input("nhập symbol vào đây:")
for x in range(row):
    for y in range(Column):
        print(symbol, end="")
    print();

import time
my_time = int(input("enter your time: "))
for x in range(my_time,0,-1):
    second = x % 60
    minutes = int(x/60)%60
    hour = int(x/3600)
    print(f"{hour:02}:{minutes:02}:{second:02}")
    time.sleep(1)
print("Time is up!!")
#collection dùng để trữ nhiều dữ liệu
Trai_cays =["nho","táo"] #list có thể lặp lại giá trị có thể thay đổi được
print(dif(Trai_cays))
#for Trai_cay in Trai_cays:
    #print(Trai_cay)
#print(dir(Trai_cays))
#print(help(Trai_cays))
#print(len(Trai_cays))
#print("nho"in Trai_cays)--Tìm nho trong list tra về TRue hoặc false
#Trai_cays [0] = "dưa" -- thêm dưa vào list
#Trai_cays.append("dưa") -- thêm dưa vào cuối list
#Trai_cays.remove("nho")
#Trai_cays.insert(0,"nho")
#Trai_cays.sort() -- liệt kê
#Trai_cays.reverse()
#Trai_cays.clear()
#print(Trai_cays.count("táo"))-- đếm số lần xuất hiện
print(Trai_cays)
#Fruits ={"nho","táo"}# set không có giá trị lặp lại, thay đổi được thêm hoặc xóa, không sửa được giá trị có sẵn, k thể order
#Fruit = ("nho")# không thay đổi được và chấp nhận giá trị lặp lại
#Shopping program
foods = []
prices = []
total = 0
while True:
    food = str(input("nhập thức ăn vào:"))
    if food.lower() == "q":
        break
    else:
        price = float(input(f"Nhập giá vào: "))
        foods.append(food)
        prices.append(price)
print("---your cart---")
for food in foods:
    print(food, end="")
for price in prices:
    total += price #=total +price
print(f"tổng tiền là:{total}")
#2d list
job_list = ["giáo viên", "bác sĩ"]
for job in job_list:
    print(job)
numbers=[]
for number in range(100):
    numbers.append(number)
print(numbers, end="")
#numpy
import numpy as np;
np.array([1,2,3,4,5], dtype='float32')
a1=np.array([1,2,3,4])
a2=np.array([[1,2,3,4,5],
             [6,7,8,9,10]])
print(type(a2))#kiểu dữ kiệu mảng a2
print(a2.dtype)#in kiểu dữ kiệu thành phần
print(a2.shape)#In kiểu shape
#numpy
import numpy as np;
np.zeros([2,4],dtype= 'float64')
np.ones((3,5))#tạo amngr 2 chiều với 3 dòng và 5  cột
#print(np.full((3,5),6.9))#tạo mảng 2 chiều với 3 hàng 5 cột fill bởi giá trị 6.9
#print(np.full((3,5),[6,1,2,3,4]))
#print(np.linspace(1,5,num=5,retstep=True))#chia các số từ 1 đến 5 thành 5 khoảng bằng nhau
#print(np.random.random((4,4)))#cho randong trong mảng 4 4
#np.random.seed(0)#cố định các con số ngẫu nhiên
#print(np.random.random((4,4)))
#print(np.random.normal(0,1,(3,3)))#Mảng 3 3 min =0 độ lệch chuẩn =1
#print(np.random.randint(0,10,(3,4)))#Mảng 2 3 số ngẫu nhiên từ 0 đến 10
#print(np.random.rand(3,4))
#array indexing slicing
#x1=np.random.randint(0,10,(3,4))
#print(x1)
#print(x1[2,3])#nhớ rầng thứ tự được đếm trong python là từ 0
#print(x1[:2,:3])#lấy 2 dòng 3 cột đầu tiên
#print(x1[:,:3])
x2=np.array((1,10,2))
#x2.reshape((1,3))#đổi ma trận
#print(x2.T)# chuyển hàng thành cột, cột thành hàng
x3=np.array([[3,4,5],
             [2,3,4]])
#print(np.concatenate((x2,x3)))# nối 2 mảng lại với nhau
#print(np.concatenate((x3,x3),axis=1))# nối mảng theo côt (thêm vào cột)
#print(np.vstack((x2,x3))) #nối các mảng theo hàng, phải là mảng có sô cột bằng nhau
#print(np.hstack((x3,x3))) #nối các mảng theo cột phải là mảng có số hàng bằng nhau
#x4, x5, x6=np.split(x2,[1,2])#Tách các mảng thành mản nhỏ
#print(x5)
#x4=np.arange(10.0).reshape(2,5)
#print(np.vsplit(x4,2))#tách cacsc mảng thành các mản nhỏ với số hàng bằng nhau
#print((x2+3))# cộng các giá trị thêm 3 đơn vị
#print((x2+x3))
x5=np.array([1,2,4,5])
#print(np.sum(x5)) # tính tổng các giá trị trong arrt
#m_array=np.random.randint(0,10000,(1000,10))
#print(m_array.sum())
#print(x3.dot(x2))
#Tích vô hướng
x6 = np.random.randint(20,size=(7,4))
import pandas as pd
dt=pd.DataFrame(x6,index=["mon","tues","wed","thurs","fri","sat","sun"],
                columns=["bánh","bún","nước","mì"])
prices= np.array([10,3,4,5])
banh_price= pd.DataFrame(prices.reshape(1,4),index=["price"],columns=["bánh","bún","nước","mì"])
#print(banh_price)
tt=dt.dot(banh_price.T)
print(tt)


    