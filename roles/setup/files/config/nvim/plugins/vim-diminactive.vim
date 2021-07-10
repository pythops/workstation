let g:diminactive_enable_focus = 1
let g:diminactive_use_syntax = 0
let g:diminactive_use_colorcolumn = 1
if 1 && exists('+winhighlight')
  function! s:configure_winhighlight()
    let ft = &filetype
    let bt = &buftype
    " Check white/blacklist.
    if &diff || (index(['dirvish'], ft) == -1
          \ && (index(['nofile', 'nowrite', 'acwrite', 'quickfix', 'help'], bt) != -1
          \     || index(['startify'], ft) != -1))
      set winhighlight=NormalNC:MyNormalWin
    else
      set winhighlight=NormalNC:MyInactiveWin
    endif
  endfunction
  augroup inactive_win
    au!
    au ColorScheme * hi link MyInactiveWin ColorColumn
    au FileType,BufWinEnter * call s:configure_winhighlight()
    if exists('##OptionSet')
      " TODO: does not work with :Gdiff - diffsplit does not trigger it, too!
      au OptionSet diff call s:configure_winhighlight()
    endif
  augroup END
endif
