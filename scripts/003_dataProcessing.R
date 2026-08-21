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

vwls <- bolognese |> 
  dplyr::filter(
    stress == 1,
    phoneme %in% 
      c(
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
  )

vowel_count <- table(vwls$phoneme)

vowel_environment <- table(vwls$phoneme, vwls$nextSeg)
