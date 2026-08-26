#----------------------------------------------------------------------------------------
# File: 007_overlapAnalysis.R
# Project: Bolognese
# Author: Mykel Brinkerhoff
# Date: 2026-08-22 (F)
# Description: What does this script do?
#
# Usage:
#   Rscript .R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### create the environments
lateral_env <- vwls_norm |> 
  dplyr::filter(
    environment == "prelateral"
  )

nasal_env <- vwls_norm |> 
  dplyr::filter(
    environment == "prenasal"
  )

rhotic_env <- vwls_norm |> 
  dplyr::filter(
    environment == "prerhotic"
  )

### vowels 
central_back_all <- vwls_norm |> 
  dplyr::filter(
    phoneme %in% c("a", "ɑ")
  )

front_central_all <- vwls_norm |> 
  dplyr::filter(
    phoneme %in% c("a", "æ")
  )

front_back_all <- vwls_norm |> 
  dplyr::filter(
    phoneme %in% c("ɑ", "æ")
  )

front_central_overlap <- front_central_all |>
  dplyr::summarise(
    bhatt = overlap(F1_df, F2_df, vowel = phoneme, method = "BA"),
    bhatt_dist = -log(overlap(F1_df, F2_df, vowel = phoneme, method = "BA")),
    pillai = overlap(F1_df, F2_df, vowel = phoneme, method = "pillai"),
    pillai_p = manova_p(cbind(F1_df, F2_df) ~ phoneme),
    pillai_cutoff = exp(1) / (nrow(front_central_all) / 2)
  )
front_central_overlap

front_back_overlap <- front_back_all |>
  dplyr::summarise(
    bhatt = overlap(F1_df, F2_df, vowel = phoneme, method = "BA"),
    bhatt_dist = -log(overlap(F1_df, F2_df, vowel = phoneme, method = "BA")),
    pillai = overlap(F1_df, F2_df, vowel = phoneme, method = "pillai"),
    pillai_p = manova_p(cbind(F1_df, F2_df) ~ phoneme),
    pillai_cutoff = exp(1) / (nrow(front_back_all) / 2)
  )
front_back_overlap

central_back_overlap <- central_back_all |>
  dplyr::summarise(
    bhatt = overlap(F1_df, F2_df, vowel = phoneme, method = "BA"),
    bhatt_dist = -log(overlap(F1_df, F2_df, vowel = phoneme, method = "BA")),
    pillai = overlap(F1_df, F2_df, vowel = phoneme, method = "pillai"),
    pillai_p = manova_p(cbind(F1_df, F2_df) ~ phoneme),
    pillai_cutoff = exp(1) / (nrow(central_back_all) / 2)
  )
central_back_overlap

nasal_back <- nasal_env |> 
  dplyr::filter(
    phoneme %in% c("a", "ɑ")
  )

nasal_front <- nasal_env |>
  dplyr::filter(
    phoneme %in% c("a", "æ")
  )



nasal_front_overlap <- nasal_front |> 
  dplyr::summarise(
    bhatt = overlap(F1_df, F2_df, vowel = phoneme, method = "BA"),
    bhatt_dist = -log(overlap(F1_df, F2_df, vowel = phoneme, method = "BA")),
    pillai = overlap(F1_df, F2_df, vowel = phoneme, method = "pillai"),
    pillai_p = manova_p(cbind(F1_df, F2_df) ~ phoneme),
    pillai_cutoff = exp(1) / (nrow(nasal_front) / 2)
  )
nasal_front_overlap

nasal_back_overlap <- nasal_back |> 
  dplyr::summarise(
    bhatt = overlap(F1_df, F2_df, vowel = phoneme, method = "BA"),
    bhatt_dist = -log(overlap(F1_df, F2_df, vowel = phoneme, method = "BA")),
    pillai = overlap(F1_df, F2_df, vowel = phoneme, method = "pillai"),
    pillai_p = manova_p(cbind(F1_df, F2_df) ~ phoneme),
    pillai_cutoff = exp(1) / (nrow(nasal_back) / 2)
  )
nasal_back_overlap

cor(nasal_front$F1_df,nasal_front$F2_df)

ba <- function(data, vowel1 = "KIT", vowel2 = "DRESS") {

  d <- data |>
    dplyr::filter(phoneme %in% c(vowel1, vowel2)) |>
    dplyr::mutate(
      vowel = factor(phoneme, levels = c(vowel1, vowel2))
    )

  xy <- split(
    d[, c("F1", "F2")],
    d$vowel
  )

  overlap <- kerneloverlap(
    lapply(xy, function(x) {
      kernelUD(x)
    }),
    method = "BA"
  )

  overlap[2, 1]
}

ba(front_central_all, vowel1 = "æ", vowel2 = "a")
