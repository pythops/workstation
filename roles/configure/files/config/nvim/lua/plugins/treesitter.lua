return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context",
    "windwp/nvim-ts-autotag",
    "hiphish/rainbow-delimiters.nvim",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua", "rust", "markdown", "json", "yaml", "bash", "go" },

      sync_install = false,

      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      rainbow = {
        enable = true,
      },

      autotag = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    })

    require("treesitter-context").setup()
  end,
}
