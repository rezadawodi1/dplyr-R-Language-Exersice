getwd()
setwd("C:/Users/sayed/OneDrive/Desktop/AUAF")
data = read.csv('Sayed_M_Reza_Dataset.csv')
View(data)
install.packages("tidyverse")
install.packages("dplyr")
library(dplyr)
names(data)
dim(data)
#Let's now filter the rows for only female students!
fdata = filter(data, Gender == 'Female')
fdata
head(fdata)
dim(fdata)
#Let's find those females who don't smoke!
fnsmoke = filter(data, Gender == 'Female', Smoker == "No" )
fnsmoke
head(fnsmoke)
dim(fnsmoke)
#Logical Operations ! & | and numerical data < > ==
unique(data$Edu_Degree)
#Those employees who are male and they hold a PHD degree
male_phd = filter(data, Gender == 'Male' & Edu_Degree == 'PHD')
male_phd
#Those employees who are considered as youths (between 18-25 years old)
youthemployees = filter(data, Age >= 18 & Age < 25)
youthemployees
#Candidates for the volleyball team
volleyball = filter(data, Height >= 175 | Smoker == "No")
volleyball
nrow(volleyball)
#Employees who are not single
notsingle = filter(data, Marital_Status != "Single")
head(notsingle)
#Employees who might be under the risk of health condition
hs_smoke_overw = filter(data, (Edu_Degree == "HS" & Smoker == 'Yes') 
                        | (Weight > 75 & Height < 169))
hs_smoke_overw
nrow(hs_smoke_overw)
#Using %in% function
#Employees who are [18,30]
agerange = filter(data, Age %in% c(18,28,36))
agerange
#Arrange (Organize our data in Order)
head(arrange(data, -desc(Age)))
arrange(data, Edu_Degree)
#(Select) a specific part of the dataset
try_select = select(data, c(Gender, Edu_Degree,Smoker))
try_select
#Select from a specific range 
head(select(data, Age:Marital_Status))
#descending order
head(select(data, -(Age:Marital_Status)))
#Renaming
names(data)
genderTosex = rename(data, Sex = Gender)
head(genderTosex)
#mutate
newcolunm = mutate(data, new_weight = Weight - 2)
head(newcolunm)
#Summarize
summarise(data, mean(Age), sd(Weight), mean(Weight),sd(Height))
sk = group_by(data, Smoker)
sk
