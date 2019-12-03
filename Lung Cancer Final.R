#Entering data is easier because there is not much and is consistant 
#Rather than trying to run in the csv and editing and organizing it
#Made one string of all age labels for later plots
#Rate for black without breaking down gender, then broken down for men and women indiviudally
#Rate for white without breaking down gender, then broken down for men and women individually
rateblack <- c(0.0019, 0.0062, 0.0268, 0.18, 0.4648, 0.8542)
ratemenblack <- c(0.0017, 0.006, 0.0251, 0.1753, 0.5374, 1.0165)
ratewomenblack <- c(0.002, 0.0064, 0.0283, 0.1841, 0.407, 0.7415)
ratewhite<- c(0.0021, 0.007, 0.0318, 0.1626, 0.4419, 0.9883)
ratemenwhite <- c(0.002, 0.0062, 0.0262, 0.141, 0.4322, 0.995)
ratewomenwhite <- c(0.0022, 0.0079, 0.0375,0.1838, 0.4509, 0.9821)

#Labeling each data frame from which its coming from

#All the Black and White individuals without regard to gender
dfgenderblack <- data.frame(gender = rep(c("male","female"),each=6),age = rep(agelabels,2),rate=c(ratemenblack,ratewomenblack))
dfgenderwhite <- data.frame(gender = rep(c("male","female"),each=6),age = rep(agelabels,2),rate=c(ratemenwhite,ratewomenwhite))

#Separating the ethnic groups by gender
dfracemen <- data.frame(race = rep(c("white","black"),each=6),age=rep(agelabels,2),rate=c(ratemenwhite,ratemenblack))
dfracewomen <- data.frame(race = rep(c("white","black"),each=6),age=rep(agelabels,2),rate=c(ratewomenwhite,ratewomenblack))

#Didn't separate gender but contrasting between ethnic groups
dfrace <- data.frame(race = rep(c("white","black"),each=6),age=rep(agelabels,2),rate=c(ratewhite,rateblack))

#Make sure ggplot package is installed and opened
library(ggplot2)

#Specifying the lines in the graph, with aspects like color coding
ggplot(data=dfrace, aes(x=age, y=rate, group=race)) + geom_line() + geom_point()
ggplot(data=dfrace, aes(x=age, y=rate, group=race)) + geom_line(aes(color=race)) + geom_point()

dfraceplot <- ggplot(data=dfrace, aes(x=age, y=rate, group=race)) + geom_line(aes(color=race)) + geom_point()
#Adding a title to the plot
print(dfraceplot + ggtitle("Estimated Prevalance of Black and White \nEthnic Groups per Age Group") + labs(y="Estimated Prevalance Percentages", x = "Age Groups"))
#the \n makes the title two lines, a wrap of the text

