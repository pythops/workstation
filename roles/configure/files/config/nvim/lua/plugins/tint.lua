-- Dim inactive windows
return {
  "levouh/tint.nvim",
  config = function()
    require("tint").setup({
      tint = -75,
      focus_change_events = { focus = { "FocusGained", "WinEnter" }, unfocus = { "FocusLost", "WinLeave" } },
    })
  end,
}
