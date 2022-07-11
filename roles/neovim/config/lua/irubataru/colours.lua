vim.g.seoul256_srgb = 1

local colourscheme = "seoul256"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colourscheme)

if not status_ok then
  vim.notify("colourscheme " .. colourscheme .. " not found")
  vim.cmd [[
    colorscheme default
    set background=dark
  ]]
  return
end

vim.cmd [[
hi NormalFloat ctermfg=252 ctermbg=237 guifg=#d0d0d0 guibg=#3a3a3a
hi Float ctermfg=252 ctermbg=237 guifg=#d0d0d0 guibg=#3a3a3a
hi FloatBorder ctermfg=252 ctermbg=237 guifg=#d0d0d0 guibg=#3a3a3a

" No status line colours, hidden when lualine not active
hi StatusLine ctermfg=237 ctermbg=237 guifg=#3a3a3a guibg=#3a3a3a

" The linenr and gutter should have same bg as the rest
hi LineNr ctermbg=237 guibg=#3a3a3a
hi GitGutterAdd ctermbg=237 guibg=#3a3a3a
hi GitGutterChange ctermbg=237 guibg=#3a3a3a
hi GitGutterDelete ctermbg=237 guibg=#3a3a3a
hi GitGutterChangeDelete ctermbg=237 guibg=#3a3a3a
]]
