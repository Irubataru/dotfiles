return {
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      -- Do not have Aerial as a pinned view
      opts.right = opts.right or {}
      for i = #opts.right, 1, -1 do
        if opts.right[i].title == "Aerial" or opts.right[i].ft == "aerial" then
          opts.right[i].pinned = false
        end
      end
    end,
  },
}
