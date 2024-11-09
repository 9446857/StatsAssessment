data_for_building_model <- read.table('UoE/Prob and Stats/data for building model.csv', sep=',', header=1)

y <- unlist(data_for_building_model[14])
x1 <- unlist(data_for_building_model[1])
x2 <- unlist(data_for_building_model[2])
x3 <- unlist(data_for_building_model[3])
x4 <- unlist(data_for_building_model[4])
x5 <- unlist(data_for_building_model[5])
x6 <- unlist(data_for_building_model[6])
x7 <- unlist(data_for_building_model[7])
x8 <- unlist(data_for_building_model[8])
x9 <- unlist(data_for_building_model[9])
x10 <- unlist(data_for_building_model[10])
x11 <- unlist(data_for_building_model[11])
x12 <- unlist(data_for_building_model[12])

#visual check for non-correlation between the variables
#plot(data_for_building_model)


#building the model using the least squares method
m1 <- lm(y ~ x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12)

# Write output from model:
summary(m1)

#list of estimators
beta_values <- summary(m1)$coefficients

#plot the residuals
res1 <- data.frame(residuals(m1))
par(mfrow=c(1,2))
plot(y,t(res1),ylab='residual')
hist(residuals(m1), xlab='residuals', main='')

#comparing predicated with the actual values from the 20% remaining
checkdata <- read.table('UoE/Prob and Stats/data_for_checking.csv', sep=',', header=1)
new_x <-checkdata[1, ]


