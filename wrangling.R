library(GetFREData)
library(tidyverse)
help(package = "GetFREData")
df_info <- get_info_companies()
glimpse(df_info)
CD_CVM <- 
df_info %>% 
  filter(SIT_REG == "ATIVO") %>% 
  pull(CD_CVM)
teste <-  CD_CVM[5:10]


l_fre <- get_fre_data(companies_cvm_codes = teste[1],
                      fre_to_read = 'last',
                      first_year = 2021,
                      last_year = 2021, 
                      cache_folder = tempdir())

l_fre$df_mkt_value$mkt.avg.value
l_fre$df_compensation$qtd.members
l_fre$df_compensation$total.value.remuneration
l_fre$df_dividends_details$payout 
l_fre$df_dividends_details$div.yeild.on.equity
l_fre$df_dividends_details$net.profit
l_fre$df_compensation_summary %>% View()
l_fre$df_board_composition
l_fre$df_committee_composition %>% View()
