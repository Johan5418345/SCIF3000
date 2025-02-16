library(dplyr)
library(tidyr)
library(ggplot2)



## Mutate data
#
bitre_data <- bitre_data[-c(1,2,3), ]
colnames(bitre_data) <- bitre_data[1, ]
bitre_data <- bitre_data[-1, -c(12,13,14,15,16,17,18,19,20,21,22,23)]
bitre_data <- subset(bitre_data, !(bitre_data$`PAX IN` == ".."))
bitre_data <- subset(bitre_data, !(bitre_data$`PAX IN` == "(d)"))
bitre_data <- subset(bitre_data, !(bitre_data$`SEATS IN` == ".."))

# check and modify the type of cols
str(bitre_data$`PAX IN`)
str(bitre_data$`SEATS IN`)
bitre_data$`PAX IN` <- as.numeric(gsub(",", "", bitre_data$`PAX IN`))
str(bitre_data$`PAX IN`)
bitre_data$`SEATS IN` <- as.numeric(gsub(",", "", bitre_data$`SEATS IN`))
str(bitre_data$`SEATS IN`)
bitre_data$`PAX OUT` <- as.numeric(gsub(",", "", bitre_data$`PAX OUT`))
str(bitre_data$`PAX OUT`)
bitre_data$`SEATS OUT` <- as.numeric(gsub(",", "", bitre_data$`SEATS OUT`))
str(bitre_data$`SEATS OUT`)
bitre_data$MONTH <- as.Date(paste0("01-", bitre_data$MONTH), format = "%d-%b-%y")
str(bitre_data$MONTH)

# adding a new column to calculate load_factor
bitre_data$Load_factor <- round(bitre_data$`PAX IN` / bitre_data$`SEATS IN`, 3)