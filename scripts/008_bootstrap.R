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

pillai_fn <- function(data, i) {
  
  df <- data[i,]

  overlap(F1 = df$F1_df[i], F2 = df$F2_df[i], vowel = df$phoneme[i], method = "pillai")
}

nasal_back_overlap
set.seed(1234)
boot_pillai <- boot::boot(nasal_back, pillai_fn, R = 10000)
(ci_pillai <- boot::boot.ci(boot_pillai, type = "bca"))

ba_fn <- function(data, i) {
  df <- data[i,]

  overlap(F1 = df$F1_df[i], F2 = df$F2_df[i], vowel = df$phoneme[i], method = "BA")
}

set.seed(1234)
boot_ba <- boot::boot(nasal_back, ba_fn, R = 10000)
(ci_ba <- boot::boot.ci(boot_ba, type = "bca"))
