TEST1COM <- TEST[which(TEST$Dept_Code == "DLC"),]
TEST1 <- TEST[which(TEST$Dept_Code == "DLC" & TEST$Status == "A"),]

data1 <- data[which(data$Dept_Code == "SZX" & data$Status == "A"),]
data11 <- data1[which(substr(data1$Plan_Dept_Time,7,7)==9 & substr(data1$Plan_Dept_Time,9,9)==1
                      & substr(data1$Plan_Dept_Time,10,10)==7 & data1$Status == "A" & data1$Dept_Code == "SZX"),]
data11a <- data11[which(data11$Dept_Time_Diff >= 180 & data11$Dept_Time_Diff <240 & data11$Status =="A"),]
data11b <- data11[which(data11$Dept_Time_Diff >= 240 & data11$Status == "A"),]

dataa <- data[which(data$Dept_Code == "PEK" & substr(data$Plan_Dept_Time,7,7)==6 & substr(data$Plan_Dept_Time,9,9)==1
                    & substr(data$Plan_Dept_Time,10,10)==0),]

dataa1 <- data[which(data$Dept_Code == "PEK" & substr(data$Plan_Dept_Time,7,7)==6 & substr(data$Plan_Dept_Time,9,9)==1
                    & substr(data$Plan_Dept_Time,10,10)==1),]


x <- mean(TEST1COM$Dept_Delay_3_4)
y <- mean(TEST1COM$Dept_Delay_Lg4)

TEST1 <-TEST

(x-(4/309))/(4/309)
(y-(7/309))/(7/309)

data111 <- data11%>%
  distinct(Plan_Dept_Time,Dept_Time_Diff,Dept_Code,Arr_Code,Plan_Arr_Time,Arr_Time_Diff,Status,
           Dept_Delay_3_4,Dept_Delay_Lg4,Actual_Dept_Time,Actual_Arr_Time,Dept_Name,Arr_Name,.keep_all=TRUE)

dataE <- dataE%>%
  distinct(dept_code,Plan_take_time,Dept_time_diff,arr_code,Landing_time_diff,status,.keep_all=TRUE)
华北飞东北 <- 华北飞东北全%>%
  distinct(flight_no,dept_airport,arr_airport,plan_dept_time,dept_delay_time,arr_delay_time,status_code,group,.keep_all=TRUE)

TEST456 <- TEST %>%
  group_by(Dept_Code, Arr_Code, Plan_Dept_Time) %>%
  filter(row_number() == 1) %>%
  ungroup()

datamax <- dbGetQuery(channel, "select mon_day, price from `munich_model_2018or2017_response`")

channel <- dbConnect(MySQL(), host = "47.93.178.84",username = "tq007",
                     password ="tianqi888_", dbname = 'ap_data')

