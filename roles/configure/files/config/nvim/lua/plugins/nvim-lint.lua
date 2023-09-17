return {

  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      python = { "ruff", "flake8", "vulture" },
      yaml = { "yamllint" },
      markdown = { "vale" },
      dockerfile = { "hadolint" },
      ["yaml.github"] = { "actionlint", "yamllint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
