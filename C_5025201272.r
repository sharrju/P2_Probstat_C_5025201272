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


