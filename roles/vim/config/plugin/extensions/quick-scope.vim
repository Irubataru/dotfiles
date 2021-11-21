" --------------------------- "
" quick-scope plugin settings "
" --------------------------- "

augroup quick_scope_settings
  autocmd!

  " Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
  " Note that you must use nmap/xmap instead of their non-recursive versions (nnoremap/xnoremap).
  nmap <leader>q <plug>(QuickScopeToggle)
  xmap <leader>q <plug>(QuickScopeToggle)

  " Trigger a highlight in the appropriate direction when pressing these keys:
  "let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

  " Trigger a highlight only when pressing f and F.
  "let g:qs_highlight_on_keys = ['f', 'F']

  let g:qs_buftype_blacklist = ['terminal', 'nofile']

augroup END
