# Generating data for input into Simulink
library(aimsir17)
library(dplyr)
library(glue)
library(openxlsx)

MONTH   <- 10
STATION <- "MACE HEAD"
FILE    <- glue("data/A17_{STATION}_{MONTH}_HOUR.xlsx")
SHEET   <- glue("A17_{STATION}_{MONTH}")

o <- observations %>%
       filter(station==STATION, month==10) 

o <- mutate(o,Time=1:nrow(o)) %>%
       select(Time,station,month,day,rain:wdsp)
       
write.xlsx(o,FILE,sheetName = SHEET,rowNames = F)