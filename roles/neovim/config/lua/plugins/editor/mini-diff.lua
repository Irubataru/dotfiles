if true then
  return {}
end

return {
  {
    "nvim-mini/mini.diff",
    keys = {
      {
        "<leader>gO",
        function()
          require("mini.diff").toggle_overlay(0)
        end,
        desc = "Toggle mini.diff overlay",
      },
      {
        "<leader>go",
        false,
      },
    },
  },
}
