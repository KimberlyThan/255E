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

aggregate(SVL.mm~Sex, data = svl1, FUN = mean) 

jobs = levels(df$Job.Title)

jobs[grep(pattern = "ATHLETIC TRAINER", x = jobs)]
