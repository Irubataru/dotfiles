vim.g.vimwiki_list = {
  { path = '~/Notes/', auto_toc = 1 }
}
vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_filetypes = { }

-- Disable certain mappings
-- table_mappings: These use <TAB> and <S-TAB> which conflicts with coc
vim.g.vimwiki_key_mappings = {
  table_mappings = 0
}
