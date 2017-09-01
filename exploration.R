library(gdata)
library(lubridate)
activityPort<-read.xls("data/Bezoeken_HSR.xls")
head(activityPort)
dim(activityPort)


#plot of the berch number use in the time frame (sept 2013)
barplot(table(activityPort$BVA_BERTH_NR))
barplot(table(activityPort$BVD_BERTH_NR))


#fixing the time columns
is.na(activityPort$BVD_BERTH_ATA)<-activityPort$BVD_BERTH_ATA==""
is.na(activityPort$BVD_BERTH_ATD)<-activityPort$BVD_BERTH_ATD==""
is.na(activityPort$BVD_BERTH_ETD)<-activityPort$BVD_BERTH_ETD==""
is.na(activityPort$BVD_BERTH_ETA)<-activityPort$BVD_BERTH_ETA==""

is.na(activityPort$BVA_BERTH_ATA)<-activityPort$BVA_BERTH_ATA==""
is.na(activityPort$BVA_BERTH_ATD)<-activityPort$BVA_BERTH_ATD==""
is.na(activityPort$BVA_BERTH_ETD)<-activityPort$BVA_BERTH_ETD==""
is.na(activityPort$BVA_BERTH_ETA)<-activityPort$BVA_BERTH_ETA==""

#convert to datetime object
activityPort$BVD_BERTH_ETD<-as_datetime(as.character(activityPort$BVD_BERTH_ETD))
activityPort$BVD_BERTH_ETA<-as_datetime(as.character(activityPort$BVD_BERTH_ETA))
activityPort$BVD_BERTH_ATD<-as_datetime(as.character(activityPort$BVD_BERTH_ATD))             
activityPort$BVD_BERTH_ATA<-as_datetime(as.character(activityPort$BVD_BERTH_ATA))
activityPort$BVA_BERTH_ETD<-as_datetime(as.character(activityPort$BVA_BERTH_ETD))
activityPort$BVA_BERTH_ETA<-as_datetime(as.character(activityPort$BVA_BERTH_ETA))
activityPort$BVA_BERTH_ATD<-as_datetime(as.character(activityPort$BVA_BERTH_ATD))             
activityPort$BVA_BERTH_ATA<-as_datetime(as.character(activityPort$BVA_BERTH_ATA))

#time spent inside the port in minutes
activityPort$actualStayArrB<-as.numeric((activityPort$BVA_BERTH_ATD-activityPort$BVA_BERTH_ATA)/60)
activityPort$actualStayDepB<-as.numeric((activityPort$BVD_BERTH_ATD-activityPort$BVD_BERTH_ATA)/60)
hist(activityPort$actualStayArrB,breaks = 200,xlim = c(0,10000))
hist(activityPort$actualStayDepB,breaks = 200)






