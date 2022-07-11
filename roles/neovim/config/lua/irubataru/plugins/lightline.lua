vim.g.lightline = {
  colorscheme =  'seoul256',
  enable = {
    tabline = 0,
  },
  active =  {
    left =  {
      { 'mode', 'paste' },
      { 'cocstatus', 'readonly', 'filename', 'modified' } }
    },
  }
