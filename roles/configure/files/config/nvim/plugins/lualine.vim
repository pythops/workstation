lua << END
function file()
  local file_path = vim.fn.expand('%:p')
  file_path = string.gsub(file_path, os.getenv('HOME'), '~')
  return file_path
end

require('lualine').setup{
  options = {
    theme = 'gruvbox'
  },
  sections = {
    lualine_b = {'branch'},
    lualine_c = {file},
    lualine_y = {},
    lualine_x = {}
  }
}
END
