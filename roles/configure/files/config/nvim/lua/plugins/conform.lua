return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        markdown = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        yaml = { "prettierd" },
        ["yaml.ansible"] = { "prettierd" },
        ["yaml.github"] = { "prettierd" },
        json = { "jq" },
        lua = { "stylua" },
        sh = { "shellcheck", "shfmt", "shellharden" },
        toml = { "taplo" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    require("conform").formatters.shfmt = {
      prepend_args = { "-i", "2" },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
