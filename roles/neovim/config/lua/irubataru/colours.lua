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

-- Set the terminal colors missing from the seoul256 colour scheme
if colourscheme == "seoul256" then
  vim.g.terminal_color_0 = "#4e4e4e"
  vim.g.terminal_color_1 = "#d68787"
  vim.g.terminal_color_2 = "#5f865f"
  vim.g.terminal_color_3 = "#d8af5f"
  vim.g.terminal_color_4 = "#85add4"
  vim.g.terminal_color_5 = "#d7afaf"
  vim.g.terminal_color_6 = "#87afaf"
  vim.g.terminal_color_7 = "#d0d0d0"
  vim.g.terminal_color_8 = "#626262"
  vim.g.terminal_color_9 = "#d75f87"
  vim.g.terminal_color_10 = "#87af87"
  vim.g.terminal_color_11 = "#ffd787"
  vim.g.terminal_color_12 = "#add4fb"
  vim.g.terminal_color_13 = "#ffafaf"
  vim.g.terminal_color_14 = "#87d7d7"
  vim.g.terminal_color_15 = "#e4e4e4"

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
end
