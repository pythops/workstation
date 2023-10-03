return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "black" },
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        yaml = { "prettier" },
        ["yaml.ansible"] = { "prettier" },
        ["yaml.github"] = { "prettier" },
        json = { "jq" },
        lua = { "stylua" },
        sh = { "shfmt" },
        toml = { "taplo" },
        terraform = { "terraform" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
