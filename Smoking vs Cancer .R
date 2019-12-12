setwd("~/Downloads")
library(readr)
cancer_and_smoking_data_combined <- read_csv("cancer and smoking data combined.csv")
attach(cancer_and_smoking_data_combined)
plot(smkrate, cncrrate, main = "Scatterplot of Smoking Rates vs \nLung/Bronchial Cancer Rates, by State", xlab = "Smoking Rate", ylab= "Cancer Rate", pch=19)
abline(lm(cncrrate~smkrate), col="red")

cor(cncrrate, smkrate)
smvcr.lm = lm(cncrrate ~ smkrate, data=cancer_and_smoking_data_combined)
summary(smvcr.lm)$r.squared