if true then
  return {}
end

return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<C-b>", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      {
        "<leader>F",
        function()
          require("fzf-lua").live_grep({
            winopts = { split = "belowright new" },
            resume = true,
          })
        end,
      },
      {
        "<leader>/",
        function()
          require("fzf-lua").live_grep({
            winopts = { split = "belowright new" },
            resume = true,
          })
        end,
      },
    },
  },
}
