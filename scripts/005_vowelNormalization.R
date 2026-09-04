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

vwls_norm <- vwls_clean |>
  tidynorm::norm_nearey(
    F1:F4, 
    .by = speaker
  ) |> 
  tidynorm::norm_deltaF(
    F1:F4, 
    .by = speaker
  )

### Locating the centroids of each vowel in raw Hz, and each
### normalization
vwls_means <- vwls_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = phoneme
  )


readr::write_csv(vwls_norm, file = here::here("data", "intermediate", "vowels_norm.csv"))
