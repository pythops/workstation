return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "black" },
        markdown = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        yaml = { "prettierd" },
        ["yaml.ansible"] = { "prettierd" },
        ["yaml.github"] = { "prettierd" },
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
