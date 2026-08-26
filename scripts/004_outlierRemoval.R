#----------------------------------------------------------------------------------------
# File: .R
# Project: 
# Author: Mykel Brinkerhoff
# Date: YYYY-MM-DD (M-Su)
# Description: What does this script do?
#
# Usage:
#   Rscript .R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### Keep 95% of the vowels based on F1, F2
vwls_clean <- vwls_stress |> 
  dplyr::mutate(
    is_outlier = joeyr::find_outliers(F1, F2, keep = 0.95),
    .by = c("phoneme")
  ) |> 
  dplyr::filter(
    !is_outlier
  )

table(vwls_clean$phoneme)

table(vwls_clean$phoneme, vwls_clean$environment)
