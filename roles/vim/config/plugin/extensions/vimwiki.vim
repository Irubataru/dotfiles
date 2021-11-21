let s:plugin_name = 'vimwiki'

let g:vimwiki_list = [{'path': '~/Notes/', 'auto_toc': 1}]
let g:vimwiki_hl_headers = 1
let g:vimwiki_folding = 'expr'
let g:vimwiki_global_ext = 0
let g:vimwiki_filetypes = [ ]

" Disable certain mappings
" table_mappings: These use <TAB> and <S-TAB> which conflicts with coc
let g:vimwiki_key_mappings =
      \ {
      \ 'table_mappings': 0
      \}

if has_key(g:plugs, s:plugin_name) && stridx(&rtp, g:plugs[s:plugin_name].dir)

  augroup filetype_vimwiki
  augroup END

endif
