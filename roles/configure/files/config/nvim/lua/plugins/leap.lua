return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
    vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
  end,
}
