#----------------------------------------------------------------------------------------
# File: 003_dataProcessing.R
# Project: Bolognese
# Author: Mykel Brinkerhoff
# Date: 2026-08-21 (F)
# Description: What does this script do?
#
# Usage:
#   Rscript .R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------
mono <- c(
        "i",
        "iː",
        "ɛː",
        "e",
        "eː",
        "u",
        "uː",
        "ɔː",
        "o",
        "oː",
        "ɑ",
        "a",
        "aː",
        "æ"
      )

long <- c(
        "iː",
        "ɛː",
        "eː",
        "uː",
        "ɔː",
        "oː",
        "aː"
      )

vwls_stress <- bolognese |> 
  dplyr::filter(
    stress == TRUE,
    phoneme %in% mono
  ) |> 
  dplyr::mutate(
    vowel_length = dplyr::case_when(
      phoneme %in% long ~ "long",
      TRUE ~ "short"
    )
  )

(vowel_count <- table(vwls_stress$phoneme))

(vowel_environment <- table(vwls_stress$phoneme, vwls_stress$environment))



vwls_unstress <- bolognese |> 
  dplyr::filter(
    stress == 0, 
    phoneme %in% mono
  )

(vwl_unstress_count <- table(vwls_unstress$phoneme))

(vwl_unstress_environment <- table(vwls_unstress$phoneme, vwls_unstress$environment))

(table(vwls_stress$phoneme, vwls_stress$speaker))
