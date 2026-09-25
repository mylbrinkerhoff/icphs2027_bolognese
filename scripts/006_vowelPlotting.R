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
  ggplot2::facet_grid(. ~ vowel_length) +
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
  filename = here::here("output", "figs", "vowels_speaker.eps"),
  plot = vwls_speaker,
  dpi = 300,
  units = "in",
  width = 6,
  height = 4
)

ggplot2::ggsave(
  filename = here::here("output", "figs", "vowels_deltaF.eps"),
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
  # ggplot2::facet_wrap(. ~ vowel_length) +
  ggplot2::labs(
    title = "Prelateral Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::theme_bw() -> vwls_prelateral
vwls_prelateral

vwls_norm |>
  dplyr::filter(
    environment == "prelateral"
  ) |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel_quality
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_colour_okabe_ito() +
  # ggplot2::facet_wrap(. ~ vowel_length) +
  ggplot2::labs(
    # title = "Prelateral Vowels (∆F Normalized)",
    x = "F2 (∆F)",
    y = "F1 (∆F)",
    colour = "Vowel Quality"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "bottom")

ggplot2::ggsave(
  here::here(
    "output",
    "figs",
    "vowels_prelateral.pdf"
  ),
  plot = ggplot2::get_last_plot(),
  device = cairo_pdf,
  dpi = 300,
  units = "in",
  width = 6,
  height = 4
)

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

vwls_stress <- bolognese |>
  dplyr::filter(
    stress == TRUE,
    phoneme %in% mono
  ) |>
  dplyr::mutate(
    vowel_length = dplyr::case_when(
      phoneme %in% long ~ "long",
      TRUE ~ "short"
    ),
    vowel_quality = dplyr::case_when(
      phoneme %in% c("i", "iː") ~ "i",
      phoneme %in% c("a", "aː") ~ "a",
      phoneme %in% c("e", "eː") ~ "e",
      phoneme %in% c("o", "oː") ~ "o",
      phoneme %in% c("u", "uː") ~ "u",
      TRUE ~ phoneme
    )
  )


vwls_means <- vwls_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c("phoneme", "speaker")
  )

vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel_quality,
    # label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = vwls_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_colour_okabe_ito() +
  ggplot2::facet_wrap(. ~ speaker) +
  ggplot2::labs(
    # title = "∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)",
    color = "Vowel quality"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(
    legend.position = "bottom"
  ) -> icphs_plot

ggplot2::ggsave(
  here::here(
    "output",
    "figs",
    "vowel_speaker.pdf"
  ),
  plot = icphs_plot,
  device = cairo_pdf,
  dpi = 300,
  units = "in",
  width = 6,
  height = 4
)

vwls_norm |>
  dplyr::filter(
    speaker == "LL"
  ) |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel_quality,
    # label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = vwls_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_colour_okabe_ito() +
  # ggplot2::facet_wrap(. ~ speaker) +
  ggplot2::labs(
    # title = "∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)",
    color = "Vowel quality"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(
    legend.position = "bottom"
  )

ggplot2::ggsave(
  here::here(
    "output",
    "figs",
    "vowels_LL.pdf"
  ),
  plot = ggplot2::get_last_plot(),
  device = cairo_pdf,
  dpi = 300,
  units = "in",
  width = 6,
  height = 4
)

vwls_norm |>
  dplyr::filter(
    speaker == "RM"
  ) |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel_quality,
    # label = phoneme
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  # ggplot2::geom_label(data = vwls_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_colour_okabe_ito() +
  # ggplot2::facet_wrap(. ~ speaker) +
  ggplot2::labs(
    # title = "∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)",
    color = "Vowel quality"
  ) +
  ggplot2::theme_bw() +
  ggplot2::theme(
    legend.position = "bottom"
  )

ggplot2::ggsave(
  here::here(
    "output",
    "figs",
    "vowels_RM.pdf"
  ),
  plot = ggplot2::get_last_plot(),
  device = cairo_pdf,
  dpi = 300,
  units = "in",
  width = 6,
  height = 4
)
