# Generating data for input into Simulink
library(aimsir17)
library(dplyr)
library(glue)
library(openxlsx)

MONTH   <- 10
STATION <- "MACE HEAD"
FILE    <- glue("data/A17_{STATION}_M{MONTH}.xlsx")
SHEET   <- glue("A17_{STATION}_M{MONTH}")

o <- observations %>%
       filter(station==STATION, month==10) 

o <- mutate(o,Time=1:nrow(o)) %>%
       select(Time,month,day,hour,rain:wdsp)

ggplot(o,aes(x=Time,y=temp))+geom_point()+geom_line()
       
write.xlsx(o,FILE,sheetName = SHEET,rowNames = F)

