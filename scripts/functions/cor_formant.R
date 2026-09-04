cor_formant <- function(df, F1, F2) {
  
  # Correlation between F1 and F2
  cor <- stats::cor(
    df$F1,
    df$F2,
    use = "complete.obs"
  )

}
