# Showign how to store R function in their own script file 

mySE <- function(x){
  # Assume the input x is a vector of numbers
  # First caculate the variance
  myvar = var(x)
  # The calculate the number of values in the sample 
  myn = length(x)
  # Next calcuate the square root of the variance divide by sample size
  mySE = sqrt( myvar / myn )
  # The value returned will be the last object created in the fucntion, in this case mySE
  mySE # repeating just the last variable here will cause the result to print out when run

