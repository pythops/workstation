return {
  "nvim-tree/nvim-web-devicons",
  dependencies = {
    "ziontee113/icon-picker.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>i", "<cmd>IconPickerNormal<cr>", opts)
    require("icon-picker").setup({ disable_legacy_commands = true })
  end,
}
