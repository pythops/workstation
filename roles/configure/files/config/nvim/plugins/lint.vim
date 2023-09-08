lua <<EOF

  require('lint').linters_by_ft = {
    python = {"ruff", "flake8", "vulture"},
    sh = {"shellcheck"},
    yaml = {"yamllint"},
    markdown = {"vale"},
    dockerfile = {"hadolint"},
    ['yaml.ansible'] = {"ansible_lint", "yamllint"},
    ['yaml.github'] = {"actionlint", "yamllint"},
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })

EOF
