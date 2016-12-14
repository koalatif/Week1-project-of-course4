# Week1-project-of-course4
Base_C4_W1 <- 
  read.table("C:/Users/USER/Desktop/project_C4_W1/exdata_2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",
             header=TRUE, sep=";", na.strings="NA", dec=".", strip.white=TRUE)
activepower=Base_C4_W1[, 3]
as.numeric(Base_C4_W1$Global_active_power)
as.numeric(activepower)
with(Base_C4_W1, hist(as.numeric(activepower), scale="frequency", breaks="Sturges", 
                      col="red"))
date=Base_C4_W1[, 1]





date=Base_C4_W1$Date
time=Base_C4_W1$Time
mydate=dmy(date)
Base_C4_W1$mydate <- with(Base_C4_W1, dmy(date))
class(mydate)
mydays=weekdays(mydate)
mydays

Base_C4_W1$mydays <- with(Base_C4_W1, weekdays(mydate))
mymonths=months(mydate)
mymonths
myyears=year(mydate)
myyears

set.seed(123)
data <- data.frame(Date = Base_C4_W1$mydate ,
                   Time = format(Base_C4_W1$Time ,
                   Global_active_power = aggregate(data$Global_active_power, by(mydays), FUN=sum)))

data$datetime <- as.POSIXct(paste(data$Date,data$Time),tz="UCT")
plot.ts(data$datetime,Base_C4_W1$Global_active_power,type="l")
 
 
