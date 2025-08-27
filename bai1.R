#Bài h???c d???u v???i R studio
DNAseq<- function(x){
    basepair=c("A","T","G",'C')
    abc<-unlist(strsplit(toupper(x),NULL))
    paste(unlist(lapply(abc, function(DNAseq){
       if (DNAseq=="A") stringss <-"T"
       if (DNAseq=="T") stringss <-"A"
       if (DNAseq=="C") stringss <-"G"
       if (DNAseq=="G") stringss <-"C"
       if (!DNAseq%in%basepair) stringss<-"N"
    return(stringss)
      })),collapse="")
}
DNAseq("ATTTCCCGGGGGT")
#print statement
print("Hello my job")
#asignments
dna <- "AGGGC"
print(dna)
#install package
install.packages('stringr')
library(stringr)
#Data types
#numeric data type
numeric_integer <- 10
class(numeric_integer)
numeric_float<-1.2
class(numeric_float)
#character
dna_seq <-"ATTGGC"
class(dna_seq)
nucleotide<-"A"
class(nucleotide)
nchar(dna_seq)
seq_length<-nchar(dna_seq)
print(seq_length)
new_seq <- paste(dna_seq,"GGG")
print(new_seq)
dna_seq <-"ATTGGC"
str_count(dna_seq,"A")
acount_str <-str_count(dna_seq,"A")
print(acount_str)
#Logical data type
logical_value<- TRUE
logical_value2<- TRUE
class(logical_value)
#numeric vector
num_vector<- c(1,2,3)
class(num_vector)
length(num_vector)
#char vector
char_vector <- c("ATC","GGA","AAT","AGC")
length(char_vector)
nchar(char_vector)
#logical vector
logical_vector <- c(TRUE,TRUE,F,F,FALSE)
class(logical_vector)
#list
Hoa<- list(num_vector,char_vector)
class(Hoa)
length(Hoa)
#T???o index
Hoa[1]
num_vector[1]
#Dataframe tuong nhu python
char_vector <- c("A","G","T","C")
num_vector <- c(1,2,3,4)
logical_vector <- c(T,T,F,T)
#Trong python pd.Dataframe(data=, index=,columns=)
df<-data.frame(Nucle=char_vector,numeric=num_vector,logical=logical_vector)
print(df)
#các phép toán tuong t??? python khác "=" thay b???ng "<-"
dna_seq <-"ATTGGC"
seq_length<-nchar(dna_seq)
if (seq_length>6){print('Long seq')} else {print('short seq')}
#loop
nucleotides <- c("A","T","C","G")

for ( base in nucleotides ) {
  
  print(base)  
  
}
dna_seq <-"ATTGGC"
chars <- strsplit(dna_seq, "")[[1]]
for (i in seq_along(chars)) {
  cat(i, chars[i], "\n")
}
#function tính %GC
manguon<- function(sequence){
  length_seq <- nchar(sequence)
  g_count<- str_count(sequence,"G")
  c_count <- str_count(sequence,"C")
  PTGC <- (g_count + c_count) /seq_length * 100
  print( PTGC)
}
manguon("ATGCGCTTTAAG")
#import data

case_data <- read.csv("C:/Users/ASUS/Downloads/ai_financial_market_daily_realistic_synthetic.csv")
print(case_data)
str(case_data)
library(dplyr)
glimpse(case_data)# xem shape c???a b???ng gi???ng info trong python
#Trích xu???t 3 dòng d???u c???a b???ng
head(case_data,3)
#groupby
Total_RD<-aggregate(R.D_Spending_USD_Mn ~ Company, data = case_data, FUN = mean)
library(dplyr)
library(lubridate)# x??? lý ngày tháng
#group by 2 c???t theo sum RD
df<-case_data %>%
  group_by(Company, year = year(as.Date(Date))) %>%
  summarise(Total_R.D_Spending_USD_Mn = sum(R.D_Spending_USD_Mn, na.rm = TRUE), .groups = "drop")
print(df)
#na.rm = TRUE b??? qua các giá tr??? null
#$ gi???ng nhu trích d???n c???t trong python
#thêm c???t m???i
case_data$Year<- year(case_data$Date)
head(case_data,3)
#v??? bi???u d??? chart t???ng ti???n RComaD theo công ty
barplot(Total_RD$R.D_Spending_USD_Mn,
        names.arg = Total_RD$Company,
        col = "skyblue",
        main = "T???ng giá theo công ty",
        xlab = "Company",
        ylab = "T???ng Price")
head(case_data,3)
#Group airevenue qua nam
Total_rev=aggregate(AI_Revenue_USD_Mn ~ Year,data=case_data,FUN=sum)
library(dplyr)
library(ggplot2)
graphics.off()
ggplot(df, aes(x = factor(year), y = Total_R.D_Spending_USD_Mn, color = Company, group = Company)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "T???ng chi phí RD qua các nam ",
       x = "Nam", y = "Chi phí RD", color = "Company") +
  theme_minimal()
#Group by nam và công ty theo sum AI revenue
case_data %>%
  group_by(Company,Year)%>%
  summarise(Total_AI_Revenue_USD_Mn=sum(AI_Revenue_USD_Mn,na.rm = TRUE),.groups = "drop")
# T???o d??? li???u ví d???
set.seed(123)
da<- data.frame(
  group = rep(c("A", "B", "C"), each = 10),
  score = c(rnorm(10, mean = 50, sd = 5),
            rnorm(10, mean = 55, sd = 5),
            rnorm(10, mean = 60, sd = 5))
)
print(da)
anova_model <- aov(score ~ group, data = da)
summary(anova_model)
TukeyHSD(anova_model);
ggplot(da, aes(x = group, y = score, fill=score) +
  geom_boxplot()+
  theme_minimal() + geom_jitter(width = 0.15, alpha = 0.6, size = 2)+
  labs(title = "So sánh 3 nhóm A, B, C b???ng ANOVA");

  
