threshold_BA <- function(formant_cor, BA_expected) {

  return(-0.019907 + (-0.242121 * formant_cor) + (1.017491 * BA_expected) +  (0.277828 * formant_cor * BA_expected))
  
}