dataCTUKMG = dbGetQuery(channel, "select flight_no, dept_airport, arr_airport, plan_dept_time, dept_delay_time, arr_delay_time,
                  status_code, `group` from `aiportmatchdata_from44to44_190211` where dept_airport = 'CTU' and arr_airport = 'KMG'")

dataSHECTU = dbGetQuery(channel, "select flight_no, dept_airport, arr_airport, plan_dept_time, dept_delay_time, arr_delay_time, status_code
                        from `aiportmatchdata_from44to44_190211` where dept_airport = 'SHE' and arr_airport = 'CTU'")


dataKMG_SHA = dbGetQuery(channel, "select airline, prob_date, h3_prob, h4_prob from `airline_prob_avg` where airline = 'KMG-SHA'")

data11 = dbGetQuery(channel, "select flight_no, dept_airport, arr_airport, plan_dept_time, dept_delay_time, arr_delay_time, status_code
                    from `aiportmatchdata_from44to44_190211` where dept_airport = 'DLC' and arr_airport = 'PVG'")

data2 = dbGetQuery(channel, "select airline, prob_date, h3_prob, h4_prob from `airline_prob` where airline = 'DLC-PVG'")

data11 = dbGetQuery(channel, "select Flight_No, dept_code, arr_code, Plan_take_time, Dept_time_diff,  Landing_time_diff, Status
                from `flight_data_2018_all_weather_sortie_full_190212` where dept_airport = 'SHA'and 
                YEAR(plan_dept_time) = 2016 and MONTH(plan_dept_time)=9 and DAY(plan_dept_time)= 17 and status_code = ''")
data11a <- data11[which(data11$dept_delay_time >= 180 & data11$dept_delay_time <240),]
data11b <- data11[which(data11$dept_delay_time >= 240),]

上传数据到SQL：dbWriteTable(channel,'obsSiteId_temp',data,append = T,row.names = F)

data = dbGetQuery(channel, "select Flight_No, dept_code, Plan_take_time, Dept_time_diff, arr_code, 
                    Landing_time_diff, Status from `flight_data_2018_all_weather_sortie_full_190212` where MONTH(Plan_take_time) in (1,2,3,4,5)")

dataE <- data[which ]

dataNE <- rbind.data.frame(data[which(data$dept_code == 'DLC'),],data[which(data$dept_code == 'SHE'),],
                          data[which(data$dept_code == 'HRB'),],data[which(data$dept_code == 'CGQ'),])
                          
                          data[which(data$dept_code == 'XIY'),],data[which(data$dept_code == 'URC'),])
                          
                          data[which(data$dept_code == 'ZUH'),],data[which(data$dept_code == 'SZX'),],
                          data[which(data$dept_code == 'CGO'),],data[which(data$dept_code == 'WUH'),],
                          data[which(data$dept_code == 'HAK'),],data[which(data$dept_code == 'SYX'),])

dataSWtE <- rbind.data.frame(dataSW[which(dataSW$arr_code == 'FOC'),],dataSW[which(dataSW$arr_code == 'HGH'),],
                            dataSW[which(dataSW$arr_code == 'TNA'),],dataSW[which(dataSW$arr_code == 'NGB'),],
                            dataSW[which(dataSW$arr_code == 'NKG'),],dataSW[which(dataSW$arr_code == 'HFE'),],
                            dataSW[which(dataSW$arr_code == 'PVG'),],dataSW[which(dataSW$arr_code == 'TAO'),],
                            dataSW[which(dataSW$arr_code == 'SHA'),],dataSW[which(dataSW$arr_code == 'WNZ'),],
                            dataSW[which(dataSW$arr_code == 'XMN'),],dataSW[which(dataSW$arr_code == 'KHN'),])


西南：KMG,KWE,CTU,CKG,
东北：DLC,SHE,HRB,CGQ
西北：INC,ZGC(LHW),XNN,XIY,URC
华北：PEK,HET,HLD,SJW,TSN,TYN,
华南：CAN,HHA(CSX),KWL,NNG,SWA,ZUH,SZX,CGO,WUH,HAK,SYX
华东：FOC,HGH,TNA,NGB,NKG,HFE,PVG,TAO,SHA,WNZ,XMN,KHN


dataN <- rbind.data.frame(data[which(data$dept_code == 'PEK'),],data[which(data$dept_code == 'HET'),],
                           data[which(data$dept_code == 'HLD'),],data[which(data$dept_code == 'SJW'),],
                           data[which(data$dept_code == 'TSN'),],data[which(data$dept_code == 'TYN'),])



SWtSW <- rep('SWtSW',times=3701)
dataSWtSW$group <- SWtSW

channel <- dbConnect(MySQL(), host = "47.93.178.84",username = "tq007",
                     password ="tianqi888_", dbname = 'ap_data')
dbWriteTable(channel,'aiportmatchdata_from44to44_190211',dataSWtSW,append = T,row.names = F)

dbWriteTable(channel, 'aiportmatchdata_from44to44_190211', dataCANKMG,append = T,row.names = F)



write.xlsx(dataEtEall,'华东飞华东全.xlsx')
                  
西南：KMG,KWE,CTU,CKG,
东北：DLC,SHE,HRB,CGQ
西北：INC,ZGC(LHW),XNN,XIY,URC
华北：PEK,HET,HLD,SJW,TSN,TYN,
华南：CAN,HHA(CSX),KWL,NNG,SWA,ZUH,SZX,CGO,WUH,HAK,SYX
华东：FOC,HGH,TNA,NGB,NKG,HFE,PVG,TAO,SHA,WNZ,XMN,KHN

data = dbGetQuery(channel, "select ")


西北：INC,ZGC(LHW),XNN,XIY,URC
HHA CSX
dataE = dbGetQuery(channel, "select plan_dept_time, dept_airport, arr_airport, dept_delay_time, status_code from `aiportmatchdata` where dept_airport in ('ACX','AHJ','AVA','BFJ','BPX','BSD','CKG','CTU','CWJ','DAX','DCY','DIG','DLU','GHN','GYS','HZH','JHG','JIQ','JMJ','JZH','KGT','KJH','KMG','KWE','LJG','LLB','LNJ','LPF','LUM','LXA','LZO','LZY','MIG','NAO','NGQ','PZI','RKZ','SYM','TCZ','TEN','WMT','WNH','WXN','XIC','YBP','YUA','ZAT','ZYI')")

dataEtE <- data[which(data$dept_airport in ('KMG'&'KWE'&'CTU'&'CKG'))]

data = dbGetQuery(channel, "select airportcode3, area_en from ad_airport")

9.19
data1 <- data[which(data$dept_delay_time == 0 & data$status_code == ""),]



data_ <- dbGetQuery(channel, "select Airport_Code, Arr_Probability_180_210, Arr_Probability_210_240, Arr_Probability_240_270, 
                       Arr_Probability_270_300, Arr_Probability_300_330, Arr_Probability_330_360, Arr_Probability_Over360
                       from `airport_prob_8_newProb181217` where Airport_Code in ('CGQ','HRB','DLC','SHE') and Record_Mon = 2 and Record_Day = 8")

data <- dbGetQuery(channel, "select Airport_Code, Dept_Probability_180_210, Dept_Probability_210_240, Dept_Probability_240_270,
                   Dept_Probability_270_300, Dept_Probability_300_330, Dept_Probability_330_360, Dept_Probability_Over360
                   from `airport_prob_8_newProb181217_dept` where Airport_Code in ('CAN','HHA','KWL','NNG','SWA','ZUH',
                   'SZX','CGO','WUH','HAK','SYX') and Record_Mon = 2 and Record_Day = 8")
data <- dbGetQuery(channel, "select * from `aiportmatchdata_from44to44_190211` where dept_airport = 'KMG' and arr_airport = 'CTU'")


data1 = data[13552:13630,]
data2 = data[17050:17130,]

channel <- dbConnect(MySQL(), host = "47.93.178.84",username = "tq007",
                     password ="tianqi888_", dbname = 'ap_data')
dbWriteTable(channel,'aiportmatchdata_from44to44_190211',data00,append = T,row.names = F)

data111 = dbGetQuery(channel, "select dept_airport, arr_airport, plan_dept_time, arr_delay_time, status_code from `aiportmatchdata_from44to44_190211` where `group` = 'SWtN' and MONTH(plan_dept_time) = 7 and DAY(plan_dept_time) in (10,11,12,13,14,15,16,17)")

data00 = dbGetQuery(channel, "select flight_no, dept_airport, arr_airport from `aiportmatchdata_from44to44_190211`")
dataEtNarr = dbGetQuery(channel, "select Area_Code, Record_Mon, Record_Day, Arr_Probability_180_210, Arr_Probability_210_240, Arr_Probability_240_270, Arr_Probability_270_300, Arr_Probability_300_330, Arr_Probability_330_360, Arr_Probability_Over360, Arr_cancel, Arr_dropping, Arr_return from airport_prob_8_newProb190211 where Area_Code = 'EtN'")

dataXMN_SHA <- dbGetQuery(channel, "select airline, prob_date, h3_prob, h4_prob from `airline_prob` where airline = 'XMN-SHA'")

dataKWE_INC <- dbGetQuery(channel, "select airline, prob_date, h3_prob, h4_prob from `airline_prob_avg` where airline = 'KWE-INC'")

data111 <- data1[which(substr(data1$Plan_Dept_Time,7,7)==6 & substr(data1$Plan_Dept_Time,9,9)==1
                       & substr(data1$Plan_Dept_Time,10,10)==6 & data1$Status == "A" & data1$Dept_Code == "CAN"),]

data111a <- data111[which(data111$Dept_Time_Diff >= 180 & data111$Dept_Time_Diff <240 & data111$Status =="A"),]
data111b <- data111[which(data111$Dept_Time_Diff >= 240 & data111$Status == "A"),]


ggplot(data=data1, aes(x=mon_day, y=price, fill=`group`)) +
  geom_point() +
  scale_x_continuous(breaks=c("2019-01-01", "2019-04-01", "2019-07-01", "2019-10-01")) +
  scale_y_continuous(breaks=c(50,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800,850,900,950,100)) +
  labs(x="Date", y="Maximum Coverage", fill="group")
