return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local present, telescope = pcall(require, "telescope")

    if not present then
      return
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>s", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>g", builtin.grep_string, {})
    vim.keymap.set("n", "<leader>r", builtin.spell_suggest, {})
    vim.keymap.set("n", "<leader>e", builtin.diagnostics, {})

    local options = {
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--follow",
            "-g",
            "!.git",
            "-g",
            "!node_modules",
            "-g",
            "!.venv",
          },
        },
      },
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }

    telescope.setup(options)
    telescope.load_extension("fzf")
    require("telescope").load_extension("ui-select")
  end,
}
