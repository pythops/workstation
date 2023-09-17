-- Highlight the word under the cursor
return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure()
  end,
}
