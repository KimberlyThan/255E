# Week 2

# Setting my working directory on this computer
setwd("C:/Users/kimthangg/255E/R_code")

df = read.csv("../data/SVLCallisaurus.csv")

# install.packages('xlsx') # get access to read.xlsx function
library(xlsx)

ht = read.xlsx("../data/Heating_trial_info.xlsx", sheetIndex = 1)

# fail = read.csv("C:\Users\kimthangg\255E\data\SVLCallisaurus.csv") # use "/" instead or "\\"

# Import tab-delimited data file 

limp = read.table(file = '../data/LimpetRaspingRate.txt', header = TRUE, sep = "\t")

boxplot(limp$Growth)

df = read.table("../data/SVLCallisaurus.csv", header = TRUE, sep = ",") # if header = FALSE, it would incorrectly identify header as values
                                                                        # if there is no header, it will be assigned as V1, V2, V3, etc.

waves = read.fwf("../data/CDIP_158_201702.txt")

test = readLines(con = "../data/CDIP_158_201702.txt")

############################# Plotting ############################# 

dotchart(limp$Temperature)
dotchart(limp$Temperature, groups = limp$Species, xlab = 'Temperature, C')

limp$Species == 'pelta' # printed out for all 32 observations, TRUE for pelta, FALSE for everything else 

limp$Temperature[limp$Species == "pelta"] # printed out temperature of peltas

# plotting 1 species
plot(x = limp$Temperature[limp$Species == "pelta"], y = limp$RaspRate[limp$Species == "pelta"], 
     xlab = "Temperature, C", 
     ylab = "Rasping Rate, rasps/minute", 
     col = "forestgreen", # color() for color choices; col = 1 - 8; col = rgb(0.5, 1, 0, 0.5) where 4th argument (aka alpha) is transparency
     pch = 2, # point character; values: 1-25; default is open circles
     # xlim = c(4,22), # manually adjusting limits 
     # ylim = c(5,35)) # have to adjust limits because they default to the ranges of the first species
     xlim = range(limp$Temperature), # automating scaling of plot 
     ylim = range(limp$RaspRate))

# adding on 2nd species  
points(x = limp$Temperature[limp$Species == "scabra"], y = limp$RaspRate[limp$Species == "scabra"], 
     xlab = "Temperature, C", 
     ylab = "Rasping Rate, rasps/minute", 
     col = "purple", 
     pch = 19) 

legend(x = 5.8, y = 30.5, legend = c("pelta", "scabra"), 
       pch = c(2, 19), # have to define it in the same order
       col = c("forestgreen", "purple"),
       title = 'Species')


