# My first R Command to plug in my data set
# Put in name of your new appraisal data set (ADF).
# If your field names match, this will generate the price index.

DataSet0 <- EagleSFR 
# ------------------------------------------------------

# START HERE
# Some Base R commands
names(DataSet0)
plot(DataSet0$DateSale, DataSet0$PriceSale) 
hist(DataSet0) # An error message will appear -- Why?
hist(DataSet0$PriceSale) 
hist(DataSet0$PriceSale, breaks = 8)

# install.packages library and ggthemes, or use menu on the right

# load graphs and themes packages, number format (to this project/assignment)
library(ggplot2)
library(ggthemes)
options(scipen = 999)

# Run the graphs algorithm
ggplot(DataSet0, aes(DateSale, PriceSale)) +
  geom_point() +
  geom_smooth(method = "lm", formula = y~poly(x,1), se = F) +
  geom_smooth(method = "lm", formula = y~poly(x,3), se = F, color = "red") +
  theme_economist() +
  coord_cartesian(ylim = c(0, 2500000)) +      #Rene Descartes
  ggtitle("Market Selection and Price Trend")


#     ---------------------------------------------------------
#   |   >>>>>  DataSet0 <- MyNewAppraisalDataFrame  <<<<<   |
#           Fieldnames (column headers) must be identical
#     ---------------------------------------------------------

  
  # We install and load the date format package
  # Convert Microsoft dates to R dates
   
library(lubridate)  # a part of the tidyverse package
DataSet0$DateSale <- ymd(DataSet0$DateSale)

#Calculate $/day adjustment)
DailyAdjust <- lm(formula = PriceSale ~ DateSale, data = DataSet0) 

DailyAdjust
