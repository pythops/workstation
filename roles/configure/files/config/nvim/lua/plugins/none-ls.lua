return {
  "nvimtools/none-ls.nvim",
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- formatting
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.formatting.jq,
        null_ls.builtins.formatting.just,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { "yaml", "yaml.github", "yaml.ansible", "html", "css", "markdown" },
        }),
        null_ls.builtins.formatting.rustfmt.with({
          extra_args = { "--edition=2021" },
        }),
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,

        -- diagnostics
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.yamllint.with({
          filetypes = { "yaml", "yaml.github", "yaml.ansible" },
        }),
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.actionlint.with({
          filetypes = { "yaml.github" },
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
