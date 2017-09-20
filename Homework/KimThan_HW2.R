CSU = read.csv("data/california-state-university-2015.csv")

# jobs = levels(CSU$Job.Title)
# jobs[grep(pattern = "ATHLETIC TRAINER", x = jobs)]
# ATHLETIC TRAINER I - 12 MONTH, ATHLETIC TRAINER II - 12 MONTH, HEAD ATHLETIC TRAINER - 12 MONTH

AT1 = subset(CSU, Job.Title == "ATHLETIC TRAINER I - 12 MONTH")
AT2 = subset(CSU, Job.Title == "ATHLETIC TRAINER II - 12 MONTH")
AT3 = subset(CSU, Job.Title == "HEAD ATHLETIC TRAINER - 12 MONTH")

ATAll = rbind(AT1, AT2, AT3)

ATAll$Job.Title = factor(ATAll$Job.Title, levels = c("ATHLETIC TRAINER I - 12 MONTH", "ATHLETIC TRAINER II - 12 MONTH",
                                                     "HEAD ATHLETIC TRAINER - 12 MONTH" ))

boxplot(Base.Pay~Job.Title, data = ATAll, names = c("AT I", "AT II", "Head AT"), 
        main = "CSU Athletic Trainer (AT) Base Pay in 2015",
        xlab = "Job Title", 
        ylab = "Base Pay (USD)",
        col = c("light blue1", "skyblue", "steelblue"))

print(aggregate(Base.Pay~Job.Title, data = ATAll, FUN = mean))
# Include print to have it automatically print when sourcing



################################################################

# Alternative by Dr. Miller

sal = read.csv("data/california-state-university-2015.csv")

# Write them to a separate vector
jobs = levels(sal$Job.Title)

# Search for certain terms in the available job titles
jobsub = jobs[grep(pattern = 'PAYROLL', x = jobs)]
jobsub #show results 

# Subset out only persons with a Job.Title that appears in 'jobsub'
salsub = sal[sal$Job.Title %in% jobsub, ]

# Use formula method to divide boxplots up by Job.Title 
# Make with shorter names for each group 
# Remember you need to specify these in the same order as the factor levels are arranged
boxplot(Base.Pay~Job.Title, data = salsub, ylab = 'Salary', 
        names = c('Payroll I', 'Payroll II', 'Payroll III', 'Payroll Trainee'))

# Re-order factor levels. Spelling matters immensely here, must match all original levels
salsub$Job.Title = factor(salsub$Job.Title,
                          levels = c('PAYROLL TECHNICIAN TRAINEE', 'PAYROLL TECHNICIAN I', 'PAYROLL TECHNICIAN II', 
                                     'PAYROLL TECHNICIAN III'))
boxplot(Base.Pay~Job.Title, data = salsub, ylab = 'Salary',
        names = c('Payroll I', 'Payroll II', 'Payroll III', 'Payroll Trainee'))
