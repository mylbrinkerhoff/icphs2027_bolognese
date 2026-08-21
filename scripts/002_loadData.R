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
bolognese <- readr::read_csv(here::here(
  "data",
  "raw",
  "master.csv"
))
