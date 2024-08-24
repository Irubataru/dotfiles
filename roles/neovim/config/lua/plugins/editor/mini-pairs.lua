return {
  {
    -- A plugin to automatically manage character pairs
    "echasnovski/mini.pairs",
    config = function(_, opts)
      LazyVim.mini.pairs(opts)
      require("utils.keymaps").imap_cr()
    end,
  },
}
