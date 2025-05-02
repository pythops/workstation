return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/dressing.nvim",
        "saecki/crates.nvim",
        "nvimdev/lspsaga.nvim",
        "Myriad-Dreamin/tinymist",
    },

    config = function()
        vim.diagnostic.config({
            virtual_text = false,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "⨯",
                    [vim.diagnostic.severity.WARN] = "⚠️",
                    [vim.diagnostic.severity.HINT] = "💡",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
            underline = true,
            update_in_insert = false,
            float = {
                border = "rounded",
                source = true,
            },
            severity_sort = true,
        })

        vim.o.updatetime = 250

        -- Function to check if a floating dialog exists and if not
        -- then check for diagnostics under the cursor
        function OpenDiagnosticIfNoFloat()
            for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                local config = vim.api.nvim_win_get_config(winid)
                if config.zindex and config.zindex > 20 then
                    return
                end
            end
            -- THIS IS FOR BUILTIN LSP
            vim.diagnostic.open_float(0, {
                focusable = false,
                close_events = {
                    "CursorMoved",
                    "CursorMovedI",
                    "BufHidden",
                    "InsertCharPre",
                    "WinLeave",
                },
            })
        end

        -- Show diagnostics under the cursor when holding position
        vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = "*",
            command = "lua OpenDiagnosticIfNoFloat()",
            group = "lsp_diagnostics_hold",
        })
        --

        -- Lsp Saga
        require("lspsaga").setup({
            lightbulb = { enable = false },
            symbol_in_winbar = { enable = false },
            definition = {
                width = 0.8,
                height = 0.9,
                keys = {
                    vsplit = "<leader>v",
                    split = "<leader>h",
                    edit = "<CR>",
                },
            },
        })
        --

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufopts = { noremap = true, silent = true, buffer = args.buf }

                vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga peek_definition<CR>", bufopts)
                vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, bufopts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
                vim.keymap.set("n", "<leader>h", function()
                    vim.lsp.buf.hover({ border = "single" })
                end, bufopts)

                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                -- Auto-format ("lint") on save.
                -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
                if
                    not client:supports_method("textDocument/willSaveWaitUntil")
                    and client:supports_method("textDocument/formatting")
                then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                        end,
                    })
                end

                if client:supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(true)
                end
            end,
        })

        -- Lsp servers --

        -- rust --

        local crates = require("crates")
        crates.setup({
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
            },
        })

        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    diagnostics = {
                        enable = true,
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    check = {
                        overrideCommand = {
                            "cargo",
                            "clippy",
                            "--workspace",
                            "--message-format=json",
                            "--all-targets",
                            "--all-features",
                        },
                    },
                },
            },
        })
        vim.lsp.enable("rust_analyzer")

        -- C --
        vim.lsp.enable("clangd")

        -- wgsl --
        vim.lsp.enable("wgsl_analyzer")

        -- Python --
        local util = require("lspconfig/util")
        local path = util.path
        local function get_python_path(workspace)
            -- Use activated virtualenv.
            if vim.env.VIRTUAL_ENV then
                return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
            end

            -- Find and use virtualenv in workspace directory.
            for _, pattern in ipairs({ "*", ".*" }) do
                local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
                if match ~= "" then
                    return path.join(path.dirname(match), "bin", "python")
                end
            end

            -- Fallback to system Python.
            return vim.fn.exepath("python3") or vim.fn.exepath("python")
        end

        vim.lsp.enable("ruff")

        vim.lsp.config("pyright", {
            before_init = function(_, config)
                config.settings.python.pythonPath = get_python_path(config.root_dir)
            end,
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
            },
        })
        vim.lsp.enable("pyright")

        -- Lua
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
        vim.lsp.enable("lua_ls")

        -- Go --
        vim.lsp.config("gopls", {
            settings = {
                gopls = {
                    gofumpt = true,
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                    analyses = {
                        fieldalignment = true,
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    usePlaceholders = true,
                    staticcheck = true,
                    semanticTokens = true,
                },
            },
        })
        vim.lsp.enable("gopls")

        -- Bash --
        vim.lsp.enable("bashls")

        -- Ansible --
        vim.lsp.enable("ansiblels")

        -- Terraform --
        vim.lsp.enable("terraformls")

        -- Toml --
        vim.lsp.enable("taplo")

        -- Typst --
        vim.lsp.enable("tinymist")

        -- Proto --
        vim.lsp.enable("buf_ls")
    end,
}
