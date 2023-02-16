local wezterm = require("wezterm")

return {
  term = "wezterm",
  font = wezterm.font({
    family = "Fira Code",
    stretch = "Expanded",
    weight = "Regular",
    italic = false,
  }),
  colors = {
    background = "#000000",
    foreground = "#ebdbb2",
    cursor_bg = "#ebdbb2",
    cursor_fg = "#000000",
    selection_bg = "#b8bb26",
    selection_fg = "#000000",
    ansi = {
      "#000000",
      "#cc241d",
      "#98971a",
      "#d79921",
      "#458588",
      "#b16286",
      "#689d6a",
      "#a89984",
    },
    brights = {
      "#606060",
      "#fb4935",
      "#b8bb26",
      "#fabd2f",
      "#83a598",
      "#d3869b",
      "#8ec07c",
      "#ebdbb2",
    },
  },

  underline_position = -4,

  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 500,
}
