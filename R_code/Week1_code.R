q = 5   # my comment
Q = 10
Q1 = 1
Q2 = 234
Q3 = 10234235236

# Add two variables 
q + Q1


myvector = c(1, 20, 300, 40, 5, 0.6, 7.1, 8.23, 9.45, 10.678, 11, 45, 103)
myvector[myvector == 20]
length(myvector[myvector == 20])

head(myvector)
tail(myvector)
min(myvector)
max(myvector)
mean(myvector)
sd(myvector)

df = read.csv(file.choose() )
str(df)
df$Sex
df$Snout.Vent.Length..mm.[(df$Snout.Vent.Length..mm. > 79.1) & 
                            (df$Snout.Vent.Length..mm. < 88.9)]
df$Sex[2]
df[2, 1:3]
df[2, ]
df[ , 1]



df1 = read.csv(file.choose())

output = vector(length = 0)

for (i in 1:nrow(df1)){
  if (df1$Type[i] == "Min") {
    print(df1$Value[i]) # still printing out 
    output = c(output, df1$Value[i]) # appending onto output
  }
}
output
mean(output)


output2 = df1$Value[ df1$Type == "Min" ]

hist(df$Snout.Vent.Length..mm.)
dotchart(df$Snout.Vent.Length..mm., 
         groups = df$Sex,
         pch = 20,
         xlab = "Snout Vent Length, mm",
         ylab = "Sex, Male or Female",
         col = 'red',
         cex = 1.5)
