library(readxl)

setwd("C:/Users/kimthangg/255E/")

df = read_excel(path = "data/Reinhart-Rogoff.xlsx", na = 'n.a.')

mean(df$'90 or above', na.rm = TRUE)

mean(df$'90 or above'[1:15], na.rm = TRUE)

################################################################

df = read.csv('data/Messy_means2.csv')

dotchart(df$Value)
# Dotchart shows one very small value and only very large value that are suspect. Let's remove those two values, turned to NA.

# Shows what the minimum value is 
# min(df$Value)

# which row is the minimum
which.min(df$Value)

# Set the minimum value in the dataset to NA 
df[which.min(df$Value, na.rm = TRUE, 'Value')] = NA # na.rm = TRUE ignores NA if it were the minimum
# alternative
df[48, 'Value'] = NA

# Set the maximum value in the dataset to NA 
df[which.max(df$Value), 'Value'] = NA
# This is the same as above, but should use above instead
df[22, 'Value'] = NA

# New dotchart should showa nice cluster of real data points
dotchart(df$Value)

# kind of useless
df$Type == 'Mean'

# df[row, column] when using brackets 
# Method 1 
df$Value[df$Type == 'Mean']
# Method 2
df[df$Type == 'Mean', 'Value']
# Method 3
df[df$Type == 'Mean', 3]

mymeans = df[df$Type == 'Mean', 'Value']
mean(mymeans)

################################################################

library(readxl)

df = read_excel("data/Heating_trial_info.xlsx")
str(df)

# Some of these columns (3-8) should be factors.
df[, 3:8] = lapply(df[, 3:8], factor) 

# Use levels() to see all levels of a categorical factor 
levels(df$TCchannel)
levels(df$MusselTagID)
levels(df$`Gaping?`)

# Use summary() to show counts of factor columns 
summary(df)
summary(df$MusselTagID)

# summary() used on numeric columns show quartiles 
summary(df$TrialNumber) # useful to see min. and max. trial number

# Use table() to show counts of categorical variables in a column 
table(df$AliveDead)
table(df$TCLocation)

# Use xtabs() to make a contigency table of counts of factors 
xtabs(~AliveDead + MusselTagID, data = df) 
# For 3 columns, you get a 3-dimensional table 
xtabs(~AliveDead + MusselTagID + TCLocation, data = df)

# Read in one SVLCallisaurus file
svl1 = read.csv('data/SVLCallisaurus.csv')
str(svl1)

# Read in the other 
svl2 = read.csv('data/SVLCallisaurus2.csv')
str(svl2)

# Both data frames, svl1 and svl2, share the same column tiles and order columns, 
# so they can be put together. 

svlAll = rbind(svl1, svl2)

# Change column names for svl1
colnames(svl1) = c('Animal.ID', 'Sex', 'SVL.mm')
colnames(svl2) = c('Animal.ID', 'Sex', 'SVL.mm')
svlAll = rbind(svl1, svl2)

# Save the joined files as a new csv file 
write.csv(x = svlAll, file = 'data/SVLjoined.csv', row.names = FALSE)

################################################################

# y ~ x, want y value as a function of x like in algebra y = mx + b
boxplot(SVL.mm~Sex, data = svlAll, xlab = 'Sex',
        ylab = 'Snout-vent length, mm')

################################################################

df = read.csv("data/california-state-university-2015.csv")

levels(df$Job.Title)

# RESEARCH TECHNICIAN I 
# RESEARCH TECHNICIAN II 
# RESEARCH TECHNICIAN III

# dfsub = rbind(rt1, rt2, rt3)
# dfsub = droplevels(dfsub)
# Base.Pay~Job.Title

svl1$Sex = factor(svl1$Sex, levels = c('M', 'F'))
# Wrong because lowercase f; spelling and spaces must match completely
# svl1$Sex = factor(svl1$Sex, levels = c('M', 'f'))

boxplot(SVL.mm~Sex, data = svl1, 
        names = c('Male', 'Female'))

# splits the data into subsets, computes summary statistics for each, and returns the results
aggregate(SVL.mm~Sex, data = svl1, FUN = mean) 

jobs = levels(df$Job.Title)

jobs[grep(pattern = "ATHLETIC TRAINER", x = jobs)]
