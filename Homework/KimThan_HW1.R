CSU = read.csv("data/california-state-university-2015.csv")

boxplot(CSU$Base.Pay[CSU$Job.Title == "INSTRUCTIONAL FACULTY - ACADEMIC YEAR"], 
        main = "CSU Instructional Faculty (Academic Year) Base Pay in 2015", 
        ylab = "Base Pay (USD)")