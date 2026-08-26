#----------------------------------------------------------------------------------------
# File: 002_loadData.R
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

### Load the data for bolognese
bolognese <- readr::read_csv(
  here::here(
    "data",
    "raw",
    "master.csv"
  ), 
  na = c("", NA),
  col_types = list(
    phoneme = "c",
    stress = "l",
    word = "f",
    time = "n",
    duration = "n",
    nextSeg = "f",
    F1 = "n",
    F2 = "n",
    F3 = "n",
    F4 = "n",
    speaker = "f", 
    lesson = "f"
  )
) |> 
  dplyr::mutate(
    environment = dplyr::case_when(
      nextSeg %in% c("ʎ", "l", "lː") ~ "prelateral", 
      nextSeg %in% c("m", "mː", "n", "nː", "ɲ", "ɲː", "ŋ", "ŋː") ~ "prenasal",
      nextSeg %in% c("rː", "r") ~ "prerhotic",
      TRUE ~ "elsewhere"
    )
  )

head(bolognese)
glimpse(bolognese)
