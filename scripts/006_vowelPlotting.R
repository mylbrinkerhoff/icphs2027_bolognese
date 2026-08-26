#----------------------------------------------------------------------------------------
# File: 006_vowelPlotting.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-08-21 (Su)
# Description:
#   - Plots vowel space based on raw Hz and each normalization
#   - Each vowel is plotted as a point and there is a 1sd elipsis
#     around each centroid
#
# Usage:
#   Rscript 006_vowelPlotting.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# Vowels in Hz
vwls_norm |> 
  ggplot2::ggplot(aes(
    x = F2,
    y = F1,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = vwls_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) +
  ggplot2::labs(
    title = "Vowels in Hz",
    x = "F2 (Hz)",
    y = "F1 (Hz)"
  ) +
  ggplot2::theme_bw() -> vwls_hz
vwls_hz

ggplot2::ggsave(
  filename = here::here("output", "figs", "vowels_hz.png"),
  plot = vwls_hz,
  dpi = 600,
  units = "in",
  width = 6,
  height = 4,
)

# Vowels in Nearey
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_lm,
    y = F1_lm,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = vwls_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_grid(.~vowel_length) +
  ggplot2::labs(
    title = "Nearey Normalized Vowels ",
    x = "F2 (Nearey)",
    y = "F1 (Nearey)"
  ) +
  ggplot2::theme_bw() -> vwls_neary
vwls_neary

ggplot2::ggsave(
  filename = here::here("output", "figs", "vowels_neary.png"),
  plot = vwls_neary,
  dpi = 600,
  units = "in",
  width = 6,
  height = 4,
)

# Vowels in ∆F
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) + 
  ggplot2::labs(
    title = "∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_deltaF
vwls_deltaF

vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ speaker) + 
  ggplot2::labs(
    title = "∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_speaker
  
ggplot2::ggsave(
    filename = here::here("output", "figs", "vowels_speaker.png"),
    plot = vwls_speaker,
    dpi = 600,
    units = "in",
    width = 6,
    height = 4
  )

ggplot2::ggsave(
  filename = here::here("output", "figs", "vowels_deltaF.png"),
  plot = vwls_deltaF,
  dpi = 600,
  units = "in",
  width = 6,
  height = 4,
)

vwls_norm |>
  dplyr::filter(
    environment == "prelateral"
  ) |> 
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) + 
  ggplot2::labs(
    title = "Prelateral Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_prelateral
vwls_prelateral

vwls_norm |>
  dplyr::filter(
    environment == "prenasal"
  ) |> 
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) + 
  ggplot2::labs(
    title = "Prenasal Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_prenasal
vwls_prenasal

vwls_norm |>
  dplyr::filter(
    environment == "prerhotic"
  ) |> 
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) + 
  ggplot2::labs(
    title = "Prerhotic Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_prerhotic
vwls_prerhotic

vwls_norm |>
  dplyr::filter(
    environment == "elsewhere"
  ) |> 
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = phoneme,
    label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::facet_wrap(. ~ vowel_length) + 
  ggplot2::labs(
    title = "Elsewhere Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_elsewhere
vwls_elsewhere

