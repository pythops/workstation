lua << EOF
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
        sources = {
            -- formatting
            null_ls.builtins.formatting.ruff,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.jq,
            null_ls.builtins.formatting.just,
            null_ls.builtins.formatting.terraform_fmt,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.taplo,
            null_ls.builtins.formatting.prettier.with {
                filetypes = {"yaml", "html", "css", "markdown"}
            },
            null_ls.builtins.formatting.rustfmt.with({
                extra_args = { "--edition=2021" }
            }),
            null_ls.builtins.formatting.trim_newlines,
            null_ls.builtins.formatting.trim_whitespace,

            -- diagnostics
            null_ls.builtins.diagnostics.ruff,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.yamllint,
            null_ls.builtins.diagnostics.hadolint,

            -- completion
            null_ls.builtins.completion.spell,

        },
         on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
    })
EOF
