#从SQL调取数据：
channel <- dbConnect(MySQL(), host = "123.56.193.234",username = "tq007",
                     password ="tq123456_", dbname = 'observe_siteId')

data = dbGetQuery(channel, "select SiteId, mon, day,tempAvg, tempMax, tempMin, prec20_20,windAvg,
                 windMax, windExt,sunshineHour from `obsSiteId` where SiteId = 54596 and
                 day in (17,18,19,20,21,22,23,24,25) and substr(mon,6) = '7' 
                 and DateTime > '1987-01-01 00:00:00'")

#处理数据
dat[which(dat$prec20_20 == 32700),7]<- 0
dat$prec20_20 = dat$prec20_20/10
y <- c(dat$prec20_20)
y = sort(y)
#去掉极端值
y <- y[which(y<75)]
y <- y[c(1:66386)]
y <-rep(y, times=3)

##tweedie相关：
#求参数p（index parameter)
out <- tweedie.profile(y~1, p.vec=seq(1.2, 1.8, by=0.1))
out$p.max
#求参数phi(dispersion parameter)
fit <- glm(y~1, family=tweedie(var.power=out$p.max, link.power=0))
summary(fit)
out$phi.max
#用参数作图
mu = mean(y)
phi = out$phi.max
p = out$p.max
f2 <- dtweedie(y,mu=mu,phi=phi,power=p)
plot(y, f2, type="l", xlab="y", ylab="Density")
#计算重现值
f4 <- ptweedie(4.55, mu=mu,phi=phi,power=p)
1-0.98*f4
1/(1-f4)
#直方图加概率密度图
hist(y, probability = TRUE,breaks = 100, col = 'lightblue')
lines(f2~y,col = 'red')

#定义function
df = pd.DataFrame(columns = ['siteid','date','prob'])      
for i in site_id:
  for j in day_name:
  try:
  data = data_pre_export(elements, i, j, j)
prob = RAIN_distr(data['prec20_20'],0,2)
df=df.append(pd.DataFrame({'siteid':[i],'date':[j],'prob':[prob]}),ignore_index = True)
print (i)
except Exception as e:
  df=df.append(pd.DataFrame({'siteid':[i],'date':[j],'prob':"NA"}),ignore_index = True)
continue

#数据binary化
data$PREC24[which(data$PREC24 > 0)] <- 1
data$PREC24[which(data$PREC24 < 50)] <- 0
#数据数表化
a = data.frame(a)
#数据分组
a = tapply(X100_tweedie$score,X100_tweedie$STATION_ID,mean)
#数表加一列
X100_tweedie$score = (X100_tweedie$PREC24-X100_tweedie$`50-100`)^2
temp_bs_0$score1 = y
#数表删一列
dat = temp_bs_0[,-6]

#存储数据成csv/xlsx
write.csv(a,'shuju.csv')
write.xlsx(data,'2018_1-5flight.xlsx')

##台风数据站点匹配：
#去掉表格中多余的字符（excel函数）
=LEFT(A4,LEN(A4)-LEN("元"))
#excel根据一列匹配另一列（excel函数）
=LOOKUP(1,0/((B3=Sheet1!B:B)*(Sheet1!C:C='Sheet 1'!C3)),F:F)
=VLOOKUP(C2,'456'!C:C,1,0)
#根据坐标求距离
mn <- cbind(c(lon6),c(lat6))
xy <- cbind(c(lon0),c(lat0))
distGeo(xy,mn)
#数据唯一化
forecast_time = unique(forecast_time)
#数据去除非数字内容
X$lat = gsub("[^0-9]", "",X$lat)
X$lat = as.numeric(X$lat)
#distinct数据
data111 <- data11%>%
  distinct(Plan_Dept_Time,Dept_Time_Diff,Dept_Code,Arr_Code,Plan_Arr_Time,Arr_Time_Diff,Status,
           Dept_Delay_3_4,Dept_Delay_Lg4,Actual_Dept_Time,Actual_Arr_Time,Dept_Name,Arr_Name,.keep_all=TRUE)
#上传数据到SQL
dbWriteTable(channel,'obsSiteId_temp',data,append = T,row.names = F)
#根据两列数据匹配表格
model.data <- merge(data, data_act, by = c('stationID','Date_time'), all.x = TRUE)











