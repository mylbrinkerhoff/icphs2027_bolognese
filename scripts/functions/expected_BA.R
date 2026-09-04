# Formula for finding the expected BA for samples of equal and unequal size based on Bernardi (2026).

expected_BA <- function(df, vowel1, vowel2) {
  
  # Find the sample size 
  n1 <- sum(df$phoneme == vowel1)
  n2 <- sum(df$phoneme == vowel2)

  #calculate the mean of the samples
  m <- mean(n1,n2)

  # Calculate expected BA for equal sized samples
  BA_even <- 0.142120 + 0.527779 * atan(0.227416 * m)

  # Check if the sample are equal in size and return BA_even if TRUE and calculate residual and add that to BA_even if FALSE
  if (n1==n2) {

    return(BA_even)    
  
  } else {

    #find the imbalance ratio between the smallest and the largest
    ratio <- min(n1, n2)/max(n1, n2)

    #find the absolute imbalance between n1, n2
    abs_imbalance <- abs(n1-n2)

    #calculate residuals
    residual <- -0.06822 + (0.06197 * ratio) - (0.000547 * abs_imbalance) + (0.002892 * ratio *  abs_imbalance)

    # Add the residuals to BA_even for expected BA for uneven
    BA_uneven <- BA_even + residual

    return(BA_uneven)
  }
}
