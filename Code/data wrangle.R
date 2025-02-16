library(dplyr)
library(tidyr)
library(ggplot2)

flights = International_airline_activity_Flights_Seats_0323
flights
flights %>% filter(month )
sg <- flights[flights$COUNTRY == 'Singapore',]
qqline(sg$SEATS_IN)

sg <- sg[rowSums(is.na(sg)) == 0] # Removes 'junk' columns
sg <- filter(sg, rowSums(is.na(sg)) == 0) # Clears any rows where there is at least 1 'NA' entry
sg <- filter(sg, sg$CAL_Y >= 2016)

mean(sg$SEATS_IN)
q = (pnorm(sg$SEATS_IN, mean(sg$SEATS_IN), sd(sg$SEATS_IN)))
plot(sg$SEATS_IN)

flights <- flights[rowSums(is.na(flights)) == 0,] 

ggplot(flights$COUNTRY, flights$PAX_IN)

