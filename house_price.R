
##################################### Loading Data and Libraries ##################################################

#loading libraries
libraries<-c("ggplot2","dplyr")
sapply(libraries,require,character.only=TRUE)

#importing train and test data
raw_data_train<-read.csv("train.csv",header = TRUE)
raw_data_test<-read.csv("test.csv",header = TRUE)

#View Data
dim(raw_data_train)
str(raw_data_train)
summary(raw_data_train)

dim(raw_data_test)
str(raw_data_test)
summary(raw_data_test)


########################################## Exploratory Data Analysis #############################################

#checking duplicate entries
sum(duplicated(raw_data_train))

#storing Id columns of test data as vector
test_id<-raw_data_test[,1]

#removing first column of test and train data
#raw_data_train<-raw_data_train[,-1]
#raw_data_test<-raw_data_test[,-1]

#numerical features
numeric_features<-sapply(raw_data_train,is.numeric)
raw_data_train_numeric<-raw_data_train[numeric_features]
#categorical features
raw_data_train_cat<-raw_data_train[!numeric_features]

#Corelation of variables
cor(raw_data_train_numeric,raw_data_train_numeric$SalePrice)

#some rows have missing values
plot(LotFrontage,SalePrice)
raw_data_train_numeric[is.na(LotFrontage),]<-mean(raw_data_train_numeric$LotFrontage,na.rm = TRUE)
raw_data_train_numeric<-raw_data_train_numeric[LotFrontage<200,]

plot(MasVnrArea,SalePrice)
raw_data_train_numeric[is.na(MasVnrArea),]<-mean(raw_data_train_numeric$MasVnrArea,na.rm = TRUE)
raw_data_train_numeric<-raw_data_train_numeric[MasVnrArea<1300,]

