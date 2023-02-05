# Generating data for input into Simulink
library(aimsir17)
library(dplyr)
library(glue)
library(openxlsx)
library(purrr)
library(ggplot2)

MONTH   <- 10
DAY     <- 16
STATION <- "MACE HEAD"
FILE    <- glue("data/A17_SYN_{STATION}_M{MONTH}_D{DAY}.xlsx")
SHEET   <- glue("A17_SYN_{STATION}_M{MONTH}_D{DAY}")
SD_VEL  <- 5
N       <- 3600  # seconds per hour 
SEED    <- 100

o <- observations %>%
       filter(station==STATION, 
              month==MONTH,
              day==DAY) %>%
       select(station, month,day,hour, wdsp)

set.seed(SEED)

syn_data <- o %>% 
             pull(wdsp) %>% 
             map_df(~{
               s <- rnorm(N,.,SD_VEL) # sample 3600 values
               s[s<0] <- 0 # remove negative values
               tibble(wdsp_orig=.,
                      wdsp_syn=s)
             })

syn_data <- syn_data %>%
             mutate(Time=1:nrow(syn_data)) %>%
             select(Time,everything())

ggplot(filter(syn_data,Time<=(3600*10)),aes(x=Time,y=wdsp_syn))+
         geom_point()+geom_line()+
         geom_line(aes(x=Time,y=wdsp_orig),colour="blue")

       
write.xlsx(syn_data,FILE,sheetName = SHEET,rowNames = F)

