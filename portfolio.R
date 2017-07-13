#Import prices and calculate returns for 5 assets and construct a portfolio.
#Calculate the standard deviation of monthly portfolio returns using three methods:
#Compare those to the standard deviation of monthly SPY returns.

require(dplyr)
require(tidyquant)

#Step 1-ETFs-Exchange Traded Fund
# we import prices and calculate returns for the 5 ETFs to be used in our portfolio. 
#Those are AGG (a US bond fund), DBC (a commodities fund), 
#EFA (a non-US equities fund), SPY (an S&P500 ETF), VGT (a technology fund).



etfs<-sort(c("SPY","VGT","EFA","DBC", "AGG"))
etfs



prices <- 
  getSymbols(symbols, src = 'google', from = "2013-01-01", 
             auto.assign = TRUE, warnings = FALSE) %>% 
  map(~Cl(get(.))) %>%
  reduce(merge) %>% 
  `colnames<-`(symbols)
