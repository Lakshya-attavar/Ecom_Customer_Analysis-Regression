#dataset
library(ggplot2)
library(dplyr)
library(corrgram)
data <- read.csv("Transactions_Customer.csv", )
head(data)
dim(data)
sum(complete.cases(data)) #no missing data found
sum(!complete.cases(data))
summary(data) 

#Correlation
cor(data) 
corrgram(data)

#Assumptions
dataplot <- data
dataplot$Seen_Voucher <- as.factor(dataplot$Seen_Voucher)
dataplot$Advertisement_Channel<- as.factor(dataplot$Advertisement_Channel)


#age vs revenue
ggplot(data) + geom_point(aes(Estimated_Age,Revenue)) +
  labs(title = "Scatterplot of Estimated age vs revenue",tag = "Figure 1",x = "Estimated age of Customer",y = "Revenue" ) + theme(legend.position="none")
#from this graph the customers between ages 20 - 40 have made a large number of transactions, no specific relation to the revenue found
ggplot(data=dataplot) + geom_point(aes(Estimated_Age,Revenue,color=Seen_Voucher))+
  labs(title = "Estimated Age and Revenue Plot with Voucher Information", caption = "Data from transaction",
       tag = "Figure 4",x = "Estimated Age",y = "Revenue")
ggplot(data=dataplot) + geom_point(aes(Estimated_Age,Revenue,color=Advertisement_Channel))+
  labs(title = "Estimated Age and Revenue Plot with Advertisement Channel Information", caption = "Data from transaction",
       tag = "Figure 5",x = "Estimated Age",y = "Revenue")

#time vs revenue
ggplot(data) + geom_point(aes(Time_On_Site,Revenue)) +
  labs(title = "Scatterplot of Time_On_Site vs revenue",tag = "Figure 2",x = "Time spent by cutomer on the website",y = "Revenue" ) + theme(legend.position="none")
#from this graph no specific relation to the revenue is found
ggplot(data=dataplot) + geom_point(aes(Time_On_Site,Revenue,color=Seen_Voucher))+
  labs(title = "Time spent on site and Revenue Plot with Voucher Information", caption = "Data from transaction",
       tag = "Figure 6",x = "Time spent on the website",y = "Revenue")
ggplot(data=dataplot) + geom_point(aes(Time_On_Site,Revenue,color=Advertisement_Channel))+
  labs(title = "Time spent on website and Revenue Plot with Advertisement Channel Information", caption = "Data from transaction",
       tag = "Figure 7",x = "Time Spent on the website",y = "Revenue")

#income vs revenue
ggplot(data) + geom_point(aes(Estimated_Income,Revenue)) +
  labs(title = "Scatterplot of Estimated income to revenue",tag = "Figure 3",x = "Customer's estimated income",y = "Revenue" ) + theme(legend.position="none")

ggplot(data=dataplot) + geom_point(aes(Estimated_Income,Revenue,color=Seen_Voucher))+
  labs(title = "Estimated income and Revenue Plot with Voucher Information", caption = "Data from transaction",
       tag = "Figure 8",x = "Customer's Estimated Income",y = "Revenue")

ggplot(data=dataplot) + geom_point(aes(Estimated_Income,Revenue,color=Advertisement_Channel))+
  labs(title = "Estimated income and Revenue Plot with Advertisement Channel Information", caption = "Data from transaction",
       tag = "Figure 9",x = "Customer's Estimated Income",y = "Revenue")

#box plot for seen voucher since it is a categorical variable
ggplot(data=dataplot) + geom_boxplot(aes(Seen_Voucher,Revenue))+
  labs(title = "Voucher seen and Revenue Plot", caption = "Data from trasaction",
       tag = "Figure 3",x = "voucher seen",y = "Revenue")
#box plot for Advertisement channel since it is a categorical variable
ggplot(data=dataplot) + geom_boxplot(aes(Advertisement_Channel,Revenue))+
  labs(title = "Advertisement Channel and Revenue Plot", caption = "Data from trasaction",
       tag = "Figure 10",x = "Advertisement channel",y = "Revenue")


ggplot(data=dataplot) + geom_point(aes(Estimated_Income,Revenue,color=Seen_Voucher))+
  geom_abline(slope=0.002858, intercept=13.5) +
  labs(title = "Estimated income and Revenue Plot with voucher Information",
       caption = "Data from transaction",
       tag = "Figure 11",x = "Estimated income",y = "Revenue")
corrgram(dataplot)
# model with income, seen voucher and advertisement channel
model <- lm(Revenue ~ Estimated_Income+Seen_Voucher+Advertisement_Channel, dataplot)
summary(model)