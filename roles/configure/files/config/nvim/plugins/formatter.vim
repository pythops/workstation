lua <<EOF
    local util = require "formatter.util"
    require("formatter").setup {
      filetype = {
        rust = {
          require("formatter.filetypes.rust").rustfmt,
        },
        python= {
          require("formatter.filetypes.python").black,
          require("formatter.filetypes.python").isort,
          function()
            return {
              exe = "ruff",
              args = {
                "--fix",
              },
            }
          end
        },
        markdown = {
          require("formatter.defaults.prettier"),
        },
        html= {
          require("formatter.defaults.prettier"),
        },
        css= {
          require("formatter.defaults.prettier"),
        },
        yaml= {
          require("formatter.defaults.prettier"),
        },
        json = {
          require("formatter.filetypes.json").jq,
        },
        sh = {
          require("formatter.filetypes.sh").shfmt,
        },
        toml = {
          require("formatter.filetypes.toml").taplo,
        },
        terraform = {
          require("formatter.filetypes.terraform").terraform,
        },
        just = {
          function()
            return {
              exe = "just",
              args = {
                "--fmt --unstable",
              },
              stdin = true,
            }
          end
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    }
EOF

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
