return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_format", "isort" },
        markdown = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        yaml = { "prettierd" },
        ["yaml.ansible"] = { "prettierd" },
        ["yaml.github"] = { "prettierd" },
        json = { "jq" },
        lua = { "stylua" },
        sh = { "shellcheck", "shfmt" },
        toml = { "taplo" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
