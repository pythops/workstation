lua <<EOF
require("tint").setup({
  tint = -75,
  focus_change_events = { focus = { "FocusGained","WinEnter"  }, unfocus = { "FocusLost", "WinLeave" } }
})
EOF
