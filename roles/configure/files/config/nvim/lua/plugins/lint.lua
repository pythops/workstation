return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      ["yaml.github"] = { "actionlint" },
    }

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*",
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
