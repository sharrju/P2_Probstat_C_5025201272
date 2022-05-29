# Sarah Alissa Putri
# 5025201272 // Probstat C

# No.1
# A
#data sebelum
X <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
#data sesudah
Y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(X)
sd(Y)

#selisih (bisa sd(X-Y) juga, hasilnya sama)
sd(Y-X)

# source : https://www.journaldev.com/38162/find-standard-deviation-in-r

#B
t.test(Y,X,paired = TRUE,var.equal = FALSE)
# source : https://datascienceplus.com/t-tests/#:~:text=To%20conduct%20a%20one%2Dsample,specified%20by%20the%20null%20hypothesis.

#C di readme

# No.2
# A
# Setuju

# B
zsum.test(mean.x = 23500,sigma.x = 3900,n.x = 100,alternative = "less",mu = 20000)

# C
# H(0) "Mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun" diterima

# No.3
# A di readme

# B
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)

# C
install.packages("mosaic")
library(mosaic)

plotDist(dist='t', df=2, col="green")

# D
#find t critical value
qt(p=0.05, df=2, lower.tail=FALSE)

# source : https://www.statology.org/t-critical-value-r/

# E di readme
# F di readme


# No.4
# A
oneWayData  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
dim(oneWayData)
head(oneWayData)
attach(oneWayData)

oneWayData$Length <- as.factor(oneWayData$V2)
oneWayData$Group <- as.factor(oneWayData$V1)
oneWayData$Group = factor(oneWayData$Group,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih","Kucing Oren"))
class(oneWayData$Group)

grup1 <- subset(oneWayData, Group == "Kucing Oren")
grup2 <- subset(oneWayData, Group == "Kucing Hitam")
grup3 <- subset(oneWayData, Group == "Kucing Putih")

ggplot(
  data = grup1, 
  aes(sample = Length)
  ) + geom_qq()
  
ggplot(
  data = grup2, 
  aes(sample = Length)
  ) + geom_qq()
  
ggplot(
  data = grup3, 
  aes(sample = Length)
  ) + geom_qq()

# B
bartlett.test(oneWayData$Group, oneWayData$Length)

#C
qqnorm(grup1$Length)
qqline(grup1$Length)

# E
model <- lm(Length~Group, data = oneWayData)
anova(model)
TukeyHSD(aov(model))

# F
ggplot(
  oneWayData, 
  aes(x = Group, y = Length)) + geom_boxplot(colour = "black") + scale_x_discrete() + xlab("Species") + ylab("Length")


# No.5
# A
GTL <- read_csv("GTL.csv")
head(GTL)

str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# B
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# C
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# D
tukey <- TukeyHSD(anova)
print(tukey)

# E
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)

write.csv("GTL_summary.csv")


