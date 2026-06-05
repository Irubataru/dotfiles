if true then
  return {
    "nvim-mini/mini.pairs",
    enabled = false,
  }
end

return {
  {
    -- A plugin to automatically manage character pairs
    "nvim-mini/mini.pairs",
    config = function(_, opts)
      LazyVim.mini.pairs(opts)
      require("utils.keymaps").imap_cr()
    end,
  },
}
