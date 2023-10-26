class(export1)
export1t=ts(export1$`CURRENT TOTAL EXPORT`, frequency = 12, start = c(2007, 1),end = c(2019,12))
class(export1t)
library(tseries)
library(forecast)
plot(export1t,xlab="YEAR",ylab="CURRENT TOTAL EXPORT")
acf(export1t)
pacf(export1t)
y=log(export1t)
plot(y)
z=diff(y,12)
acf(z)
pacf(z)
model=auto.arima(z)
summary(model)
auto.arima(z,ic="aic",trace = TRUE)
res=residuals(model)
plot(res)
acf(res)
pacf(res)
mean(res)

Box.test(model$residuals, lag=15, type="Ljung-Box")
shapiro.test(res)

F=forecast(model,24)
F
autoplot(F)


# class(export11)
# export11t=ts(export11$`CURRENT YEAR QUANTITY`, frequency = 12, start = c(2007, 1),end = c(2019,12))
# class(export11t)
# library(tseries)
# library(forecast)
# plot(export11t,xlab="YEAR",ylab="CURRENT YEAR QUANTITY")
# acf(export11t)
# pacf(export11t)
# y=log(export11t)
# plot(y)
# z=diff(y,12)
# acf(z)
# pacf(z)

# adf.test(z)-----If the p-value from the test is less than some significance level (e.g. α = .05), 
# then we can reject the null hypothesis and conclude that the time series is stationary.

# model=auto.arima(z)                 
# summary(model)
# auto.arima(z,ic="aic",trace = TRUE)
# res=residuals(model)
# plot(res)
# acf(res)
# pacf(res)
# mean(res)

# Box.test(model$residuals, lag=15, type="Ljung-Box")
# shapiro.test(res)

# F=forecast(model,24)
# F
# autoplot(F)