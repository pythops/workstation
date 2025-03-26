return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-emoji",
    "f3fora/cmp-spell",
    "stevearc/dressing.nvim",
    "saecki/crates.nvim",
    "nvimdev/lspsaga.nvim",
    "Myriad-Dreamin/tinymist",
  },

  config = function()
    local signs = { Error = "⨯", Warn = "⚠️", Hint = "💡", Info = "" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      float = {
        border = "rounded",
        source = true,
      },
      severity_sort = true,
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      focusable = true,
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

    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>ff", "<cmd>Lspsaga finder<CR>", bufopts)
      vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga peek_definition<CR>", bufopts)
      vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts)
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
      end
    end

    -- Completion --
    local cmp = require("cmp")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp_document_symbol" },
        { name = "spell" },
        { name = "buffer" },
        { name = "crates" },
        { name = "emoji" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
    --

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- Lsp servers --

    -- rust --

    local crates = require("crates")
    crates.setup({
      lsp = {
        enabled = true,
        on_attach = on_attach,
        actions = true,
        completion = true,
        hover = true,
      },
      completion = {
        cmp = {
          enabled = true,
        },
      },
    })

    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = {
            allFeatures = true,
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
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- wgsl --
    lspconfig.wgsl_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

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

    lspconfig.ruff.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.pyright.setup({
      before_init = function(_, config)
        config.settings.python.pythonPath = get_python_path(config.root_dir)
      end,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Lua
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- Go --
    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
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

    -- Bash --
    lspconfig.bashls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Ansible --
    lspconfig.ansiblels.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Terraform --
    lspconfig.terraformls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Toml --
    require("lspconfig").taplo.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Typst --
    require("lspconfig").tinymist.setup({
      root_dir = ".",
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- Proto --
    require("lspconfig").buf_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
