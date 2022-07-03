# author: bbaasan
# title:
# date: Jul 2, 2022

library(tidyverse)

list.files('../data/total_goods')

get_total_goods_func <- function(path){
  df = read_csv(path) %>% 
  select(Year, `Trade Flow`, Reporter, `Reporter ISO`, `Trade Value (US$)`) %>% 
  mutate(Reporter = if_else(Reporter == 'Other Asia, nes', 'Taiwan', Reporter)) %>% 
  mutate(`Reporter ISO` = replace_na(`Reporter ISO`, 'TWN')) %>% 
  filter(Reporter != 'So. African Customs Union',
         `Trade Flow` == 'Export') %>% # so to focus on the export part 
  rename(ReporterIso = `Reporter ISO`,  Val = `Trade Value (US$)` ) %>% 
  select(Year, `ReporterIso`, Val)
  return(df)
  }

ninetySeven_ZeroOne <- get_total_goods_func('../data/total_goods/comtrade31.csv')
zeroTwo_ZeroSix <- get_total_goods_func('../data/total_goods/comtrade30.csv') 
zeroSeven_Eleven <- get_total_goods_func('../data/total_goods/comtrade29.csv') 
twelve_sixteen <- get_total_goods_func('../data/total_goods/comtrade28.csv')
sevnteen_twnetyOne <- get_total_goods_func('../data/total_goods/comtrade27.csv')

